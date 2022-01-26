\name{EvapoTransp}
\docType{data}
\alias{EvapoTransp}
\title{Evapotranspiration}
\description{a pseudo-panel of 86 areas from 2008

    \emph{number of observations} : 430

    \emph{number of  individual observations } :  5 

    \emph{country} :  France 

    \emph{package} : panel

    \emph{Chapter} : 10

}
\usage{data(EvapoTransp)}
\format{A dataframe containing:
  \describe{
    \item{id}{observation site}
    \item{period}{measuring period}
    \item{et}{evapotranspiration}
    \item{prec}{precipitation}
    \item{meansmd}{mean soil moisture deficit}
    \item{potet}{potential evapotranspiration}
    \item{infil}{infiltration rate}
    \item{biomass}{biomass}
    \item{biomassp1}{biomass in early growing season}
    \item{biomassp2}{biomass in main growth period}
    \item{biomassp3}{peak biomass}
    \item{biomassp4}{peak biomass after clipping}
    \item{biomassp5}{biomass in autumn}
    \item{plantcover}{plant cover}
    \item{softforbs}{soft-leaved forbs}
    \item{tallgrass}{tall grass}
    \item{diversity}{species diversity}
    \item{matgram}{mat-forming graminoids}
    \item{dwarfshrubs}{dwarf shrubs}
    \item{legumes}{abundance of legumes}
  }
}
\source{kindly provided by the authors}
\references{
Obojes, N.; Bahn, M.; Tasser, E.; Walde, J.; Inauen, N.; Hiltbrunner, E.; Saccone, P.; Lochet, J.; Clément, J. and S. Lavorel (2015) \dQuote{Vegetation Effects on the Water Balance of Mountain Grasslands Depend on Climatic Conditions}, \emph{Ecohydrology}, \bold{8(4)}, 552-569, \doi{10.1002/eco.1524}
.

}
\keyword{datasets}
\examples{

#### Example 10-14

## ------------------------------------------------------------------------
\dontrun{
data("EvapoTransp", package = "pder")
data("etw", package = "pder")
if (requireNamespace("splm")){
    library("splm")
    evapo <- et ~ prec + meansmd + potet + infil + biomass + plantcover +
        softforbs + tallgrass + diversity + matgram + dwarfshrubs + legumes
    semsr.evapo <- spreml(evapo, data=EvapoTransp, w=etw,
                          lag=FALSE, errors="semsr")
    summary(semsr.evapo)
}

## ------------------------------------------------------------------------
library("plm")
if (requireNamespace("lmtest")){
    coeftest(plm(evapo, EvapoTransp, model="pooling"))
}

## ------------------------------------------------------------------------

if (requireNamespace("lmtest") & requireNamespace("splm")){
    coeftest(spreml(evapo, EvapoTransp, w=etw, errors="sem"))
}



#### Example 10-17

## ------------------------------------------------------------------------

if (requireNamespace("lmtest")){
    saremsrre.evapo <- spreml(evapo, data = EvapoTransp,
                              w = etw, lag = TRUE, errors = "semsr")
    summary(saremsrre.evapo)$ARCoefTable
    round(summary(saremsrre.evapo)$ErrCompTable, 6)
}
}
}

