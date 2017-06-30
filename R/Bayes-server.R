bayes_server <- function(input, output) {
  sim <- shiny::reactive({
    bayes_sim(input$prior, input$tpr, input$tnr)
  })
  output$bayes_plot <- shiny::renderPlot({
    bayes_plots(sim)
  })
  output$bayes_values <- shiny::renderTable({
    bayes_vals(sim)
  })
}

bayes_sim <- function(prior, tpr, tnr) {
  X <- rep(1:100, times = 100)
  Y <- rep(1:100, each = 100)
  Sick <- rbinom(10000, 1, prob = prior)
  TestResult <- factor(rbinom(10000, 1, prob = Sick*tpr + (1-Sick)*tnr),
                       labels = c("Positive", "Negative"))
  data.frame(X, Y,
             Sick = factor(Sick, labels = c("Healthy", "Sick")),
             TestResult)
}

bayes_plots <- function(sim) {
  ggplot2::ggplot(sim, aes(x=X,y=Y)) +
    ggplot2::geom_tile(aes(fill=Sick),colour="white") +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
          axis.text.x  = ggplot2::element_blank(),
          axis.ticks.x = ggplot2::element_blank(),
          axis.title.y = ggplot2::element_blank(),
          axis.text.y  = ggplot2::element_blank(),
          axis.ticks.y = ggplot2::element_blank())
}


bayes_vals <- function(sim) {
  table(sim[,c("Sick", "TestResult")])
}
