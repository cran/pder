\name{ScrambleAfrica}
\docType{data}
\alias{ScrambleAfrica}
\title{the Long-run Effects of the Scramble for Africa }
\description{
  a cross-section

 \emph{number of observations} :  1212

   \emph{country} :  Africa

\emph{economic topic} : economic development, innovation, technological change, and growth

\emph{econometrics topic} : count data

}
\usage{data(ScrambleAfrica)}
\format{A dataframe containing :
  \describe{
    \item{country}{ country code}
    \item{group}{ethnic group name}
    \item{conflicts}{number of conflicts}
    \item{split}{dummy for partitioned ethnic area}
    \item{spillover}{spillover index, the fraction of adjacent groups in the same country that are partitioned}
    \item{region}{the region}
    \item{pop}{population according to the first post-independance census}
    \item{area}{land area}
    \item{lake}{lakes dummy}
    \item{river}{rivers dummy}
    \item{capital}{dummy if a capital city falls in the homeland of an ethnic group}
    \item{borderdist}{distance of the centroid of the area from the national border}
    \item{capdist}{distance of the centroid of the area from the capital}
    \item{seadist}{distance of the centroid of the area from the sea coast}
    \item{coastal}{dummy for areas that are by the sea coast}
    \item{meanelev}{mean elevation}
    \item{agriculture}{index of land suitability for agriculture}
    \item{diamond}{diamond mine indicator}
    \item{malaria}{malaria stability index}
    \item{petroleum}{oil field indicator}
    \item{island}{island dummy}
    \item{city1400}{dummy for areas with major city in 1400}
  }
}
\references{
    Michalopoulos, Stelios  and  Elias  Papaioannou (2016) \dQuote{The long-run effects of the scramble for Africa}, \emph{American Economic Review}, \bold{106(7)}, 1802--1848.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
