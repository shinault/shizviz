# shizviz

Interactive visualizations can be very helpful for students of all subjects. 
The `shizviz` package provides functions that run Shiny apps that could prove
illustrative for probability and statistics students.

You can install this package using `devtools` at the R command line.  First, 
make sure that `devtools` is installed.
```r
install.packages("devtools")
```
Then use the `install_github` function to install the package from GitHub.
```r
devtools::install_github("shinault/shizviz")
```

## Available Visualizations

The following commands call a visualization.
* `bayesFormula()`: Runs a simulation and creates a plot of the classic Bayes
example, testing accuracy rare diseases.
* `binomialApproximation()`: Creates a probability density plot to compare the 
binomial distribution to its approximations using the Normal distribution, the
Poisson distribution, and the Normal distribution with a continuity correction.
A version of this app with discussion is hosted
[here](https://shinault.shinyapps.io/BinomialApprox/).
* `correlation()`: Creates a scatter plot for a randoms sample of bivariate data
with the user chosen correlation.

