\name{IncomeMigrationH}
\docType{data}
\alias{IncomeMigrationH}
\title{Income and Migration (household Data) }
\description{
  yearly observations of  317 households from 2000  to 2006

 \emph{number of observations} :  2219

   \emph{country} :  Indonesia

\emph{economic topic} : economic development, innovation, technological change, and growth

\emph{econometrics topic} : censored and truncated variable

}
\usage{data(IncomeMigrationH)}
\format{A dataframe containing :
  \describe{
    \item{household}{household index}
    \item{year}{the year}
    \item{migration}{a dummy indicating whether a household has any migrant departing in year t+1}
    \item{price}{rice price shock}
    \item{rain}{rain shock}
    \item{land}{landholdings (ha)}
  }
}
\source{
    American Economic Association's website \url{http://www.aeaweb.org}.

}
\references{
    Bazzi, Samuel (2017) \dQuote{Wealth heterogeneity and the income elasticity of migration}, \emph{American Economic Journal, Applied Economics}, \bold{9(2)}, 219--255.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
