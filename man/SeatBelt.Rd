\name{SeatBelt}
\docType{data}
\alias{SeatBelt}
\title{Seat Belt Usage and Traffic Fatalities}
\description{yearly observations of 51 states from 1983 to 1997

    \emph{number of observations} : 765

    \emph{number of  time-series } :  15 

    \emph{country} :  United States 

    \emph{package} : panel

    \emph{JEL codes: }R41, K42

    \emph{Chapter} : 06

}
\usage{data(SeatBelt)}
\format{A dataframe containing:
  \describe{
    \item{state}{the state code}
    \item{year}{the year}
    \item{farsocc}{the number of  traffic fatalities of drivers and passengers (of any seating position) of a motor vehicule in transport}
    \item{farsnocc}{the number of traffic fatalities of pedestrians and bicyclists}
    \item{usage}{rate of seat belt usage}
    \item{percapin}{median income in current US dollars}
    \item{unemp}{unemployment rate}
    \item{meanage}{mean age}
    \item{precentb}{the percentage of african-americans in the state population}
    \item{precenth}{the percentage of people of hispanic origin in the state population}
    \item{densurb}{traffic density urban ; registered vehicules per unit length of urban roads in miles}
    \item{densrur}{traffic density rural ; registered vehicules per unit length of urban roads in miles}
    \item{viopcap}{number of violent crimes (homicide, rape and robbery) per capita}
    \item{proppcap}{number of preperty rimes (burglary, larceny and auto theft) per capita}
    \item{vmtrural}{vehicule miles traveled on rural roads}
    \item{vmturban}{vehicule miles traveled on urban roads}
    \item{fueltax}{fuel tax (in curent cents)}
    \item{lim65}{65 miles per hour speed limit (55 mph is the base category)}
    \item{lim70p}{70 miles per hour or above speed limit (55 mph is the base caegory)}
    \item{mlda21}{a dummy variable that is equal to 1 for a minimum for a minimum legal drinking age of 21 years (18 years is the base category)}
    \item{bac08}{a dummy variable that is equal to 1 foe a maximum of 0.08 blood alcohol content (0.1 is the base category)}
    \item{ds}{a dummy equal to 1 for the periods in which the state had a secondary-enforcement mandatory seat belt law, or a primary-enforcement law that preceded by a secondary-enforcement law (no seat belt law is the base category)}
    \item{dp}{a dummy variable eqal to 1 for the periods in which the state had a primary-enforcement mandatory seat belt law that was not preceded by a secondary-enforcement law (no seat belt is the base category)}
    \item{dsp}{a dummy variable equal to 1 for the periods in which the state had a primary-enforcement mandatory seat belt law that was preceded by a secondary enforcement law (no seat belt law is the base category}
  }
}
\source{author's website \url{https://leinav.people.stanford.edu}}
\references{
Cohen, Alma and Liran Einav (2003) \dQuote{The Effects of Mandatory Seat Belt Laws on Driving Behavior and Traffic Fatalities}, \emph{The Review of Economics and Statistics}, \bold{85(4)}, 828-843, \doi{10.2139/ssrn.293582}
.

}
\keyword{datasets}
\examples{
#### Example 6-1

## ------------------------------------------------------------------------
\dontrun{
library("plm")

## ------------------------------------------------------------------------
y ~ x1 + x2 + x3 | x1 + x3 + z
y ~ x1 + x2 + x3 | . - x2 + z

## ------------------------------------------------------------------------

data("SeatBelt", package = "pder")
SeatBelt$occfat <- with(SeatBelt, log(farsocc / (vmtrural + vmturban)))
ols <- plm(occfat ~ log(usage) + log(percapin) + log(unemp) + log(meanage) + 
           log(precentb) + log(precenth)+ log(densrur) + 
           log(densurb) + log(viopcap) + log(proppcap) +
           log(vmtrural) + log(vmturban) + log(fueltax) +
           lim65 + lim70p + mlda21 + bac08, SeatBelt, 
           effect = "time")
fe <- update(ols, effect = "twoways")
ivfe <- update(fe, . ~ . |  . - log(usage) + ds + dp +dsp)

rbind(ols = coef(summary(ols))[1,],
      fe = coef(summary(fe))[1, ],
      w2sls = coef(summary(ivfe))[1, ])

## ------------------------------------------------------------------------
SeatBelt$noccfat <- with(SeatBelt, log(farsnocc / (vmtrural + vmturban)))
nivfe <- update(ivfe, noccfat ~ . | .)
coef(summary(nivfe))[1, ]
}
}

