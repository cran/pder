\name{TradeEU}
\docType{data}
\alias{TradeEU}
\title{Trade in the European Union}
\description{yearly observations of 91 pairs of countries from 1960 to 2001

    \emph{number of observations} : 3822

    \emph{number of  time-series } :  42 

    \emph{country} :  Europe 

    \emph{JEL codes: }C51, F14

    \emph{Chapter} : 06

}
\usage{data(TradeEU)}
\format{A dataframe containing:
  \describe{
    \item{year}{the year}
    \item{pair}{a pair of countries}
    \item{trade}{the sum of logged exports and imports, bilateral trade flow}
    \item{gdp}{the sum of the logged real GDPs}
    \item{sim}{a measure of similarity between two trading countries;}
    \item{rlf}{a measure of relative factor endowments;}
    \item{rer}{the logged bilateral real exchange rate;}
    \item{cee}{a dummy equal to 1 when both belong to European Community;}
    \item{emu}{a dummy equal to 1 when both adopt the common currency;}
    \item{dist}{the geographical distance between capital cities;}
    \item{bor}{a dummy equal to 1 when the trading partners share a border;}
    \item{lan}{a dummy equal to 1 when both speak the same language;}
    \item{rert}{the logarithm of real exchange rates between the European currencies and the U.S. dollar;}
    \item{ftrade}{the time specific common factors (individual means) of the variables trade}
    \item{fgdp}{the time specific common factors (individual means) of the variables gdp}
    \item{fsim}{the time specific common factors (individual means) of the variables sim}
    \item{frlf}{the time specific common factors (individual means) of the variables rlf}
    \item{frer}{the time specific common factors (individual means) of the variables rer}
  }
}
\source{Journal of Applied Econometrics data archive : \url{http://jae.wiley.com/jae/}}
\references{
Serlenga, Laura and Yongcheol Shin (2007) \dQuote{Gravity Models of Intra-eu Trade: Application of the Ccep-ht Estimation in Heterogenous Panels with Unobserved Common Time-specific Factors}, \emph{Journal of Applied Econometrics}, \bold{22}, 361--381, \doi{10.1002/jae.944}
.

}
\keyword{datasets}
\examples{
#### Example 6-3

## ------------------------------------------------------------------------
data("TradeEU", package = "pder")
library("plm")

## ------------------------------------------------------------------------
ols <- plm(trade ~ gdp + dist + rer + rlf + sim + cee + emu + bor + lan, TradeEU, 
          model = "pooling", index = c("pair", "year"))
fe <- update(ols, model = "within")
fe

## ------------------------------------------------------------------------
re <- update(fe, model = "random")
re

## ------------------------------------------------------------------------
phtest(re, fe)

## ----results='hide'------------------------------------------------------
ht1 <- plm(trade ~ gdp + dist + rer + rlf + sim + cee + emu + bor + lan | 
           rer + dist + bor | gdp + rlf + sim + cee + emu + lan , 
           data = TradeEU, model = "random", index = c("pair", "year"), 
           inst.method = "baltagi", random.method = "ht")
ht2 <- update(ht1, trade ~ gdp + dist + rer + rlf + sim + cee + emu + bor + lan | 
              rer + gdp + rlf + dist + bor| sim + cee + emu + lan)

## ------------------------------------------------------------------------
phtest(ht1, fe)
phtest(ht2, fe)

## ------------------------------------------------------------------------
ht2am <- update(ht2, inst.method = "am")

## ------------------------------------------------------------------------
phtest(ht2am, fe)
}

