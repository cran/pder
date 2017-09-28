\name{LateBudgets}
\docType{data}
\alias{LateBudgets}
\title{Late Budgets }
\description{
  yearly observations of  48 States from 1978  to 2007

 \emph{number of observations} :  1440

   \emph{country} :  United States

\emph{economic topic} : public economics

\emph{econometrics topic} : censored and truncated variable

}
\usage{data(LateBudgets)}
\format{A dataframe containing :
  \describe{
    \item{state}{the state}
    \item{year}{the year}
    \item{late}{late budget ?}
    \item{dayslate}{number of days late for the budget}
    \item{unempdiff}{unemployment variation }
    \item{splitbranch}{split branch}
    \item{splitleg}{split legislature}
    \item{elecyear}{election year }
    \item{endbalance}{end of year balances in the general fund and stabilization fund}
    \item{demgov}{democrat governor ?}
    \item{lameduck}{lameduck}
    \item{govexp}{number of years since the incumbent governor took office}
    \item{newgov}{new governor ?}
    \item{pop}{the polulation}
    \item{kids}{percentage of population aged 5-17}
    \item{elderly}{percentage of population aged 65 or older}
    \item{nocarry}{does the state law does not allow a budget deficit to be carried over to the next fiscal year ?}
    \item{supmaj}{is a super majority required to pass each budget ? }
    \item{fulltimeleg}{full time legislature ?}
    \item{shutdown}{shutdown provision ? }
    \item{black}{percentage of blacks}
    \item{graduate}{percentage of graduates}
    \item{censusresp}{census response rate}
    \item{fiveyear}{five year dummies, one of '93-97', '98-02', '03-07'}
    \item{deadline}{is there a deadline ? one of 'none', 'soft' and 'hard'}
  }
}
\source{
    American Economic Journal data archive : \url{http://aeaweb.org/aer/}.

}
\references{
    Andersen, Asger Lau,  David Dreyer   Lassen and  Lasse Holboll Westh  Nielsen (2012) \dQuote{Late budgets}, \emph{American Economic Journal, Economic Policy}, \bold{4(4)}, 1-40.

}
\seealso{\code{\link{Index.Economics}}, \code{\link{Index.Econometrics}}

}\keyword{datasets}
