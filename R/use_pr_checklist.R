#' Use stuff
#'
#' @inherit usethis::use_github_file
#'
#' @return See the corresponding function in
#'   [usethis](https://usethis.r-lib.org/reference/index.html).
#' @export
#'
#' @examplesIf interactive()
#' use_pr_checklist()
use_pr_checklist <- function(repo_spec = "2DegreesInvesting/tiltIndicator",
                             path = ".github/pull_request_template.md") {
  usethis::use_directory(".github")
  usethis::use_build_ignore(".github")
  usethis::use_github_file(
    repo_spec,
    path = path,
    save_as = path,
    overwrite = TRUE
  )
}
