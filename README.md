
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
library(tiltDevTools)
library(tiltIndicator)

# Fake the output of some tilt indicator profile
product <- data.frame(companies_id = 1, a_product_col = "a")
company <- data.frame(companies_id = 1, a_company_col = "a")
emissions_profile <- tilt_profile(nest_levels(product, company))
emissions_profile
#> # A tibble: 1 × 3
#>   companies_id product          company         
#> *        <dbl> <list>           <list>          
#> 1            1 <tibble [1 × 1]> <tibble [1 × 1]>
```

``` r

use_dictionary(emissions_profile)
#> # A tibble: 4 × 4
#>   dataset                   name          typeof    definition
#>   <chr>                     <chr>         <chr>     <chr>     
#> 1 emissions_profile_product companies_id  double    <NA>      
#> 2 emissions_profile_product a_product_col character <NA>      
#> 3 emissions_profile_company companies_id  double    <NA>      
#> 4 emissions_profile_company a_company_col character <NA>
```
