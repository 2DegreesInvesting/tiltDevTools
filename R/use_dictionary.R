#' @export
use_dictionary.tilt_profile <- function(data, ...) {
  levels <- list(unnest_product(data), unnest_company(data))
  name <- deparse(substitute(data))
  names(levels) <- paste0(name, c("_product", "_company"))

  rsetools::use_dictionary(levels)
}
