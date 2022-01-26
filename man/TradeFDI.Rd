\name{TradeFDI}
\docType{data}
\alias{TradeFDI}
\title{Trade and Foreign Direct Investment in Germany and the United States}
\description{yearly observations of 490 combinations of countries / industries from 1989 to 1999

    \emph{number of observations} : 3860

    \emph{number of  time-series } :  11 

    \emph{country} :  Germany and United States 

    \emph{package} : gravity

    \emph{JEL codes: }F12, F14, F21, F23

    \emph{Chapter} : 06

}
\usage{data(TradeFDI)}
\format{A dataframe containing:
  \describe{
    \item{id}{id}
    \item{year}{time period}
    \item{country}{country name}
    \item{indusid}{industry code}
    \item{importid}{importer code}
    \item{lrex}{log real bilateral exports}
    \item{lrfdi}{log real bilateral outward stocks of FDI}
    \item{lgdt}{log sum of bilateral real GDP}
    \item{lsimi}{log (1-[exporter GDP/(exporter+importer GDP)]^2- [exporter GDP/(exporter+importer GDP)]^2)}
    \item{lrk}{log (real capital stock of exporter/real capital stock of importer)}
    \item{lrh}{log (secondary school enrolment of exporter/secondary school enrolment of importer)}
    \item{lrl}{log (labor force of exporter/labor force of importer)}
    \item{ldist}{log bilateral distance between exporter and importer}
    \item{lkldist}{(lrk-lrl) * ldist}
    \item{lkgdt}{abs(lrk)*lgdt}
  }
}
\source{Journal of Applied Econometrics Data Archive : \url{http://qed.econ.queensu.ca/jae/}}
\references{
Peter Egger and Michael Pfaffermayr (2004) \dQuote{Distance, Trade, and Fdi: A Hausman-taylor Sur Approach}, \emph{Journal of Applied Econometrics}, \bold{19(2)}, 227--246, \doi{10.1002/jae.721}
.

}
\keyword{datasets}
