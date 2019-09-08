\name{TobinQ}
\docType{data}
\alias{TobinQ}
\title{The Q Theory of Investment}
\description{yearly observations of 188  from 1951 to 1985

    \emph{number of observations} : 6580

    \emph{number of  time-series } :  35 

    \emph{country} :  United States 

    \emph{Chapter} : 02

}
\usage{data(TobinQ)}
\format{A dataframe containing:
  \describe{
    \item{cusip}{compustat's identifying number}
    \item{year}{year}
    \item{isic}{sic industry classification}
    \item{ikb}{investment divided by capital : broad definition}
    \item{ikn}{investment divided by capital : narrow definition}
    \item{qb}{Tobin's Q : broad definition}
    \item{qn}{Tobin's Q : narrow definition}
    \item{kstock}{capital stock}
    \item{ikicb}{investment divided by capital with imperfect competition : broad definition}
    \item{ikicn}{investment divided by capital with imperfect competition : narrow definition}
    \item{omphi}{one minus phi (see the article p. 320)}
    \item{qicb}{Tobin's Q with imperfect competition : broad definition}
    \item{qicn}{Tobin's Q with imperfect competition : narrow definition}
    \item{sb}{S (see equation 10 p. 320) : broad definition}
    \item{sn}{S (see equation 10 p. 320) : narrow definition}
  }
}
\source{Journal of Applied Econometrics Data Archive : \url{http://qed.econ.queensu.ca/jae/}}
\references{
Schaller, Huntley (1990) \dQuote{A Re-examination of the Q Theory of Investment Using U.S. Firm Data}, \emph{Journal of Applied Econometrics}, \bold{5(4)}, 309--325, \doi{10.1002/jae.3950050402}
.

}
\keyword{datasets}
\examples{
#### Example 2-1

## ------------------------------------------------------------------------
library("plm")
data("TobinQ", package = "pder")

## ------------------------------------------------------------------------
pTobinQ <- pdata.frame(TobinQ)
pTobinQa <- pdata.frame(TobinQ, index = 188)
pTobinQb <- pdata.frame(TobinQ, index = c('cusip'))
pTobinQc <- pdata.frame(TobinQ, index = c('cusip', 'year'))

## ------------------------------------------------------------------------
pdim(pTobinQ)

## ----results = 'hide'----------------------------------------------------
pdim(TobinQ, index = 'cusip')
pdim(TobinQ)

## ------------------------------------------------------------------------
head(index(pTobinQ))

## ------------------------------------------------------------------------
Qeq <- ikn ~ qn
Q.pooling <- plm(Qeq, pTobinQ, model = "pooling")
Q.within <- update(Q.pooling, model = "within")
Q.between <- update(Q.pooling, model = "between")

## ------------------------------------------------------------------------
Q.within
summary(Q.within)

## ------------------------------------------------------------------------
head(fixef(Q.within))
head(fixef(Q.within, type = "dfirst"))
head(fixef(Q.within, type = "dmean"))

## ------------------------------------------------------------------------
head(coef(lm(ikn ~ qn + factor(cusip), pTobinQ)))


#### Example 2-2

## ------------------------------------------------------------------------
Q.swar <- plm(Qeq, pTobinQ, model = "random", random.method = "swar")
Q.swar2 <- plm(Qeq, pTobinQ, model = "random",
               random.models = c("within", "between"),
               random.dfcor = c(2, 2))
summary(Q.swar)

## ------------------------------------------------------------------------
ercomp(Qeq, pTobinQ)
ercomp(Q.swar)

## ------------------------------------------------------------------------
Q.walhus <- update(Q.swar, random.method = "swar")
Q.amemiya <- update(Q.swar, random.method = "amemiya")
Q.nerlove <- update(Q.swar, random.method = "nerlove")
Q.models <- list(swar = Q.swar, walhus = Q.walhus,
                 amemiya = Q.amemiya, nerlove = Q.nerlove)
sapply(Q.models, function(x) ercomp(x)$theta)
sapply(Q.models, coef)


#### Example 2-3

## ------------------------------------------------------------------------
sapply(list(pooling = Q.pooling, within = Q.within,
            between = Q.between, swar = Q.swar),
       function(x) coef(summary(x))["qn", c("Estimate", "Std. Error")])

## ------------------------------------------------------------------------
summary(pTobinQ$qn)

## ------------------------------------------------------------------------
SxxW <- sum(Within(pTobinQ$qn) ^ 2)
SxxB <- sum((Between(pTobinQ$qn) - mean(pTobinQ$qn)) ^ 2)
SxxTot <- sum( (pTobinQ$qn - mean(pTobinQ$qn)) ^ 2)
pondW <- SxxW / SxxTot
pondW
pondW * coef(Q.within)[["qn"]] +
  (1 - pondW) * coef(Q.between)[["qn"]]

## ------------------------------------------------------------------------
T <- 35
N <- 188
smxt2 <- deviance(Q.between) * T / (N - 2)
sidios2 <- deviance(Q.within) / (N * (T - 1) - 1)
phi <- sqrt(sidios2 / smxt2)

## ------------------------------------------------------------------------
pondW <- SxxW / (SxxW + phi^2 * SxxB)
pondW
pondW * coef(Q.within)[["qn"]] +
  (1 - pondW) * coef(Q.between)[["qn"]]

#### Example 2-8

## ------------------------------------------------------------------------
Q.models2 <- lapply(Q.models, function(x) update(x, effect = "twoways"))
sapply(Q.models2, function(x) sqrt(ercomp(x)$sigma2))
sapply(Q.models2, function(x) ercomp(x)$theta)

}

