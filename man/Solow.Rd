\name{Solow}
\docType{data}
\alias{Solow}
\title{Growth Model}
\description{yearly observations of 97 countries from 1960 to 1985

    \emph{number of observations} : 576

    \emph{number of  time-series } :  6 

    \emph{country} :  world 

    \emph{package} : panel

    \emph{JEL codes: }O47, O41

    \emph{Chapter} : 07

}
\usage{data(Solow)}
\format{A dataframe containing:
  \describe{
    \item{id}{country id}
    \item{year}{year}
    \item{lgdp}{log of gdp per capita}
    \item{lsrate}{log of the saving rate, approximated by the investement rate}
    \item{lpopg}{log of population growth + 0.05 (which is an approximation of the sum of the rate of labor-augmenting technological progress and of the rate of depreciation of physical capital)}
  }
}
\source{author's website \url{https://www.nuffield.ox.ac.uk/users/bond/index.html}}
\references{
Caselli, Francesco; Esquivel, Gerardo and Fernando Lefort (1996) \dQuote{Reopening the Convergence Debate: a New Look at Cross-country Growth Empirics}, \emph{Journal of Economic Growth}, \bold{1}, 363-389, \doi{10.1007/BF00141044}
.

Bond, Stephen; Hoeffler, Anke and Johnatan Temple (2001) \dQuote{GMM Estimation of Empirical Growth Model}, \emph{CEPR Discussion Paper}, \bold{3048}, 1-33.

}
\keyword{datasets}
