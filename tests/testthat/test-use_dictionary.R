test_that("names datasets with correct suffix", {
  product <- data.frame(companies_id = 1, a_product_col = "a")
  company <- data.frame(companies_id = 1, a_company_col = "a")
  profile <- tiltIndicator::tilt_profile(
    tiltIndicator::nest_levels(product, company)
  )

  out <- use_dictionary(profile)
  expect_equal(unique(out$dataset), c("profile_product", "profile_company"))
})
