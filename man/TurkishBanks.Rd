\name{TurkishBanks}
\docType{data}
\alias{TurkishBanks}
\title{Turkish Banks}
\description{yearly observations of 53 banks from 1990 to 2000

    \emph{number of observations} : 583

    \emph{number of  time-series } :  11 

    \emph{country} :  Turkey 

    \emph{package} : productionpanel

    \emph{JEL codes: }D24, G21, L33

    \emph{Chapter} : 02

}
\usage{data(TurkishBanks)}
\format{A dataframe containing:
  \describe{
    \item{id}{bank id}
    \item{year}{the years}
    \item{type}{one of \code{"conventional"} and \code{"islamic"}}
    \item{pl}{price of labor}
    \item{pf}{price of borrowed funds}
    \item{pk}{price of physical capital}
    \item{output}{output, total loans}
    \item{cost}{total cost}
    \item{empexp}{employee expenses}
    \item{nbemp}{number of employees}
    \item{faexp}{assets expenses}
    \item{fa}{fixed assets}
    \item{intexp}{total interest expenses (interest on deposits and non-deposit funds + other interest expenses),}
    \item{bfunds}{borrowed funds (deposits + non-deposit funds)}
    \item{dep}{deposits}
    \item{nondep}{non-deposits}
    \item{npl}{non performing loans}
    \item{ec}{equity capital}
    \item{quality}{quality index}
    \item{rindex}{risk index}
    \item{ta}{total assets}
    \item{ts}{total securities (only for conventional banks)}
  }
}
\source{Journal of Applied Econometrics Data Archive : \url{http://qed.econ.queensu.ca/jae/}}
\references{
Mahmoud A. El-Gamal and Hulusi Inanoglu (2005) \dQuote{Inefficiency and Heterogeneity in Turkish Banking: 1990-2000}, \emph{Journal of Applied Econometrics}, \bold{20(5)}, 641--664, \doi{10.1002/jae.835}
.

}
\keyword{datasets}
\examples{
#### Example 2-5

## ------------------------------------------------------------------------
data("TurkishBanks", package = "pder")
library("plm")
TurkishBanks <- na.omit(TurkishBanks)
TB <- pdata.frame(TurkishBanks)
summary(log(TB$output))
ercomp(log(cost) ~ log(output), TB)
models <- c("within", "random", "pooling", "between")
sapply(models, function(x)
       coef(plm(log(cost) ~ log(output), TB, model = x))["log(output)"])

}

