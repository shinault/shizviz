ba_server <- function(input, output) {
  output$plotComparison <- shiny::renderPlot(
    ba_plots(input$sample_size,
             input$prob,
             input$display_normal,
             input$display_pois))
  output$probability_values <- shiny::renderTable(
    ba_probs(input$sample_size,
             input$prob,
             input$lower_bound,
             input$upper_bound))
}

#' Compute probabilities for Binomial, Poisson, Normal, and correct Normal
ba_probs <- function(n, p, a, b) {
  mu <- n*p
  sigma <- sqrt(n*p*(1-p))
  if (a <= b) {
    data.frame(`Actual Probability` = pbinom(b, n, p) - pbinom(a-1, n, p),
      `Poisson Approximation` = ppois(b, mu) - ppois(a-1, mu),
      `Normal Approximation` = pnorm(b, mu, sigma) - pnorm(a, mu, sigma),
      `Normal with Continuity Correction` = pnorm(b+0.5, mu, sigma) - pnorm(a-0.5, mu, sigma),
      check.names = FALSE)
  }
  else {
    c(Actual = 0,
      Poisson = 0,
      Normal = 0,
      NormalCorrection = 0)
  }
}

#' Create a plot of Binomial, Normal, and Poisson densities
ba_plots <- function (n, p, plot_normal, plot_poisson) {
  mu <- n*p
  xvals <- 0:n
  plot(xvals,
       dbinom(xvals, n, p),
       type='h',
       lwd = 5,
       col = 'cornflowerblue',
       bty = 'n',
       xlab='Number of Successes',
       ylab='Probability (Density)'
  )
  if (plot_normal) {
    cxvals <- seq(0, n, by=0.25)
    normalValues <- dnorm(cxvals, mean=mu, sd = sqrt(mu*(1-p)))
    lines( cxvals, normalValues,
           col='chartreuse3',
           lwd=5)
  }
  if (plot_poisson) {
    poisValues <- dpois(xvals, lambda=mu)
    xvals <- xvals + 0.2       # To offset lying on top of the binomial
    lines(xvals, poisValues,
          type='h',
          lwd=5,
          col='orange')
  }
}
