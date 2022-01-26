\name{usaw}
\docType{data}
\alias{usaw}
\alias{usaw49}
\alias{usaw46}
\title{Spatial weights matrix - 49 US states}

\description{
Spatial weights matrix of the 48 continental US States plus District of Columbia based on the queen contiguity criterium.  

}

\usage{
data(usaw49)
data(usaw46)
}

\format{ A matrix with elements different from zero if state i and j are
neighbors. Weights are row standardized. According to the queen
contiguity criterium, Arizona and Colorado are considered
neighbours. Two versions are provided, one for 49 States, the other one
for 46 States.}

\author{Giovanni Millo}

\keyword{datasets}
