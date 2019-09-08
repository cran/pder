\name{GiantsShoulders}
\docType{data}
\alias{GiantsShoulders}
\title{Impact of Institutions on Cumulative Research}
\description{yearly observations of 216 articles from 1970 to 2001

    \emph{number of observations} : 4880

    \emph{number of  time-series } :  32 

    \emph{country} :  United States 

    \emph{JEL codes: }D02, D83, I23, O30

    \emph{Chapter} : 08

}
\usage{data(GiantsShoulders)}
\format{A dataframe containing:
  \describe{
    \item{pair}{the pair article index}
    \item{article}{the article index}
    \item{brc}{material of the article is deposit on a Biological Ressource Center}
    \item{pubyear}{publication year of the article}
    \item{brcyear}{year of the deposit in brc of the material related to the article}
    \item{year}{the year index}
    \item{citations}{the number of citations}
  }
}
\source{American Economic Association Data Archive : \url{http://aeaweb.org/aer/}}
\references{
Furman, Jeffrey L. and Scott Stern (2011) \dQuote{Climbing Atop the Shoulders of Giants: the Impact of Institutions on Cumulative Research}, \emph{American Economic Review}, \bold{101(5)}, 1933-1963, \doi{10.1257/aer.101.5.1933}
.

}
\keyword{datasets}
\examples{

#### Example 8-6

## ------------------------------------------------------------------------
data("GiantsShoulders", package = "pder")
head(GiantsShoulders)

## ------------------------------------------------------------------------
library("dplyr")
GiantsShoulders <- mutate(GiantsShoulders, age = year - pubyear)
cityear <- summarise(group_by(GiantsShoulders, brc, age), 
                     cit = mean(citations, na.rm = TRUE))

## ------------------------------------------------------------------------
GiantsShoulders <- mutate(GiantsShoulders,
                          window = as.numeric( (brc == "yes") & 
                                               abs(brcyear - year) <= 1),
                          post_brc = as.numeric( (brc == "yes") & 
                                                 year - brcyear > 1),
                          age = year - pubyear)
GiantsShoulders$age[GiantsShoulders$age == 31] <- 0
#GiantsShoulders$year[GiantsShoulders$year %in% 1970:1974] <- 1970
#GiantsShoulders$year[GiantsShoulders$year %in% 1975:1979] <- 1975
GiantsShoulders$year[GiantsShoulders$year < 1975] <- 1970
GiantsShoulders$year[GiantsShoulders$year >= 1975 & GiantsShoulders$year < 1980] <- 1975



## ------------------------------------------------------------------------
library("pglm")
t3c1 <- lm(log(1 + citations) ~ brc + window + post_brc + factor(age), 
           data = GiantsShoulders)
t3c2 <- update(t3c1, . ~ .+  factor(pair) + factor(year))
t3c3 <- pglm(citations ~ brc + window + post_brc + factor(age) + factor(year),
           data = GiantsShoulders, index = "pair", 
           effect = "individual", model = "within", family = negbin)
t3c4 <- pglm(citations ~ window + post_brc + factor(age) + factor(year),
             data = GiantsShoulders, index = "article", 
             effect = "individual", model = "within", family = negbin)
## screenreg(list(t3c2, t3c3, t3c4),
##           custom.model.names = c("ols: age/year/pair-FE", 
##                                  "NB:age/year/pair-FE", "NB: age/year/article-FE"),
##           omit.coef="(factor)|(Intercept)", digits = 3)
}

