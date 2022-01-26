\name{Reelection}
\docType{data}
\alias{Reelection}
\title{Deficits and Reelection}
\description{yearly observations of 75 countries from 1960 to 2003

    \emph{number of observations} : 439

    \emph{number of  time-series } :  16 

    \emph{country} :  world 

    \emph{package} : panelbinomial

    \emph{JEL codes: }D72, E62, H62, O47

    \emph{Chapter} : 08

}
\usage{data(Reelection)}
\format{A dataframe containing:
  \describe{
    \item{country}{the country}
    \item{year}{the year}
    \item{narrow}{\code{TRUE} if the observation belongs to the narrow data set}
    \item{reelect}{one if the incumbent was reelected and zero otherwise}
    \item{ddefterm}{the change in the ratio of the government surplus to gdp in the two years preeceding the election year, relative to the two previous years}
    \item{ddefey}{the change in the government surplus ratio to gdpin the election year, compared to the previous year}
    \item{gdppc}{the average growth rate of real per capita gdp during the leader's current term}
    \item{dev}{one for developped countries, 0 otherwise}
    \item{nd}{one for a new democratic country, 0 otherwise}
    \item{maj}{one for majoritarian electoral system, 0 otherwise}
  }
}
\source{American Economic Association Data Archive : \url{https://www.aeaweb.org/aer/}}
\references{
Adi Brender and Allan Drazen (2008) \dQuote{How Do Budget Deficits and Economic Growth Affect Reelection Prospects? Evidence From a Large Panel of Countries}, \emph{American Economic Review}, \bold{98(5)}, 2203-2220, \doi{10.1257/aer.98.5.2203}
.

}
\keyword{datasets}
\examples{


#### Example 8-1

## ------------------------------------------------------------------------
\dontrun{
library("plm")
data("Reelection", package = "pder")

## ------------------------------------------------------------------------
elect.l <- glm(reelect ~ ddefterm + ddefey + gdppc + dev + nd + maj, 
          data = Reelection, family = "binomial", subset = narrow)
l2 <- update(elect.l, family = binomial)
l3 <- update(elect.l, family = binomial())
l4 <- update(elect.l, family = binomial(link = 'logit'))

## ------------------------------------------------------------------------
elect.p <- update(elect.l, family = binomial(link = 'probit'))

## ------------------------------------------------------------------------

if (requireNamespace("pglm")){
    library("pglm")
    elect.pl <- pglm(reelect ~ ddefterm + ddefey + gdppc + dev + nd + maj, 
                 Reelection, family = binomial(link = 'logit'), 
                subset = narrow)
    elect.pp <- pglm(reelect ~ ddefterm + ddefey + gdppc + dev + nd + maj, 
                 Reelection, family = binomial(link = 'probit'), 
                subset = narrow)
}
}
}

