ba_param_panel <- shiny::sidebarPanel(
  shiny::withMathJax(),
  shiny::h4('Binomial Parameters'),
  shiny::p('For \\(X \\sim \\text{Binomial}(n, p)\\)'),
  shiny::numericInput('sample_size',
                      'Sample Size: \\(n\\)',
                      25,
                      min=0,
                      max=1000,
                      step=1
  ),
  shiny::numericInput('prob',
                      'Success Probability: \\(p\\)',
                      0.50,
                      min=0,
                      max=1,
                      step=0.01
  ),
  shiny::h4('Probability Bounds'),
  shiny::p('For \\(\\mathbb{P}(a \\leq X \\leq b)\\)'),
  shiny::numericInput('lower_bound',
                      'Lower Bound: \\(a\\)',
                      10,
                      min=0,
                      max=1000,
                      step=1
  ),
  shiny::numericInput('upper_bound',
                      'Upper Bound: \\(b\\)',
                      15,
                      min=0,
                      max=1000,
                      step=1
  ),
  shiny::h4('Display Options'),
  shiny::checkboxInput('display_normal',
                       'Plot Normal Density Function',
                       value=FALSE
  ),
  shiny::checkboxInput('display_pois',
                       'Plot Poisson Mass Function',
                       value=FALSE
  )
)

ba_plot_panel <- shiny::mainPanel(
  shiny::h3('Visual Comparison of Approximations'),
  shiny::plotOutput('plotComparison'),
  shiny::h3('Quantitative Comparison of Approximations'),
  shiny::tableOutput('probability_values')
)

ba_viz_page <- shiny::sidebarLayout(ba_param_panel, ba_plot_panel)

ba_ui <- shiny::shinyUI(
  shiny::navbarPage('Binomial Approximation',
                    shiny::tabPanel('Visualization', ba_viz_page)
  )
)



