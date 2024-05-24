#' @export
#' @importFrom rsetools use_dictionary
rsetools::use_dictionary

#' Extensions
#'
#' * [rsetools::use_dictionary()] is extended with a method for
#' [tiltIndicator::tilt_profile].
#'
#' @examples
#' library(tiltIndicator)
#'
#' # Fake output of a tilt indicator profile
#' product <- data.frame(companies_id = "a", product_col = 1)
#' company <- data.frame(companies_id = "a", company_col = 2)
#' nested <- nest_levels(product, company)
#' nested
#'
#' nested |> class()
#'
#' # Not very useful
#' nested |> use_dictionary()
#'
#' profile <- nested |> tilt_profile()
#' profile |> class()
#'
#' # Useful
#' # Yes what you want
#' profile |> use_dictionary()
#' @name extensions
NULL

#' @export
use_dictionary.tilt_profile <- function(data, ...) {
  .data <- list(product = unnest_product(data), company = unnest_company(data))
  .name <- deparse(substitute(data))

  for (i in seq_along(.data)) {
    .data[[i]] <- use_dictionary(.data[[i]], name = .name)
    .data[[i]]$level <- names(.data[i])
  }

  out <- Reduce(rbind, .data)
  relocate_cols(out, c("dataset", "level"))
}
