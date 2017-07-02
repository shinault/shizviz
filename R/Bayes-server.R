bayes_server <- function(input, output) {
  sim <- shiny::reactive({
    bayes_sim(input$prior, input$tpr, input$tnr,80,60)
  })
  output$bayes_plot <- shiny::renderPlot({
    bayes_plots(sim())
  })
  output$bayes_values <- shiny::renderTable({
    bayes_vals(sim())
  })
}

bayes_sim <- function(prior, tpr, tnr, width, height) {
  X <- rep(1:width, times = height)
  Y <- rep(1:height, each = width)
  Sick <- rbinom(width*height, 1, prob = prior)
  TestResult <- factor(rbinom(width*height, 1, prob = Sick*tpr + (1-Sick)*(1-tnr)),
                       levels = c(1,0),
                       labels = c("Positive", "Negative"))
  data.frame(X, Y,
             Wellness = factor(Sick,
                               levels = c(0, 1),
                               labels = c("Healthy", "Sick")),
             `Test Result` = TestResult,
             check.names = FALSE)
}

bayes_plots <- function(sim) {
  ggplot2::ggplot(sim, ggplot2::aes(x=X,y=Y)) +
    ggplot2::geom_tile(ggplot2::aes(fill=Wellness),colour="white") +
    ggplot2::scale_fill_manual(values = c(Healthy = "#0039e6", Sick = "#ff1a1a")) +
    ggplot2::geom_point(ggplot2::aes(shape=`Test Result`)) +
    ggplot2::scale_shape_manual(values=c(4, 32)) +
    ggplot2::theme(panel.grid.major = ggplot2::element_blank(),
                   panel.grid.minor = ggplot2::element_blank(),
                   panel.background = ggplot2::element_blank(),
                   axis.title.x = ggplot2::element_blank(),
                   axis.text.x  = ggplot2::element_blank(),
                   axis.ticks.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank(),
                   axis.text.y  = ggplot2::element_blank(),
                   axis.ticks.y = ggplot2::element_blank())
}


bayes_vals <- function(sim) {
  res <- as.data.frame(table(sim[,c("Wellness", "Test Result")]))
  colnames(res) = c("Wellness", "Test Result", "Count")
  res
}
