\name{ForeignTrade}
\docType{data}
\alias{ForeignTrade}
\title{Foreign Trade of Developing Countries}
\description{yearly observations of 31 countries from 1963 to 1986

    \emph{number of observations} : 744

    \emph{number of  time-series } :  24 

    \emph{country} :  developing countries 

    \emph{JEL codes: }O19, C51, F17

    \emph{Chapter} : 02, 06

}
\usage{data(ForeignTrade)}
\format{A dataframe containing:
  \describe{
    \item{country}{country name}
    \item{year}{year}
    \item{exports}{nominal exports deflated by the unit value of exports per capita}
    \item{imports}{nominal imports deflated by the unit value of exports per capita}
    \item{resimp}{official foreing reserves (in US dollars) divided by nominal imports (in US dollars)}
    \item{gnp}{real GNP per capita}
    \item{pgnp}{trend real GNP per capita calculated by fitting linear trend yit*=y0iexp(gi t), where y0i is the initial value of real gnp per capita for country i and gi is the ith country's average growth rate over 1964-1986}
    \item{gnpw}{real genp for USA per capita}
    \item{pm}{unit value of imports (in US dollars), 1980 = 100}
    \item{px}{unit value of exports (in US dollars), 1980 = 100}
    \item{cpi}{domestic CPI, 1980 = 100}
    \item{pw}{US producer's price index, 1980 = 100}
    \item{exrate}{exchange rate (price of US dollars in local currency), 1980 = 1}
    \item{consump}{domestic consumption per capita,}
    \item{invest}{domestic fixed gross investment per capita}
    \item{income}{domestic disposable income per capita}
    \item{pop}{population}
    \item{reserves}{official foreing reserves (in US dollars)}
    \item{money}{domestic money supply per capita}
    \item{trend}{trend dummy, 1964 = 1}
    \item{pwcpi}{log of us producer price index divided by domestic cpi}
    \item{importspmpx}{log of nominal imports divided by export prices}
    \item{pmcpi}{log of imports price divided by domestic cpi}
    \item{pxpw}{log of exports price divided by domestic cpi}
  }
}
\source{Journal of Applied Econometrics Data Archive : \url{http://qed.econ.queensu.ca/jae/}}
\references{
Kinal, T. and K. Lahiri (1993) \dQuote{On the Estimation of Simultaneous-equations Error-components Models with An Application to a Model of Developing Country Foreign Trade}, \emph{Journal of Applied Economics}, \bold{8}, 81-92, \doi{10.1002/jae.3950080107}
.

}
\keyword{datasets}
\examples{
#### Example 2-4

## ------------------------------------------------------------------------
library("plm")
data("ForeignTrade", package = "pder")
FT <- pdata.frame(ForeignTrade)
summary(FT$gnp)
ercomp(imports ~ gnp, FT)
models <- c("within", "random", "pooling", "between")
sapply(models, function(x) coef(plm(imports ~ gnp, FT, model = x))["gnp"])


#### Example 6-2

## ------------------------------------------------------------------------
data("ForeignTrade", package = "pder")
w1 <- plm(imports~pmcpi + gnp + lag(imports) + lag(resimp)  |
          lag(consump) + lag(cpi) + lag(income) + lag(gnp) + pm +
          lag(invest) + lag(money) + gnpw + pw + lag(reserves) +
          lag(exports) + trend + pgnp + lag(px),
          ForeignTrade, model = "within")
r1 <- update(w1, model = "random", random.method = "nerlove", 
             random.dfcor = c(1, 1), inst.method = "baltagi")

## ------------------------------------------------------------------------
phtest(r1, w1)

## ------------------------------------------------------------------------
r1b <- plm(imports ~ pmcpi + gnp + lag(imports) + lag(resimp) |
            lag(consump) + lag(cpi) + lag(income) + lag(px) + 
            lag(reserves) + lag(exports) | lag(gnp) + pm + 
            lag(invest) + lag(money) + gnpw + pw  + trend + pgnp,
            ForeignTrade, model = "random", inst.method = "baltagi", 
            random.method = "nerlove", random.dfcor = c(1, 1))

phtest(w1, r1b)

## ------------------------------------------------------------------------
rbind(within = coef(w1), ec2sls = coef(r1b)[-1])

## ------------------------------------------------------------------------
elast <- sapply(list(w1, r1, r1b), 
                function(x) c(coef(x)["pmcpi"], 
                              coef(x)["pmcpi"] / (1 - coef(x)["lag(imports)"])))
dimnames(elast) <- list(c("ST", "LT"), c("w1", "r1", "r1b"))
elast

## ------------------------------------------------------------------------
rbind(within = coef(summary(w1))[, 2], 
      ec2sls = coef(summary(r1b))[-1, 2])

#### Example 6-4

## ------------------------------------------------------------------------
eqimp <- imports ~ pmcpi + gnp + lag(imports) + 
                lag(resimp) | lag(consump) + lag(cpi) + lag(income) + 
                lag(px) + lag(reserves) + lag(exports) | lag(gnp) + pm + 
                lag(invest) + lag(money) + gnpw + pw  + trend + pgnp
eqexp <- exports ~ pxpw + gnpw + lag(exports) |
                lag(gnp) + pw + lag(consump) + pm + lag(px) + lag(cpi) | 
                lag(money) + gnpw +  pgnp + pop + lag(invest) + 
                lag(income) + lag(reserves) + exrate
r12 <- plm(list(import.demand = eqimp,
                export.demand = eqexp),
           data = ForeignTrade, index = 31, model = "random", 
           inst.method = "baltagi", random.method = "nerlove",
           random.dfcor = c(1, 1))
summary(r12)

## ------------------------------------------------------------------------
rbind(ec2sls = coef(summary(r1b))[-1, 2],
      ec3sls = coef(summary(r12), "import.demand")[-1, 2])
}

