\name{Mafia}
\docType{data}
\alias{Mafia}
\title{Mafia and Public Spending}
\description{yearly observations of 95 provinces from 1986 to 1999

    \emph{number of observations} : 1330

    \emph{number of  time-series } :  14 

    \emph{country} :  Italy 

    \emph{package} : panelivreg

    \emph{JEL codes: }D72, E62, H71, K42

    \emph{Chapter} : 06

}
\usage{data(Mafia)}
\format{A dataframe containing:
  \describe{
    \item{province}{the province (95)}
    \item{region}{the region (19)}
    \item{year}{the year}
    \item{pop}{the population}
    \item{y}{percentage growth of real per-capita value added}
    \item{g}{annual variation of the per-capita public investment in infrastructure divided by lagged real per-capita value added}
    \item{cd}{number of municipalities placed under the administration of external commissioners}
    \item{cds1}{same as cd, provided that the official deccree is publisehd in the first semester of the year}
    \item{cds2}{same as cd, provided that the average number of days betwen the dismissal of the city concil and the year end is less than 180}
    \item{u1}{change in the log of per-capita employment}
    \item{u2}{change in the log of per-capita hours of wage supplement provided by the unemployment insurance scheme}
    \item{mafiosi}{first difference of the number of people reported by the police forces to the judicial authority because of mafia-type association}
    \item{extortion}{first difference of the number of people reported by the police forces to the judicial authority because of extorsion}
    \item{corruption1}{first difference of the number of people reported by the police forces to the judicial authority because of corruption}
    \item{corruption2}{first difference of the number of crimes reported by the police forces to the judicial authority because of corruption}
    \item{murder}{first difference of the number of people reported by the police forces to the judicial authority because of murder related to mafia activity}
  }
}
\source{American Economic Association Data Archive : \url{https://www.aeaweb.org/aer/}}
\references{
Acconcia, Antonio; Corsetti, Giancarlo and Saviero Simonelli (2014) \dQuote{Mafia and Public Spending: Evidence on the Fiscal Multimplier Form a Quasi-experiment}, \emph{American Economic Review}, \bold{104(7)}, 2189-2209, \doi{10.1257/aer.104.7.2185}
.

}
\keyword{datasets}
