\name{Donors}
\docType{data}
\alias{Donors}
\title{Dynamics of Charitable Giving}
\description{a pseudo-panel of 32 individuals from 2006

    \emph{number of observations} : 1039

    \emph{number of  individual observations } :  4-80 

    \emph{country} :  United States 

    \emph{package} : limdeppanel

    \emph{JEL codes: }C93, D64, D82, H41, L31, Z12

    \emph{Chapter} : 08

}
\usage{data(Donors)}
\format{A dataframe containing:
  \describe{
    \item{id}{the id of the sollicitor}
    \item{solsex}{the sex of the sollicitor}
    \item{solmin}{does the sollicitor belongs to a minority ?}
    \item{beauty}{beauty rating for the sollicitor}
    \item{assertive}{assertive rating for the sollicitor}
    \item{social}{social rating for the sollicitor}
    \item{efficacy}{efficacy rating for the sollicitor}
    \item{performance}{performance rating for the sollicitor}
    \item{confidence}{confidence rating for the sollicitor}
    \item{age}{age of the individual}
    \item{sex}{sex of the individual}
    \item{min}{does the individual belongs to a minority}
    \item{treatment}{the treatment, one of "vcm", "sgift" and "lgift"}
    \item{refgift}{has the individual refused the gift ?}
    \item{donation}{the amount of the donation}
    \item{prior}{has the individual been visited during the previous campaign ?}
    \item{prtreat}{the treatment during the previous campaign, one of "none", "vcm", and "lottery"}
    \item{prcontr}{has the individual made a donation during the previous campaign ?}
    \item{prdonation}{the amount of the donation during the previous campaign}
    \item{prsolsex}{the sex of the sollicitor during the previous campaign}
    \item{prsolmin}{did the sollicitor of the previous campaign belong to a minority ?}
    \item{prbeauty}{beauty rating for the sollicitor of the previous campaign}
  }
}
\source{American Economic Association Data Archive : \url{https://www.aeaweb.org/aer/}}
\references{
Landry, Craig E.; Lange, Andreas; List, John A.; Price, Michael K. and Nicholas G. Rupp (2010) \dQuote{Is a Donor in Hand Better Than Two in the Bush ? Evidence From a Natural Field Experiment}, \emph{American Economic Review}, \bold{100(3)}, 958--983, \doi{10.1257/aer.100.3.958}
.

}
\keyword{datasets}
\examples{

#### Example 8-5

## ------------------------------------------------------------------------
\dontrun{
data("Donors", package = "pder")
library("plm")
T3.1 <- plm(donation ~ treatment +  prcontr, Donors, index = "id")
T3.2 <- plm(donation ~ treatment * prcontr - prcontr, Donors, index = "id")
T5.A <- pldv(donation ~ treatment +  prcontr, Donors, index = "id", 
             model = "random", method = "bfgs")
T5.B <- pldv(donation ~ treatment * prcontr - prcontr, Donors, index = "id", 
             model = "random", method = "bfgs")
}

}

