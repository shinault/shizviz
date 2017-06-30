bayes_param_panel <- shiny::sidebarPanel(
  shiny::withMathJax(),
  shiny::h4('Plot Parameters'),
  shiny::p('Simulation Parameters'),
  shiny::sliderInput('prior',
                     'Prior',
                     min=0,
                     max=1,
                     value = 0.10,
                     step=0.005
  ),
  shiny::sliderInput('tpr',
                     'True Positive Rate',
                     min=0,
                     max=1,
                     value = 0.98,
                     step=0.005
  ),
  shiny::sliderInput('tnr',
                     'True Negative Rate',
                     min=0,
                     max=1,
                     value = 0.98,
                     step=0.005
  )
)

bayes_plot_panel <- shiny::mainPanel(
  shiny::h3('Testing the Whole Population'),
  shiny::plotOutput('bayes_plot'),
  shiny::h3('Empirical Stuff'),
  shiny::tableOutput('bayes_values')
)

bayes_viz_page <- shiny::sidebarLayout(bayes_param_panel, bayes_plot_panel)

bayes_ui <- shiny::shinyUI(
  shiny::navbarPage('Bayes',
                    shiny::tabPanel('Visualization', bayes_viz_page)
  )
)

