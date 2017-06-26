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
