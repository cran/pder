\name{Dialysis}
\docType{data}
\alias{Dialysis}
\title{Diffusion of Haemodialysis Technology}
\description{yearly observations of 50 states from 1977 to 1990

    \emph{number of observations} : 700

    \emph{number of  time-series } :  14 

    \emph{country} :  United States 

    \emph{JEL codes: }I18, O31

    \emph{Chapter} : 09

}
\usage{data(Dialysis)}
\format{A dataframe containing:
  \describe{
    \item{state}{the state id}
    \item{time}{the year of observation}
    \item{diffusion}{the number of equipment divided by the number of the equipment in the given state for the most recent period}
    \item{trend}{a linear trend}
    \item{regulation}{a dummy variable for the presence of a certificate of need regulation for the given state and the given period}
  }
}
\source{Journal of Applied Econometrics Data Archive : \url{http://qed.econ.queensu.ca/jae/}}
\references{
Steven B. Caudill, Jon M. Ford and David L. Kaserman (1995) \dQuote{Certificate of Need Regulation and the Diffusion of Innovations : a Random Coefficient Model}, \emph{Journal of Applied Econometrics}, \bold{10}, 73--78., \doi{10.1002/jae.3950100107}
.

}
\keyword{datasets}
\examples{

#### Example 9-1

## ------------------------------------------------------------------------
library("plm")

## ------------------------------------------------------------------------
data("Dialysis", package = "pder")
rndcoef <- pvcm(log(diffusion / (1 - diffusion)) ~ trend + trend:regulation, 
                 Dialysis, model="random")
summary(rndcoef)

## ------------------------------------------------------------------------
cbind(coef(rndcoef), stdev = sqrt(diag(rndcoef$Delta)))


}

