#' Simulation for a Bayesian testing situation
#'
#' @export
bayesFormula <- function() {
  cat("Press ESC key to stop server")
  shiny::runApp(list(ui = bayes_ui, server = bayes_server))
}

#' Compares binomial distribution to Normal and Poisson approximations
#'
#' Run a Shiny app in your web browser to compare the binomial distribution to
#' its approximation using the Normal and Poisson distributions.
#'
#' @export
binomialApproximation <- function() {
  cat("Press ESC key to stop server")
  shiny::runApp(list(ui = ba_ui, server = ba_server))
}

#' Plots a sample of correlated points
#'
#' Run a Shiny app in your web browser to plot a sample of correlated points.
#'
#' @export
correlation <- function() {
  cat("Press ESC key to stop server")
  shiny::runApp(list(ui = corr_ui, server = corr_server))
}
