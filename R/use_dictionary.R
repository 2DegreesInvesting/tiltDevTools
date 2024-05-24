#' @export
#' @importFrom rsetools use_dictionary
rsetools::use_dictionary

#' @export
#' @rdname extensions
#'
#' @description
#' *  [rsetools::use_dictionary()].
#'
#' @param data A '[tilt_profile][tiltIndicator::tilt_profile]'.
#' @inheritDotParams rsetools::use_dictionary
#'
#' @examples
#' library(tiltIndicator)
#'
#' profile <- tilt_profile(nest_levels(
#'   product = tibble(companies_id = "a", x = 1),
#'   company = tibble(companies_id = "a", y = TRUE)
#' ))
#' class(profile)
#'
#' profile
#'
#' use_dictionary(profile)
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
