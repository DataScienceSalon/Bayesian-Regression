#==============================================================================#
#                   Bayes Model Averaging Predictions                          #
#==============================================================================#
#' bmaPredict
#'
#' \code{bmaPredict} Performs prediction using a single model and estimator
#' 
#' Performs predictions on a single model and estimator and returns MSE and
#' optionally, residual vs fitted, parameter estimates and prediction
#' distributions on existing training data or new test data.
#'
#' @param model BAS.LM object
#' @param estimator String indicating which estimator to use. Options are 'BMA', 'BPM', 'HPM', & 'MPM'
#' @param yX Optional data frame containing test data
#' @param trial Numeric indicator of the trial number when repeated trials are being conducted.
#' @param prediction Logical value to indicate whether the observed design matrix 
#' used in fitting or the newdata will be used for estimating the mean or 
#' for making predictions. The default is FALSE for estimation of the mean.
#' @param rvp Logical indicating whether to return residuals vs predicted (fitted) data frame
#' @param pe Logical indicating whether to return paramater estimates
#' @param predObj Logical.  If TRUE, the object from the predict function is returned.
#'
#' @return mse frame containing MSE measures for each model
#'
#' @author John James, \email{jjames@@yXsciencesalon.org}
#' @family BMA functions
#' @export
bmaPredict <- function(model, estimator, yX = NULL, trial = NULL, prediction = FALSE, rvp = FALSE, 
                       pe = FALSE, predObj = FALSE) {
  
  p <- list()
  estimators <- c("BMA", "BPM", "HPM", "MPM")
  
  if (!(estimator %in% estimators)) stop("Invalid estimator. Must be 'BMA', BPM', 'HPM', or 'MPM'.")
  
  p$prior <- model$prior
  p$priorDesc <- model$priorDesc
  p$estimator <- estimator
  
  # Perform prediction
  if (missing(yX)) {
    y <- model$Y
    pred <- predict(object = model, se.fit = pe, 
                            estimator = estimator, prediction = prediction)
  } else {
    y <- yX$audience_score
    pred <- predict(object = model, newdata = yX, se.fit = pe, 
                            estimator = estimator, prediction = prediction)
  }
  if (predObj == TRUE) p$pred <- pred
  
  # Prepare MSE
  Yhat <- pred$fit
  p$MSE <- data.frame(Prior = model$prior,
                      PriorDesc = model$priorDesc,
                      Estimator = estimator,
                      MSE = mean((y - Yhat)^2))
  if (!(is.null(trial))) {
    p$MSE <- cbind(Trial = trial, p$MSE)
  }
  
  # Prepare residual vs prediction data frame 
  if (rvp == TRUE) {
    p$rvp <- data.frame(Residual = (y - Yhat), Predicted = Yhat)
  }
  
  # Prepare parameter estimates
  if (pe == TRUE) {
    p$pe <- bmaPDC(m = model, estimator = estimator)
  }
  
  return(p)
}
