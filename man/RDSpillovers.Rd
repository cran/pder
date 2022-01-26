\name{RDSpillovers}
\docType{data}
\alias{RDSpillovers}
\title{Research and Development Spillovers Data}
\description{a cross-section of 119 industries from 1980 to 2005

    \emph{country} :  world 

    \emph{package} : panel

    \emph{JEL codes: }C51, D24, O32, O33

    \emph{Chapter} : 04, 05, 09

}
\usage{data(RDSpillovers)}
\format{A dataframe containing:
  \describe{
    \item{id}{country-industry index}
    \item{year}{year}
    \item{country}{country}
    \item{sector}{manufacturing sector as SIC 15-37, excluding SIC 23}
    \item{lny}{log output}
    \item{lnl}{log of labour input}
    \item{lnk}{log of physical capital stock}
    \item{lnrd}{log of RD capital stock}
  }
}
\source{author's web site \url{https://sites.google.com/site/medevecon/home}}
\references{
Eberhardt, M.; Helmers, C. and H. Strauss (2013) \dQuote{Do Spillovers Matter in Estimating Private Returns to R and D?}, \emph{The Review of Economics and Statistics}, \bold{95(2)}, 436--448, \doi{10.1162/REST_a_00272}
.

}
\keyword{datasets}
\examples{
#### Example 4-10

## ------------------------------------------------------------------------
\dontrun{
data("RDSpillovers", package = "pder")
library("plm")
fm.rds <- lny ~ lnl + lnk + lnrd

## ------------------------------------------------------------------------
pcdtest(fm.rds, RDSpillovers)

## ------------------------------------------------------------------------
rds.2fe <- plm(fm.rds, RDSpillovers, model = "within", effect = "twoways")
pcdtest(rds.2fe)

## ------------------------------------------------------------------------
cbind("rho"  = pcdtest(rds.2fe, test = "rho")$statistic,
      "|rho|"= pcdtest(rds.2fe, test = "absrho")$statistic)


#### Example 5-10

## ------------------------------------------------------------------------
data("RDSpillovers", package = "pder")
pehs <- pdata.frame(RDSpillovers, index = c("id", "year"))
ehsfm <- lny ~ lnl + lnk + lnrd
phtest(ehsfm, pehs, method = "aux")

## ------------------------------------------------------------------------
phtest(ehsfm, pehs, method = "aux", vcov = vcovHC)


#### Example 5-15

## ------------------------------------------------------------------------
fm <- lny ~ lnl + lnk + lnrd

## ------------------------------------------------------------------------


if (requireNamespace("lmtest")){
    library("lmtest")
    gglsmodehs <- pggls(fm, RDSpillovers, model = "pooling")
    coeftest(gglsmodehs)

    feglsmodehs <- pggls(fm, RDSpillovers, model = "within")
    coeftest(feglsmodehs)
    
    phtest(gglsmodehs, feglsmodehs)
    
    fdglsmodehs <- pggls(fm, RDSpillovers, model = "fd")
    
    fee <- resid(feglsmodehs)
    dbfee <- data.frame(fee=fee, id=attr(fee, "index")[[1]])
    coeftest(plm(fee~lag(fee)+lag(fee,2), dbfee, model = "p", index="id"))
    
    fde <- resid(fdglsmodehs)
    dbfde <- data.frame(fde=fde, id=attr(fde, "index")[[1]])
    coeftest(plm(fde~lag(fde)+lag(fde,2), dbfde, model = "p", index="id"))
    
    coeftest(fdglsmodehs)
}


#### Example 9-7

## ------------------------------------------------------------------------
ccep.rds <- pcce(fm.rds, RDSpillovers, model="p")
if (requireNamespace("lmtest")){
    library("lmtest")
    ccep.tab <- cbind(coeftest(ccep.rds)[, 1:2],
                      coeftest(ccep.rds, vcov = vcovNW)[, 2],
                      coeftest(ccep.rds, vcov = vcovHC)[, 2])
    dimnames(ccep.tab)[[2]][2:4] <- c("Nonparam.", "vcovNW", "vcovHC")
    round(ccep.tab, 3)
}


## ------------------------------------------------------------------------
autoreg <- function(rho = 0.1, T = 100){
  e <- rnorm(T+1)
  for (t in 2:(T+1)) e[t] <- e[t]+rho*e[t-1]
  e
}
set.seed(20)

f <- data.frame(time = rep(0:40, 2), 
                rho = rep(c(0.2, 1), each = 41),
                y = c(autoreg(rho = 0.2, T = 40), 
                      autoreg(rho = 1, T = 40)))
if (requireNamespace("ggplot2")){
    library("ggplot2")
    ggplot(f, aes(time, y)) + geom_line() + facet_wrap(~ rho) + xlab("") + ylab("")

    autoreg <- function(rho = 0.1, T = 100){
        e <- rnorm(T)
        for (t in 2:(T)) e[t] <- e[t] + rho *e[t-1]
        e
    }
    tstat <- function(rho = 0.1, T = 100){
        y <- autoreg(rho, T)
        x <- autoreg(rho, T)
        z <- lm(y ~ x)
        coef(z)[2] / sqrt(diag(vcov(z))[2])
    }
    result <- c()
    R <- 1000
    for (i in 1:R) result <- c(result, tstat(rho = 0.2, T = 40))
    quantile(result, c(0.025, 0.975))
    prop.table(table(abs(result) > 2))


    result <- c()
    R <- 1000
    for (i in 1:R) result <- c(result, tstat(rho = 1, T = 40))
    quantile(result, c(0.025, 0.975))
    prop.table(table(abs(result) > 2))

    
    R <- 1000
    T <- 100
    result <- c()
    for (i in 1:R){
        y <- autoreg(rho=1, T=100)
        Dy <- y[2:T] - y[1:(T-1)]
        Ly <- y[1:(T-1)]
        z <- lm(Dy ~ Ly)
        result <- c(result, coef(z)[2] / sqrt(diag(vcov(z))[2]))
    }

    ggplot(data.frame(x = result), aes(x = x)) + 
        geom_histogram(fill = "white", col = "black", 
                       bins = 20, aes(y = ..density..)) +
        stat_function(fun = dnorm) + xlab("") + ylab("")


    prop.table(table(result < -1.64))
}
}
}

