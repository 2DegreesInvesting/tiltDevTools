#' Extend `use_dictionary()` for objects of class 'tilt_profile'
#'
#' @name use_dictionary
#' @importFrom rsetools use_dictionary
#' @inherit rsetools::use_dictionary
#' @seealso [rsetools::use_dictionary()].
#'
#' @export
#' @examples
#' library(tiltIndicator)
#' library(rsetools)
#'
#' # Fake output of a tilt indicator profile
#' product <- data.frame(companies_id = "a", product_col = 1)
#' company <- data.frame(companies_id = "a", company_col = 2)
#' nested <- nest_levels(product, company)
#' nested
#'
#' nested |> class()
#' # Not what you want
#' nested |> use_dictionary()
#'
#' profile <- nested |> tilt_profile()
#' profile |> class()
#' # Yes what you want
#' profile |> use_dictionary()
use_dictionary.tilt_profile <- function(data, ...) {
  levels <- list(unnest_product(data), unnest_company(data))
  name <- deparse(substitute(data))
  names(levels) <- paste0(name, c("_product", "_company"))

  rsetools::use_dictionary(levels)
}
