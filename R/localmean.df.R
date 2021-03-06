##############################################################################
# Function: localmean.df
# Programmer: Tom Kincaid
# Date: April 8, 2003
#
#' Internal Function: Degrees of Freedom for Local Mean Variance-Covariance
#' Estimator
#'
#' This function calculates the degrees of freedom of the local mean variance-
#' covariance estimator.
#'
#' @param weight.lst List from the local mean weight function containing two
#'   elements: a matrix named ij composed of the index values of neighboring
#'   points and a vector named gwt composed of weights.
#'
#' @return The degrees of freedom of the local mean variance-covariance
#'   estimator.
#'
#' @author Tom Kincaid \email{Kincaid.Tom@epa.gov}
#'
#' @export
###############################################################################

localmean.df <- function(weight.lst) {

# Create the matrix of coefficients used in calculating the local mean variance
# estimator

   n <- max(weight.lst$ij[,1])
   df.mat <- array(0, c(n,n))
   df.mat[weight.lst$ij] <- -weight.lst$gwt
   diag(df.mat) <- 1 + diag(df.mat)

# Calculate the degrees of freedom

   df <- qr(df.mat)$rank

# Return the result

   df
}
