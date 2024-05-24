
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tiltDevTools

<!-- badges: start -->

[![R-CMD-check](https://github.com/2DegreesInvesting/tiltDevTools/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/2DegreesInvesting/tiltDevTools/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of tiltDevTools is to help you reuse development tools.

## Installation

You can install the development version of tiltDevTools from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("2DegreesInvesting/tiltDevTools")
```

## Example

``` r
library(tiltIndicator)
library(tiltDevTools)

profile <- tilt_profile(nest_levels(
  product = tibble(companies_id = "a", x = 1),
  company = tibble(companies_id = "a", y = TRUE)
))

profile
#> # A tibble: 1 × 3
#>   companies_id product          company         
#> * <chr>        <list>           <list>          
#> 1 a            <tibble [1 × 1]> <tibble [1 × 1]>
```

``` r

use_dictionary(profile)
#> # A tibble: 4 × 5
#>   dataset level   name         type      definition
#>   <chr>   <chr>   <chr>        <chr>     <chr>     
#> 1 profile product companies_id character <NA>      
#> 2 profile product x            double    <NA>      
#> 3 profile company companies_id character <NA>      
#> 4 profile company y            logical   <NA>
```
