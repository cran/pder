\name{HousePricesUS}
\docType{data}
\alias{HousePricesUS}
\title{House Prices Data }
\description{
   observations of  49 regions from 1976  to 2003

 \emph{number of observations} :  1421

   \emph{country} :  United States

\emph{economic topic} : urban, rural, regional, real estate and transportation economics

\emph{econometrics topic} : spatial data

}
\usage{data(HousePricesUS)}
\format{A dataframe containing :
  \describe{
    \item{state}{state index}
    \item{year}{year}
    \item{names}{state name}
    \item{plate}{state number plate index}
    \item{region}{region index}
    \item{region.name}{region name}
    \item{price}{real house price index, 1980=100}
    \item{income}{real per-capita income}
    \item{pop}{total population}
    \item{intrate}{real interest rate on borrowing}
  }
}
\source{
    Journal of Applied Econometrics data archive : \url{http://jae.wiley.com/jae/}.

}
\references{
    Holly, S.,  M.G.   Pesaran and  T.  Yamagata (2020) \dQuote{A spatio-temporal model of house prices in the USA}, \emph{Journal of Econometircs}, \bold{158(1)}, 160--173.

    Millo, Giovanni (2015) \dQuote{Narrow Replication of 'A Spatio-Temporal Model of House Prices in the Usa' Using R}, \emph{Journal of Applied Econometrics}, \bold{30(4)}, 703--704.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
