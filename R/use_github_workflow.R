#' Use GitHub-Actions workflows to check a package or a reverse dependency
#'
#' These functions call [reusable
#' workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows#creating-a-reusable-workflow)
#' centrally maintained at 2DegreesInvesting/tiltDevTools.
#' * `use_github_workflow_check()` calls the same workflow you can get
#' with `usethis::use_github_actions("check-standard")`. The benefit is that
#' it's standardized across tilt* repos and you don't have to update it
#' yourself.
#' * `use_github_workflow_check_revdep()` works for packages and reverse
#' dependencies under the same, 2DegreesInvesting organization.
#'
#' @param package Character. The name of a package which is depends on the
#'   package where this workflow runs -- i.e. it's a reverse dependency.
#'
#' @return The first argument, invisibly. Called for its side effect.
#'
#' @examplesIf FALSE
#' # A workflow to run R CMD check on your package
#' use_github_workflow_check()
#'
#' # A workflow to run R CMD check on reverse dependencies of your package
#' use_github_workflow_check_revdep("tiltWebTool")
#' @name use_github_workflow
NULL

#' @export
#' @rdname use_github_workflow
use_github_workflow_check_revdep <- function(package) {
  use_github_workflow(
    template = "call-R-CMD-check-package.yaml",
    data = list(owner_repo = "2DegreesInvesting/tiltDevTools", package = package),
    package = package
  )
}

#' @export
#' @rdname use_github_workflow
use_github_workflow_check <- function() {
  use_github_workflow(
    template = "call-R-CMD-check.yaml",
    data = list(owner_repo = "2DegreesInvesting/tiltDevTools"),
    package = NULL
  )
}

use_github_workflow <- function(template, package, data) {
  parent <- fs::dir_create(".github", "workflows")
  file <- if (is.null(package)) {
    template
  } else {
    path <- fs::path_package(package = "tiltDevTools", "templates", template)
    gsub("package", package, fs::path_file(path))
  }

  save_as <- fs::path(parent, file)

  usethis::use_template(
    template,
    save_as = save_as,
    data = data,
    package = "tiltDevTools"
  )

  invisible(save_as)
}
