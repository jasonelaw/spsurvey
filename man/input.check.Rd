% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/input.check.R
\name{input.check}
\alias{input.check}
\title{Check Input Values for Analytical Functions}
\usage{
input.check(nresp, wgt, sigma, var.sigma, xcoord, ycoord, stratum.ind,
  stratum, stratum.levels, nstrata, cluster.ind, cluster, cluster.levels,
  ncluster, wgt1, xcoord1, ycoord1, popsize, pcfactor.ind, pcfsize,
  N.cluster, stage1size, support, swgt.ind, swgt, swgt1, vartype, conf,
  cdfval = NULL, pctval = NULL, subpop = NULL)
}
\arguments{
\item{nresp}{The number of response values.}

\item{wgt}{Vector of the final adjusted weights.}

\item{sigma}{Measurement error variance.}

\item{var.sigma}{Variance of the measurement error variance.}

\item{xcoord}{Vector of the x-coordinates for location.}

\item{ycoord}{Vector of the y-coordinates for location.}

\item{stratum.ind}{Logical value that indicates whether the sample is
stratified, where TRUE = a stratified sample and FALSE = not a stratified
sample.}

\item{stratum}{Vector of the stratum codes.}

\item{stratum.levels}{Levels of the stratum variable.}

\item{nstrata}{Number of strata.}

\item{cluster.ind}{Logical value that indicates whether the sample is a
two- stage sample, where TRUE = a two-stage sample and FALSE = not a two-
stage sample.}

\item{cluster}{Vector of the stage one sampling unit codes.}

\item{cluster.levels}{Factor levels of the stage one sampling unit codes.}

\item{ncluster}{The number of stage one sampling units in the sample.}

\item{wgt1}{Vector of the final adjusted stage one weights.}

\item{xcoord1}{Vector of the stage one x-coordinates for location.}

\item{ycoord1}{Vector of the stage one y-coordinates for location.}

\item{popsize}{Known size of the resource.}

\item{pcfactor.ind}{Logical value that indicates whether the population
correction factor is used during variance estimation, where TRUE = use the
population correction factor and FALSE = do not use the factor. To employ
the correction factor for a single-stage sample, values must be supplied
for arguments pcfsize and support.  To employ the correction factor for a
two-stage sample, values must be supplied for arguments N.cluster,
stage1size, and support.}

\item{pcfsize}{Size of the resource, which is required for calculation of
finite and continuous population correction factors for a single-stage
sample.  For a stratified sample this argument must be a vector containing
a value for each stratum and must have the names attribute set to identify
the stratum codes.}

\item{N.cluster}{Number of stage one sampling units in the resource.}

\item{stage1size}{Known size of the stage one sampling units.}

\item{support}{Vector of the support for each sampling unit.}

\item{swgt.ind}{Logical value that indicates whether the sample is a size-
weighted sample, where TRUE = a size-weighted sample and FALSE = not a
size-weighted sample.}

\item{swgt}{Vector of  the size-weight for each site.}

\item{swgt1}{Vector of the stage one size-weight for each site.}

\item{vartype}{The choice of variance estimator, where "Local" = local mean
estimator and "SRS" = SRS estimator.}

\item{conf}{The confidence level.}

\item{cdfval}{Vector of the set of values at which the CDF is estimated.}

\item{pctval}{Vector of the set of values at which percentiles are
estimated.}

\item{subpop}{Data frame describing sets of populations and subpopulations
for which estimates will be calculated.}
}
\value{
A list consisting of popsize, pcfsize, N.cluster, and stage1size.
}
\description{
This function checks input values for errors, consistency, and compatibility
with analytical functions.
}
\section{Other Functions Required}{

  \describe{
    \item{\code{\link{vecprint}}}{takes an input vector and outputs a
      character string with line breaks inserted}
  }
}

\author{
Tom Kincaid \email{Kincaid.Tom@epa.gov}
}
