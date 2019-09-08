\name{FinanceGrowth}
\docType{data}
\alias{FinanceGrowth}
\title{Financial Institutions and Growth}
\description{5-yearly observations of 78 countries from 1960 to 1995

    \emph{number of observations} : 546

    \emph{number of  time-series } :  7 

    \emph{country} :  world 

    \emph{JEL codes: }G20, O16, O47, C23, C33, O15

    \emph{Chapter} : 07

}
\usage{data(FinanceGrowth)}
\format{A dataframe containing:
  \describe{
    \item{country}{country name}
    \item{period}{period}
    \item{growth}{growth rate * 100}
    \item{privo}{log private credit / GDP}
    \item{lly}{log liquid liabilities / GDP}
    \item{btot}{log bank credit/total credit}
    \item{lgdp}{log initial gdp per capita (PPP)}
    \item{sec}{mean years of secondary schooling}
    \item{gov}{log government spending / GDP}
    \item{lbmp}{log(1  black market premium)}
    \item{lpi}{log(1 + inflation rate)}
    \item{trade}{log (imports + exports)/GDP}
  }
}
\source{\url{http://www.cgdev.org/content/publications/detail/14256}}
\references{
Levine, Ross; Loayza, Norman and Thorsten Beck (2000) \dQuote{Financial Intermediation and Growth: Causality and Causes}, \emph{Journal of Monetary Economics}, \bold{46}, 31-77, \doi{10.1016/S0304-3932(00)00017-9}
.

Roodman, David (2009) \dQuote{A Note on the Theme of Two Many Instruments}, \emph{Oxford Bulletin of Economics An Statistics}, \bold{71(1)}, 135--158, \doi{10.1111/j.1468-0084.2008.00542.x}
.

}
\keyword{datasets}
