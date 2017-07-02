bayes_param_panel <- shiny::sidebarPanel(
  shiny::withMathJax(),
  shiny::h4('Simulation Parameters'),
  shiny::sliderInput('prior',
                     'Prior',
                     min=0,
                     max=1,
                     value = 0.10,
                     step=0.005
  ),
  shiny::sliderInput('tpr',
                     'Sensitivity',
                     min=0,
                     max=1,
                     value = 0.98,
                     step=0.005
  ),
  shiny::sliderInput('tnr',
                     'Specificity',
                     min=0,
                     max=1,
                     value = 0.98,
                     step=0.005
  ),
  shiny::h4("Terminology"),
  shiny::p("The prior is the proportion of the entire population that has the
           disease.  This is the probability a randomly chosen person has the
           disease."),
  shiny::p("The sensitivity is also called the true positive rate. This is the
           probability that a person with the disease tests positive."),
  shiny::p("The specificity is also called the true negative rate. This is the
           probability that a person without the disease tests negative.")
)

bayes_plot_panel <- shiny::mainPanel(
  shiny::h3('Testing the Whole Population'),
  shiny::plotOutput('bayes_plot'),
  shiny::h3('Testing Outcomes'),
  shiny::tableOutput('bayes_values')
)

bayes_viz_page <- shiny::sidebarLayout(bayes_param_panel, bayes_plot_panel)

bayes_ui <- shiny::shinyUI(
  shiny::navbarPage('Bayes',
                    shiny::tabPanel('Visualization', bayes_viz_page)
  )
)

