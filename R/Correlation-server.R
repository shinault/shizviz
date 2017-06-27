corr_server <- shiny::shinyServer(
  function(input, output){
    var_x <- 4
    var_y <- 9
    corr_coef <- 0.2
    cov_xy <- sqrt(var_x*var_y)*corr_coef
    cov_mat <- matrix(c(var_x, cov_xy, cov_xy, var_y), nrow = 2)
    xs_ys <- mvtnorm::rmvnorm(100, mean = c(3,4),
                              sigma = cov_mat)
    xs <- xs_ys[,1]
    ys <- xs_ys[,2]
    output$corr_plot <- shiny::renderPlot(
      corr_plots(xs, ys, input$n_pts))
    output$corr_values <- shiny::renderPrint(
      corr_vals(xs, ys, input$n_pts, input$corr_coef))
  }
)



corr_plots <- function(xs, ys, n) {
  plot(xs[1:n], ys[1:n], asp = 1)
}

corr_vals <- function(xs, ys, n, sig) {
  c(`Theoretical Correlation`=sig,
    `Empirical Correlation`=cor(xs[1:n],ys[1:n]))
}
