\name{HousePricesUS}
\docType{data}
\alias{HousePricesUS}
\title{House Prices Data}
\description{yearly observations of 49 regions from 1976 to 2003

    \emph{number of observations} : 1421

    \emph{number of  time-series } :  29 

    \emph{country} :  United States 

    \emph{JEL codes: }C51, R31

    \emph{Chapter} : 09, 10

}
\usage{data(HousePricesUS)}
\format{A dataframe containing:
  \describe{
    \item{state}{state index}
    \item{year}{year}
    \item{names}{state name}
    \item{plate}{state number plate index}
    \item{region}{region index}
    \item{region.name}{region name}
    \item{price}{real house price index, 1980=100}
    \item{income}{real per-capita income}
    \item{pop}{total population}
    \item{intrate}{real interest rate on borrowing}
  }
}
\source{Journal of Applied Econometrics data archive : \url{http://jae.wiley.com/jae/}}
\references{
Holly, S.; Pesaran, M.G. and T. Yamagata (2010) \dQuote{A Spatio-temporal Model of House Prices in the USA}, \emph{Journal of Econometrics}, \bold{158(1)}, 160--173, \doi{10.1016/j.jeconom.2010.03.040}
.

Millo, Giovanni (2015) \dQuote{Narrow Replication of 'spatio-temporal Model of House Prices in the Usa', Using R}, \emph{Journal of Applied Econometrics}, \bold{30(4)}, 703--704, \doi{10.1002/jae.2424}
.

}
\keyword{datasets}
\examples{
#### Example 4-11

## ------------------------------------------------------------------------
data("HousePricesUS", package = "pder")
library("plm")
php <- pdata.frame(HousePricesUS)

## ------------------------------------------------------------------------
cbind("rho"   = pcdtest(diff(log(php$price)), test = "rho")$statistic,
      "|rho|" = pcdtest(diff(log(php$price)), test = "absrho")$statistic)

## ------------------------------------------------------------------------
regions.names <- c("New Engl", "Mideast", "Southeast", "Great Lks",
                   "Plains", "Southwest", "Rocky Mnt", "Far West")
corr.table.hp <- cortab(diff(log(php$price)), grouping = php$region,
                        groupnames = regions.names)
colnames(corr.table.hp) <- substr(rownames(corr.table.hp), 1, 5)
round(corr.table.hp, 2)

## ------------------------------------------------------------------------
pcdtest(diff(log(price)) ~ diff(lag(log(price))) + diff(lag(log(price), 2)),
        data = php)

#### Example 9-2

## ------------------------------------------------------------------------
data("HousePricesUS", package = "pder")
swmod <- pvcm(log(price) ~ log(income), data = HousePricesUS, model= "random")
mgmod <- pmg(log(price) ~ log(income), data = HousePricesUS, model = "mg")
coefs <- cbind(coef(swmod), coef(mgmod))
dimnames(coefs)[[2]] <- c("Swamy", "MG")
coefs

#### Example 9-3

## ------------------------------------------------------------------------
library("texreg")
data("RDSpillovers", package = "pder")
fm.rds <- lny ~ lnl + lnk + lnrd
mg.rds <- pmg(fm.rds, RDSpillovers, trend = TRUE)
dmg.rds <- update(mg.rds, . ~ lag(lny) + .)
screenreg(list('Static MG' = mg.rds, 'Dynamic MG'= dmg.rds), digits = 3)

## ------------------------------------------------------------------------
library("msm")
b.lr <- coef(dmg.rds)["lnrd"]/(1 - coef(dmg.rds)["lag(lny)"])
SEb.lr <- deltamethod(~ x5 / (1 - x2),
                      mean = coef(dmg.rds), cov = vcov(dmg.rds))
z.lr <- b.lr / SEb.lr
pval.lr <- 2 * pnorm(abs(z.lr), lower.tail = FALSE)
lr.lnrd <- matrix(c(b.lr, SEb.lr, z.lr, pval.lr), nrow=1)
dimnames(lr.lnrd) <- list("lnrd (long run)", c("Est.", "SE", "z", "p.val"))
round(lr.lnrd, 3)


#### Example 9-4

## ------------------------------------------------------------------------
housep.np <- pvcm(log(price) ~ log(income), data = HousePricesUS, model = "within")
housep.pool <- plm(log(price) ~ log(income), data = HousePricesUS, model = "pooling")
housep.within <- plm(log(price) ~ log(income), data = HousePricesUS, model = "within")

d <- data.frame(x = c(coef(housep.np)[[1]], coef(housep.np)[[2]]), 
                coef = rep(c("intercept", "log(income)"), 
                           each = nrow(coef(housep.np))))
library("ggplot2")
ggplot(d, aes(x)) + geom_histogram(col = "black", fill = "white", bins = 8) +
    facet_wrap(~ coef, scales = "free") + xlab("") + ylab("")


## ------------------------------------------------------------------------
summary(housep.np)

## ------------------------------------------------------------------------
pooltest(housep.pool, housep.np)
pooltest(housep.within, housep.np)


#### Example 9-5

## ------------------------------------------------------------------------
library("texreg")
cmgmod <- pmg(log(price) ~ log(income), data = HousePricesUS, model = "cmg")
screenreg(list(mg = mgmod, ccemg = cmgmod), digits = 3)

#### Example 9-6

## ------------------------------------------------------------------------
ccemgmod <- pcce(log(price) ~ log(income), data=HousePricesUS, model="mg")
summary(ccemgmod)

## ------------------------------------------------------------------------
ccepmod <- pcce(log(price) ~ log(income), data=HousePricesUS, model="p")
summary(ccepmod)



#### Example 9-8

## ------------------------------------------------------------------------
data("HousePricesUS", package = "pder")
price <- pdata.frame(HousePricesUS)$price
purtest(log(price), test = "levinlin", lags = 2, exo = "trend")
purtest(log(price), test = "madwu", lags = 2, exo = "trend")
purtest(log(price), test = "ips", lags = 2, exo = "trend")


#### Example 9-9

## ------------------------------------------------------------------------
tab5a <- matrix(NA, ncol = 4, nrow = 2)
tab5b <- matrix(NA, ncol = 4, nrow = 2)

for(i in 1:4) {
    mymod <- pmg(diff(log(income)) ~ lag(log(income)) + 
                 lag(diff(log(income)), 1:i),
                 data = HousePricesUS,
                 model = "mg", trend = TRUE)
    tab5a[1, i] <- pcdtest(mymod, test = "rho")$statistic
    tab5b[1, i] <- pcdtest(mymod, test =  "cd")$statistic
}

for(i in 1:4) {
    mymod <- pmg(diff(log(price)) ~ lag(log(price)) +
                 lag(diff(log(price)), 1:i),
                 data=HousePricesUS,
                 model="mg", trend = TRUE)
    tab5a[2, i] <- pcdtest(mymod, test = "rho")$statistic
    tab5b[2, i] <- pcdtest(mymod, test =  "cd")$statistic
}

tab5a <- round(tab5a, 3)
tab5b <- round(tab5b, 2)
dimnames(tab5a) <- list(c("income", "price"),
                        paste("ADF(", 1:4, ")", sep=""))
dimnames(tab5b) <- dimnames(tab5a)

tab5a
tab5b

## ------------------------------------------------------------------------
php <- pdata.frame(HousePricesUS)
cipstest(log(php$price), type = "drift")
cipstest(diff(log(php$price)), type = "none")

## ------------------------------------------------------------------------
cipstest(resid(ccemgmod), type="none")
cipstest(resid(ccepmod), type="none")


#### Example 10-2

## ------------------------------------------------------------------------
data("usaw49", package="pder")
library("plm")
php <- pdata.frame(HousePricesUS)
pcdtest(php$price, w = usaw49)

## ------------------------------------------------------------------------
library("splm")
rwtest(php$price, w = usaw49, replications = 999)

## ------------------------------------------------------------------------
mgmod <- pmg(log(price) ~ log(income), data = HousePricesUS)
ccemgmod <- pmg(log(price) ~ log(income), data = HousePricesUS, model = "cmg")
pcdtest(resid(ccemgmod), w = usaw49)
rwtest(resid(mgmod), w = usaw49, replications = 999)


}

