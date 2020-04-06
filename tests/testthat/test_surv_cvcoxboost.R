context("surv.cvcoxboost")

test_that("autotest", {
  learner = LearnerSurvCVCoxboost$new()
  expect_learner(learner)
  result = run_autotest(learner)
  expect_true(result, info = result$error)
})
