\name{DemocracyIncome25}
\docType{data}
\alias{DemocracyIncome25}
\title{The Relation Between Democraty and Income}
\description{25-yearly observations of 25 countries from 1850 to 2000

    \emph{number of observations} : 175

    \emph{number of  time-series } :  7 

    \emph{country} :  world 

    \emph{JEL codes: }D72, O47

    \emph{Chapter} : 02, 07

}
\usage{data(DemocracyIncome25)}
\format{A dataframe containing:
  \describe{
    \item{country}{country}
    \item{year}{the starting year of the 5-years period}
    \item{democracy}{democracy index}
    \item{income}{the log of the gdp per capita}
  }
}
\source{American Economic Association Data Archive : \url{http://aeaweb.org/aer/}}
\references{
Daron Acemoglu, Simon Johnson, James A. Robinson and Pierre Yared (2008) \dQuote{Income and Democracy}, \emph{American Economic Review}, \bold{98(3)}, 808-842, \doi{10.1257/aer.98.3.808}
.

}
\keyword{datasets}
\examples{
#### Example 2-7

## ------------------------------------------------------------------------
library("plm")
data("DemocracyIncome25", package = "pder")
DI <- pdata.frame(DemocracyIncome25)
summary(lag(DI$income))
ercomp(democracy ~ lag(income), DI)
models <- c("within", "random", "pooling", "between")
sapply(models, function(x)
       coef(plm(democracy ~ lag(income), DI, model = x))["lag(income)"])


#### Example 7-6

## ------------------------------------------------------------------------
data("DemocracyIncome25", package = "pder")
pdim(DemocracyIncome25)

## ------------------------------------------------------------------------
diff25 <- pgmm(democracy ~ lag(democracy) + lag(income) |
               lag(democracy, 2:99) + lag(income, 2:99),
               DemocracyIncome25, model = "twosteps")

## ------------------------------------------------------------------------
diff25lim <- pgmm(democracy ~ lag(democracy) + lag(income) | 
                  lag(democracy, 2:4)+ lag(income, 2:4),
                  DemocracyIncome25, index=c("country", "year"), 
                  model="twosteps", effect="twoways", subset = sample == 1)
diff25coll <- pgmm(democracy ~ lag(democracy) + lag(income) | 
                   lag(democracy, 2:99)+ lag(income, 2:99),
                   DemocracyIncome25, index=c("country", "year"), 
                   model="twosteps", effect="twoways", subset = sample == 1,
                   collapse = TRUE)
sapply(list(diff25, diff25lim, diff25coll), function(x) coef(x)[1:2])

#### Example 7-9

## ------------------------------------------------------------------------
sapply(list(diff25, diff25lim, diff25coll), 
       function(x) sargan(x)[["p.value"]])

}

