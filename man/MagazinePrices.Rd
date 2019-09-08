\name{MagazinePrices}
\docType{data}
\alias{MagazinePrices}
\title{Magazine Prices}
\description{yearly observations of 38 magazines from 1940 to 1980

    \emph{number of observations} : 1262

    \emph{number of  time-series } :  41 

    \emph{country} :  United States 

    \emph{JEL codes: }L82

    \emph{Chapter} : 08

}
\usage{data(MagazinePrices)}
\format{A dataframe containing:
  \describe{
    \item{year}{the year}
    \item{magazine}{the magazine name}
    \item{price}{the price of the magazine in january}
    \item{change}{has the price changed between january of the current year and january of the following year ?}
    \item{length}{number of years since the previous price change}
    \item{cpi}{gdp deflator index}
    \item{cuminf}{cummulative change in inflation since the previous price change}
    \item{sales}{single copy sales of magazines for magazine industry}
    \item{cumsales}{cumulative change in magazine industry sales since previous price change}
    \item{included}{is the observation included in the econometric analysis ?}
    \item{id}{group index numbers used for the conditional logit estimation}
  }
}
\source{Journal of Applied Econometrics Data Archive : \url{http://qed.econ.queensu.ca/jae/}}
\references{
Willis, Jonathan L. (2006) \dQuote{Magazine Prices Revisited}, \emph{Journal of Applied Econometrics}, \bold{21(3)}, 337-344, \doi{10.1002/jae.836}
.

Cecchetti, Stephen G. (1986) \dQuote{The Frequency of Price Adjustment, a Study of Newsstand Prices of Magazines}, \emph{Journal of Econometrics}, \bold{31}, 255-274, \doi{10.1016/0304-4076(86)90061-8}
.

}
\keyword{datasets}
\examples{

#### Example 8-3

## ------------------------------------------------------------------------
data("MagazinePrices", package = "pder")
logitS <- glm(change ~ length + cuminf + cumsales, data = MagazinePrices, 
              subset = included == 1, family = binomial(link = 'logit'))
logitD <- glm(change ~ length + cuminf + cumsales + magazine, 
              data = MagazinePrices, 
              subset = included == 1, family = binomial(link = 'logit'))
library("survival")
logitC <- clogit(change ~ length + cuminf + cumsales + strata(id), 
                 data = MagazinePrices,
                 subset = included == 1)
library("texreg")
screenreg(list(logit = logitS, "FE logit" = logitD,
"cond. logit" = logitC), omit.coef = "magazine")
}

