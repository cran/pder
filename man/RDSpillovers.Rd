\name{RDSpillovers}
\docType{data}
\alias{RDSpillovers}
\title{Research and Development Spillovers Data }
\description{
  yearly observations of  509 firms from 1982  to 1989

 \emph{number of observations} :  2637

   \emph{country} :  world

\emph{economic topic} : economic development, innovation, technological change, and growth

\emph{econometrics topic} : cross-sectional dependence

}
\usage{data(RDSpillovers)}
\format{A time serie containing :
  \describe{
    \item{id}{country-indistry index}
    \item{year}{year}
    \item{country}{country}
    \item{sector}{manufacturing sector as SIC 15-37, excluding SIC 23}
    \item{lny}{log output}
    \item{lnl}{log of labour input}
    \item{lnk}{log of physical capital stock}
    \item{lnrd}{log of RD capital stock}
  }
}
\source{
    author's web site \url{https://sites.google.com/site/medevecon/home}.

}
\references{
    Eberhardt, M.,  C.   Helmers and  H.  Strauss (2013) \dQuote{Do spillovers matter in estimating private returns to R and D?}, \emph{the Review of Economics and Statistics}, \bold{95(2)}, 436--448.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
