corr_param_panel <- shiny::sidebarPanel(
  shiny::withMathJax(),
  shiny::h4('Plot Parameters'),
  shiny::p('Correlation'),
  shiny::sliderInput('corr_coef',
                    'Correlation',
                    min=-1,
                    max=1,
                    value = 0.2,
                    step=0.01
  ),
  shiny::sliderInput('n_pts',
                    'Sample Points',
                    min=10,
                    max=100,
                    value = 25,
                    step=1
  )
)

corr_plot_panel <- shiny::mainPanel(
  shiny::h3('Sample of Correlated Points \\(X, Y\\)'),
  shiny::plotOutput('corr_plot'),
  shiny::h3('Theoretical vs. Sample Correlation'),
  shiny::tableOutput('corr_values')
)

corr_viz_page <- shiny::sidebarLayout(corr_param_panel, corr_plot_panel)

corr_ui <- shiny::shinyUI(
  shiny::navbarPage('Correlation',
                    shiny::tabPanel('Visualization', corr_viz_page)
  )
)

