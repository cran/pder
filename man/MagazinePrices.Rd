\name{MagazinePrices}
\docType{data}
\alias{MagazinePrices}
\title{Magazine Prices }
\description{
  yearly observations of  38 magazines from 1940  to 1980

 \emph{number of observations} :  1262

   \emph{country} :  United States

\emph{economic topic} : industrial organization

\emph{econometrics topic} : binomial variable

}
\usage{data(MagazinePrices)}
\format{A dataframe containing :
  \describe{
    \item{year}{the year}
    \item{magazine}{the magazine name}
    \item{price}{the price of the magazine in january}
    \item{change}{has the price changed between january of the current year and january of the following year ?}
    \item{length}{number of years since the previous price change}
    \item{cpi}{gdp deflator index}
    \item{cuminf}{cummulative change in inflation since the previous price change}
    \item{sales}{single copy sales of magazines for magazine industry }
    \item{cumsales}{cumulative change in magazine industry sales since previous price change}
    \item{included}{is the observation included in the econometric analysis ?}
    \item{id}{group index numbers used for the conditional logit estimation}
  }
}
\source{
    Journal of Applied Econometrics data archive : \url{http://jae.wiley.com/jae/}.

}
\references{
    Willis, Jonathan L. (2006) \dQuote{Magazine prices revisited}, \emph{Journal of Applied Econometrics}, \bold{21(3)}, april, 337-344.

    Cecchetti, Stephen G. (1986) \dQuote{The frequency of price adjustment, a study of newsstand prices of magazines}, \emph{Journal of Econometrics}, \bold{31}, 255-274.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
