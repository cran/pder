\name{Tileries}
\docType{data}
\alias{Tileries}
\title{Production of Tileries in Egypt}
\description{weeklyly observations of 25 firms

    \emph{number of observations} : 483

    \emph{number of  time-series } :  22 

    \emph{country} :  Egypt 

    \emph{JEL codes: }D24, C13, C51, C23, J31

    \emph{Chapter} : 01, 03

}
\usage{data(Tileries)}
\format{A dataframe containing:
  \describe{
    \item{id}{firm id}
    \item{week}{week (3 weeks aggregated)}
    \item{area}{one of \code{"fayoum"} and \code{"kalyubiya"}}
    \item{output}{output}
    \item{labor}{labor hours}
    \item{machine}{machine hours}
  }
}
\source{Journal of Applied Econometrics Data Archive : \url{http://qed.econ.queensu.ca/jae/}}
\references{
Horrace and Schmidt (1996) \dQuote{Confidence Statements for Efficiency Estimates From Stochastic Frontier Models}, \emph{Journal of Productity Analysis}, \bold{7}, 257--282, \doi{10.1007/BF00157044}
.

Horrace and Schmidt (2012) \dQuote{Multiple Comparisons with the Best, with Economic Applications}, \emph{Journal of Applied Econometrics}, \bold{15(1)}, 1--26, \doi{10.1002/(SICI)1099-1255(200001/02)15:1<1::AID-JAE551>3.0.CO;2-Y}
.

Seale J.L. (1990) \dQuote{Estimating Stochastic Frontier Systems with Unbalanced Panel Data: the Case of Floor Tile Manufactories in Egypt}, \emph{Journal of Applied Econometrics}, \bold{5}, 59--79, \doi{10.1002/jae.3950050105}
.

}
\keyword{datasets}
\examples{
#### Example 1-2

## ------------------------------------------------------------------------
data("Tileries", package = "pder")
library("plm")
coef(summary(plm(log(output) ~ log(labor) + machine, data = Tileries,
             subset = area == "fayoum")))

## ------------------------------------------------------------------------
coef(summary(plm(log(output) ~ log(labor) + machine, data = Tileries,
             model = "pooling", subset = area == "fayoum")))


#### Example 1-5

## ------------------------------------------------------------------------
data("Tileries", package = "pder")
til.fm <- log(output) ~ log(labor) + log(machine)
lm.mod <- lm(til.fm, data = Tileries, subset = area == "fayoum")

## ------------------------------------------------------------------------
library(car)
lht(lm.mod, "log(labor) + log(machine) = 1")

## ------------------------------------------------------------------------
library(car)
lht(lm.mod, "log(labor) + log(machine) = 1", vcov=vcovHC)


#### Example 1-6

## ------------------------------------------------------------------------
plm.mod <- plm(til.fm, data = Tileries, subset = area == "fayoum")

## ------------------------------------------------------------------------
library(car)
lht(plm.mod, "log(labor) + log(machine) = 1", vcov = vcovHC)

#### Example 3-1

## ------------------------------------------------------------------------
library(plm)
data("Tileries", package = "pder")
head(Tileries, 3)
pdim(Tileries)

## ------------------------------------------------------------------------
Tileries <- pdata.frame(Tileries)
plm.within <- plm(log(output) ~ log(labor) + log(machine), Tileries)
y <- log(Tileries$output)
x1 <- log(Tileries$labor)
x2 <- log(Tileries$machine)
lm.within <- lm(I(y - Between(y)) ~ I(x1 - Between(x1)) + I(x2 - Between(x2)) - 1)
lm.lsdv <- lm(log(output) ~ log(labor) + log(machine) + factor(id), Tileries)
coef(lm.lsdv)[2:3]
coef(lm.within)
coef(plm.within)

## ------------------------------------------------------------------------
tile.r <- plm(log(output) ~ log(labor) + log(machine), Tileries, model = "random")
summary(tile.r)

## ------------------------------------------------------------------------
plm.within <- plm(log(output) ~ log(labor) + log(machine),
                  Tileries, effect = "twoways")
lm.lsdv <- lm(log(output) ~ log(labor) + log(machine) +
                  factor(id) + factor(week), Tileries)
y <- log(Tileries$output)
x1 <- log(Tileries$labor)
x2 <- log(Tileries$machine)
y <- y - Between(y, "individual") - Between(y, "time") + mean(y)
x1 <- x1 - Between(x1, "individual") - Between(x1, "time") + mean(x1)
x2 <- x2 - Between(x2, "individual") - Between(x2, "time") + mean(x2)
lm.within <- lm(y ~ x1 + x2 - 1)
coef(plm.within)
coef(lm.within)
coef(lm.lsdv)[2:3]

## ------------------------------------------------------------------------
wh <- plm(log(output) ~ log(labor) + log(machine), Tileries,
          model = "random", random.method = "walhus",
          effect = "twoways")
am <- update(wh, random.method = "amemiya")
sa <- update(wh, random.method = "swar")
ercomp(sa)

## ------------------------------------------------------------------------
re.models <- list(walhus = wh, amemiya = am, swar = sa)
sapply(re.models, function(x) sqrt(ercomp(x)$sigma2))
sapply(re.models, coef)

}

