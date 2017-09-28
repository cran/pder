\name{Donnors}
\docType{data}
\alias{Donnors}
\title{Dynamics of Charitable Giving }
\description{
  a cross-section

 \emph{number of observations} :  1039

   \emph{country} :  United States

\emph{economic topic} : microeconomics

\emph{econometrics topic} : censored and truncated variable

}
\usage{data(Donnors)}
\format{A dataframe containing :
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
\source{
    American Economic Journal data archive : \url{http://aeaweb.org/aer/}.

}
\references{
    Landry, Craig E.,  Andreas   Lange,  John A.   List,  Michael K.   Price and  Nicholas G.  Rupp (2010) \dQuote{Is a donor in hand better than two in the bush ? Evidence from a natural field experiment}, \emph{American Economic Review}, \bold{100(3)}, 958--983.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
