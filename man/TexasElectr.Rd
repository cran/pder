\name{TexasElectr}
\docType{data}
\alias{TexasElectr}
\title{Production of Electricity in Texas}
\description{yearly observations of 10 firms from 1966 to 1983

    \emph{number of observations} : 180

    \emph{number of  time-series } :  18 

    \emph{country} :  Texas 

    \emph{package} : productionpanel

    \emph{JEL codes: }D24, C13, C51, C23, J31

    \emph{Chapter} : 02, 03

}
\usage{data(TexasElectr)}
\format{A dataframe containing:
  \describe{
    \item{id}{the firm identifier}
    \item{year}{the year, from 1966 to 1983}
    \item{output}{output}
    \item{pfuel}{price of fuel}
    \item{plab}{price of labor}
    \item{pcap}{price of capital}
    \item{expfuel}{expense in fuel}
    \item{explab}{expense in labor}
    \item{expcap}{expense in capital}
  }
}
\source{Journal of Applied Econometrics Data Archive : \url{http://qed.econ.queensu.ca/jae/}}
\references{
Kumbhakar SC (1996) \dQuote{Estimation of Cost Efficiency with Heteroscedasticity: An Application to Electric Utilities}, \emph{Journal of the Royal Statistical Society, Series D}, \bold{45}, 319--335.

Horrace and Schmidt (1996) \dQuote{Confidence Statements for Efficiency Estimates From Stochastic Frontier Models}, \emph{Journal of Productity Analysis}, \bold{7}, 257--282, \doi{10.1007/BF00157044}
.

Horrace and Schmidt (2012) \dQuote{Multiple Comparisons with the Best, with Economic Applications}, \emph{Journal of Applied Econometrics}, \bold{15(1)}, 1--26, \doi{10.1002/(SICI)1099-1255(200001/02)15:1<1::AID-JAE551>3.0.CO;2-Y}
.

}
\keyword{datasets}
\examples{
#### Example 2-6

## ------------------------------------------------------------------------
data("TexasElectr", package = "pder")
library("plm")
TexasElectr$cost <- with(TexasElectr, explab + expfuel + expcap)
TE <- pdata.frame(TexasElectr)
summary(log(TE$output))
ercomp(log(cost) ~ log(output), TE)
models <- c("within", "random", "pooling", "between")
sapply(models, function(x)
       coef(plm(log(cost) ~ log(output), TE, model = x))["log(output)"])

#### Example 3-2

## ------------------------------------------------------------------------
data("TexasElectr", package = "pder")

if (requireNamespace("dplyr")){
    library("dplyr")
    TexasElectr <- mutate(TexasElectr,
                          pf = log(pfuel / mean(pfuel)),
                          pl = log(plab / mean(plab)) - pf,
                          pk = log(pcap / mean(pcap)) - pf)

## ------------------------------------------------------------------------
    TexasElectr <- mutate(TexasElectr, q = log(output / mean(output)))

## ------------------------------------------------------------------------
    TexasElectr <- mutate(TexasElectr,
                          C = expfuel + explab + expcap,
                          sl = explab / C,
                          sk = expcap / C,
                          C = log(C / mean(C)) - pf)
    
## ------------------------------------------------------------------------
    TexasElectr <- mutate(TexasElectr,
                          pll = 1/2 * pl ^ 2,
                          plk = pl * pk,
                          pkk = 1/2 * pk ^ 2,
                          qq = 1/2 * q ^ 2)

## ------------------------------------------------------------------------
    cost <- C ~ pl + pk + q + pll + plk + pkk + qq
    shlab <- sl ~ pl + pk
    shcap <- sk ~ pl + pk

## ------------------------------------------------------------------------
    R <- matrix(0, nrow = 6, ncol = 14)
    R[1, 2] <- R[2, 3] <- R[3, 5] <- R[4, 6] <- R[5, 6] <- R[6, 7] <- 1
    R[1, 9] <- R[2, 12] <- R[3, 10] <- R[4, 11] <- R[5, 13] <- R[6, 14] <- -1

## ------------------------------------------------------------------------
    z <- plm(list(cost = C ~ pl + pk + q + pll + plk + pkk + qq,
                  shlab = sl ~ pl + pk,
                  shcap = sk ~ pl + pk),
             TexasElectr, model = "random",
             restrict.matrix = R)
    summary(z)
}

}

