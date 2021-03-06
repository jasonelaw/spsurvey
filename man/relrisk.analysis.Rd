% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/relrisk.analysis.R
\name{relrisk.analysis}
\alias{relrisk.analysis}
\title{Relative Risk Analysis for Probability Survey Data}
\usage{
relrisk.analysis(sites = NULL, subpop = NULL, design, data.rr,
  response.var, stressor.var, response.levels = rep(list(c("Poor",
  "Good")), length(response.var)), stressor.levels = rep(list(c("Poor",
  "Good")), length(stressor.var)), popcorrect = FALSE, pcfsize = NULL,
  N.cluster = NULL, stage1size = NULL, sizeweight = FALSE,
  vartype = "Local", conf = 95)
}
\arguments{
\item{sites}{Data frame consisting of two variables: the first variable is
site IDs, and the second variable is a logical vector indicating which
sites to use in the analysis.  The default is NULL.}

\item{subpop}{Data frame describing sets of populations and subpopulations
for which estimates will be calculated.  The first variable is site IDs.
Each subsequent variable identifies a Type of population, where the
variable name is used to identify Type.  A Type variable identifies each
site with one of the subpopulations of that Type.  The default is NULL.}

\item{design}{Data frame consisting of design variables.  If spsurvey.obj
is not provided, then this argument is required.  The default is NULL.
Variables should be named as follows:
  \describe{
    \item{siteID}{Vector of site IDs}
    \item{wgt}{Vector of weights, which are either the weights for a
      single-stage sample or the stage two weights for a two-stage sample}
    \item{xcoord}{Vector of x-coordinates for location, which are either
      the x-coordinates for a single-stage sample or the stage two
      x-coordinates for a two-stage sample}
    \item{ycoord}{Vector of y-coordinates for location, which are either
      the y-coordinates for a single-stage sample or the stage two
      y-coordinates for a two-stage sample}
    \item{stratum}{Vector of the stratum codes for each site}
    \item{cluster}{Vector of the stage one sampling unit (primary sampling
      unit or cluster) codes for each site}
    \item{wgt1}{Vector of stage one weights in a two-stage design}
    \item{xcoord1}{Vector of the stage one x-coordinates for location in a
      two-stage design}
    \item{ycoord1}{Vector of the stage one y-coordinates for location in a
      two-stage design}
    \item{support}{Vector of support values - for a finite resource, the
      value one (1) for a for site.  For an extensive resource, the measure
      of the sampling unit associated with a site.  Required for
      calculation of finite and continuous population 
      correction factors.}
    \item{swgt}{Vector of size-weights, which is the stage two size-weight
      for a two-stage design.}
    \item{swgt1}{Vector of stage one size-weights for a two-stage design.}
  }}

\item{data.rr}{Data frame of categorical response and stressor variables,
where each variable consists of two categories.  If response or stressor
variables include more than two categories, occurrences of those categories
must be removed or replaced with missing values.  The first column of this
argument is site IDs.  Subsequent columns are response and stressor
variables.  Missing data (NA) is allowed.}

\item{response.var}{Character vector providing names of columns in argument
data.rr that contain a response variable, where names may be repeated. Each
name in this argument is matched with the corresponding value in the
stressor.var argument.}

\item{stressor.var}{Character vector providing names of columns in
argument data.rr that contain a stressor variable, where names may be
repeated. Each name in this argument is matched with the corresponding
value in the response.var argument.  This argument must be the same length
as argument response.var.}

\item{response.levels}{List providing the category values (levels) for each
element in the response.var argument.  This argument must be the same
length as argument response.var.  The first level for each element in the
list is used for calculating the numerator and the denominator of the
relative risk estimate.  The default is a list containing the values "Poor"
and "Good" for the first and second levels, respectively, of each element
in the response.var argument.}

\item{stressor.levels}{List providing the category values (levels) for each
element in the stressor.var argument.  This argument must be the same
length as argument response.var.  The first level for each element in the
list is used for calculating the numerator of the relative risk estimate,
and the second level for each element in the list is used for calculating
the denominator of the estimate.  The default is a list containing the
values "Poor" and "Good" for the first and second levels, respectively, of
each element in the stressor.var argument.}

\item{popcorrect}{Logical value that indicates whether finite or continuous
population correction factors should be employed during variance
estimation, where TRUE = use the correction factor and FALSE = do not use
the correction factor.  The default is FALSE.  To employ the correction
factor for a single-stage sample, values must be supplied for argument
pcfsize and for the support variable of the design argument.  To employ the
correction factor for a two-stage sample, values must be supplied for
arguments N.cluster and stage1size, and for the support variable of the
design argument.}

\item{pcfsize}{Size of the resource, which is required for calculation of
finite and continuous population correction factors for a single-stage
sample. For a stratified sample this argument must be a vector containing a
value for each stratum and must have the names attribute set to identify
the stratum codes.  The default is NULL.}

\item{N.cluster}{The number of stage one sampling units in the resource,
which is required for calculation of finite and continuous population
correction factors for a two-stage sample.  For a stratified sample this
argument must be a vector containing a value for each stratum and must have
the names attribute set to identify the stratum codes.  The default is
NULL.}

\item{stage1size}{Size of the stage one sampling units of a two-stage
sample, which is required for calculation of finite and continuous
population correction factors for a two-stage sample and must have the
names attribute set to identify the stage one sampling unit codes.  For a
stratified sample, the names attribute must be set to identify both stratum
codes and stage one sampling unit codes using a convention where the two
codes are separated by the & symbol, e.g., "Stratum 1&Cluster 1". The
default is NULL.}

\item{sizeweight}{Logical value that indicates whether size-weights should be
used in the analysis, where TRUE = use the size-weights and FALSE = do not
use the size-weights.  The default is FALSE.}

\item{vartype}{The choice of variance estimator, where "Local" = local mean
estimator and "SRS" = SRS estimator.  The default is "Local".}

\item{conf}{Numeric value for the confidence level.  The default is 95.}
}
\value{
Data frame of relative risk estimates for all combinations of
  population Types, subpopulations within Types, and response variables.
  Standard error and confidence interval estimates also are provided.
}
\description{
This function organizes input and output for relative risk analysis of
categorical data generated by a probability survey.
}
\section{Other Functions Required}{

  \describe{
    \item{\code{\link{dframe.check}}}{check site IDs, the sites data frame,
      the subpop data frame, and the data.rr data frame to assure valid
      contents and, as necessary, create the sites data frame and the subpop
      data frame}
    \item{\code{\link{vecprint}}}{takes an input vector and outputs a
      character string with line breaks inserted}
    \item{\code{\link{uniqueID}}}{creates unique site IDs by appending a
      unique number to each occurrence of a site ID}
    \item{\code{\link{input.check}}}{check input values for errors,
      consistency, and compatibility with analytical functions}
    \item{\code{\link{relrisk.est}}}{compute the relative risk estimate}
  }
}

\examples{
mysiteID <- paste("Site", 1:100, sep="")
mysites <- data.frame(
  siteID=mysiteID,
  Active=rep(TRUE, 100))
mysubpop <- data.frame(
  siteID=mysiteID,
  All.Sites=rep("All Sites", 100),
  Resource.Class=rep(c("Agr", "Forest"), c(55,45)))
mydesign <- data.frame(
  siteID=mysiteID,
  wgt=runif(100, 10, 100),
  xcoord=runif(100),
  ycoord=runif(100),
  stratum=rep(c("Stratum1",
  "Stratum2"), 50))
mydata.rr <- data.frame(
  siteID=mysiteID,
  RespVar1=sample(c("Poor", "Good"), 100, replace=TRUE),
  RespVar2=sample(c("Poor", "Good"), 100, replace=TRUE),
  StressVar=sample(c("Poor", "Good"), 100, replace=TRUE))
relrisk.analysis(sites=mysites, subpop=mysubpop, design=mydesign,
  data.rr=mydata.rr, response.var=c("RespVar1", "RespVar2"),
  stressor.var=rep("StressVar", 2))

}
\author{
Tom Kincaid \email{Kincaid.Tom@epa.Gov}
}
\keyword{survey}
