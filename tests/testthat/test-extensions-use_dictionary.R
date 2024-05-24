test_that("names datasets with correct structure", {
  product <- tibble::tibble(companies_id = 1, a_product_col = "a")
  company <- tibble::tibble(companies_id = 1, a_company_col = "a")
  profile <- tiltIndicator::tilt_profile(
    tiltIndicator::nest_levels(product, company)
  )

  out <- use_dictionary(profile)

  expect_snapshot(use_dictionary(profile))
})
