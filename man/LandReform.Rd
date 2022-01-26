\name{LandReform}
\docType{data}
\alias{LandReform}
\title{Politics and Land Reforms in India}
\description{yearly observations of 89 villages from 1974 to 2003

    \emph{number of observations} : 2670

    \emph{number of  time-series } :  30 

    \emph{country} :  India 

    \emph{package} : panellimdep

    \emph{JEL codes: }D72, O13, O17, Q15

    \emph{Chapter} : 08

}
\usage{data(LandReform)}
\format{A dataframe containing:
  \describe{
    \item{mouza}{village id number}
    \item{year}{Year}
    \item{district}{District}
    \item{rplacul}{ratio of patta land registered to operational land}
    \item{rpdrhh}{ratio of pattadar households to total households (hh)}
    \item{rblacul}{ratio of barga land registered to operational land}
    \item{rbgdrrghh}{ratio of bargadar registered hh to total hh}
    \item{election}{election year dummy}
    \item{preelect}{preelection year dummy}
    \item{edwalfco}{to complete}
    \item{erlesscu}{interpolated landless hh, gi}
    \item{ermgcu}{interpolated mg hh, gi}
    \item{ersmcu}{interpolated sm hh, gi}
    \item{ermdcu}{interpolated md hh, gi}
    \item{ercusmol}{ratio of land below 5 acres cultivable NOT extrapolated}
    \item{ercubgol}{ratio of land above 12.5 acres cultivable}
    \item{erillnb}{interpolated ratio of illiterate non big hh}
    \item{erlow}{interpolated ratio of low caste hh}
    \item{ratleft0}{Left Front share in GP, == 0 for 1974}
    \item{dwalfco}{Assembly average vote difference LF-INC, district}
    \item{inflat}{Inflation  in last 5 years in CPI for Agricultural Labourers}
    \item{smfempyv}{Year variation in Employment in Small Scale Industrial Units registered with Dir}
    \item{incseats}{INC seats / Total seats in Lok Sabha}
    \item{lfseats}{Ratio of LF seats in parliament}
    \item{inflflag}{Interaction between Inflation and ratleft lagged}
    \item{inclflag}{Interaction between INC seats and ratleft lagged}
    \item{lflflag}{Interaction between LF seats and ratleft lagged}
    \item{ratleft}{Left Front share in GP, ==share of assembly seats for 1974}
    \item{infiw}{to complete}
    \item{infumme}{to complete}
    \item{infal}{to complete}
    \item{gp}{Gran Panchayat}
  }
}
\source{American Economic Association Data Archive : \url{https://www.aeaweb.org/aer/}}
\references{
Bardhan, Pranab and Dilip Mookherjee (2010) \dQuote{Determinants of Redistributive Politics: An Empirical Analysis of Land Reform in West Bengal, India}, \emph{American Economic Review}, \bold{100(4)}, 1572--1600, \doi{10.1257/aer.100.4.1572}
.

}
\keyword{datasets}
