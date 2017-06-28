corr_server <- function(input, output) {
  var_x <- 4
  var_y <- 9
  cov_xy <- shiny::reactive({
    sqrt(var_x*var_y)*input$corr_coef})
  cov_mat <- shiny::reactive({
    matrix(c(var_x, cov_xy(), cov_xy(), var_y), nrow = 2)})
  xs_ys <- shiny::reactive({
    mvtnorm::rmvnorm(100, mean = c(3,4), sigma = cov_mat())})
  xs <- shiny::reactive({
    bvn <- xs_ys()
    bvn[,1]})
  ys <- shiny::reactive({
    bvn <- xs_ys()
    bvn[,2]})
  output$corr_plot <- shiny::renderPlot({
    corr_plots(xs(), ys(), input$n_pts)})
  output$corr_values <- shiny::renderTable({
    corr_vals(xs(), ys(), input$n_pts, input$corr_coef)})
}

corr_plots <- function(xs, ys, n) {
  plot(xs[1:n], ys[1:n], asp = 1, pch=19, xlab = "X", ylab = "Y",
       xlim = c(min(xs), max(xs)), ylim = c(min(ys), max(ys)))
}

corr_vals <- function(xs, ys, n, sig) {
  data.frame(`Theoretical Correlation`=sig,
    `Empirical Correlation`=cor(xs[1:n],ys[1:n]),
    check.names = FALSE)
}
