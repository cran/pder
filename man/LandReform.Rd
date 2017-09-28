\name{LandReform}
\docType{data}
\alias{LandReform}
\title{Politics and Land Reforms in India }
\description{
  yearly observations of  89 villages from 1974  to 2003

 \emph{number of observations} :  2670

   \emph{country} :  India

\emph{economic topic} : agricultural and natural resource economics, environmental and ecological economics

\emph{econometrics topic} : censored and truncated variable

}
\usage{data(LandReform)}
\format{A dataframe containing :
  \describe{
    \item{mouza}{village id number}
    \item{year}{year}
    \item{district}{district}
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
    \item{ratleft0}{left Front share in GP, == 0 for 1974}
    \item{dwalfco}{assembly average vote difference LF-INC, district}
    \item{inflat}{inflation  in last 5 years in CPI for Agricultural Labourers}
    \item{smfempyv}{year variation in Employment in Small Scale Industrial Units registered with Dir}
    \item{incseats}{iNC seats / Total seats in Lok Sabha}
    \item{lfseats}{ratio of LF seats in parliament}
    \item{inflflag}{interaction between Inflation and ratleft lagged}
    \item{inclflag}{interaction between INC seats and ratleft lagged}
    \item{lflflag}{interaction between LF seats and ratleft lagged}
    \item{ratleft}{left Front share in GP, ==share of assembly seats for 1974}
    \item{infiw}{to complete}
    \item{infumme}{to complete}
    \item{infal}{to complete}
    \item{gp}{gran Panchayat}
  }
}
\source{
    American Economic Journal data archive : \url{http://aeaweb.org/aer/}.

}
\references{
    Bardhan, Pranab  and  Dilip  Mookherjee (2010) \dQuote{Determinants of redistributive politics: an empirical analysis of land reform in west Bengal, India}, \emph{American Economic Review}, \bold{100(4)}, 1572--1600.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
