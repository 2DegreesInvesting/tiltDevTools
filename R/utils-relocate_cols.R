relocate_cols <- function(data, names = NULL) {
  if (is.null(names)) {
    return(data)
  } else if (is.character(names)) {
    id <- names(data)
  } else if (is.integer(names)) {
    id <- seq_along(names(data))
  } else {
    cli_abort("`names` must be 'character' or 'integer' not '{typeof(names)}'.")
  }

  data[c(names, setdiff(id, names))]
}
