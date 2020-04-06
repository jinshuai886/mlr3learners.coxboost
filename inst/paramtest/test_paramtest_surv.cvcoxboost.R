library(mlr3learners.CoxBoost)

test_that("surv.cvcoxboost", {
  learner = lrn("surv.cvcoxboost")
  fun = CoxBoost::cv.CoxBoost
  exclude = c("time",
              # coerced internally
              "status",
              # coerced internally
              "x",
              # coerced internally
              "subset",
              # handled by task
              "weights",
              # handled by task
              "parallel",
              # handled by future
              "upload.x",
              # handled by future
              "multicore" # handled by future
              )

              ParamTest = run_paramtest(learner, fun, exclude)
              expect_true(ParamTest, info = paste0(
                "\nMissing parameters:\n",
                paste0("- '", ParamTest$missing, "'", collapse = "\n")
              ))
})

  # example for checking a "control" function of a learner
  test_that("surv.cvcoxboost_control", {
    learner = lrn("surv.cvcoxboost")
    fun = CoxBoost::optimCoxBoostPenalty # replace!
    exclude = c("time", # coerced internally
                "status", # coerced internally
                "x", # coerced internally
                "parallel" # handled by future
                )

                ParamTest = run_paramtest(learner, fun, exclude)
                expect_true(ParamTest, info = paste0(
                  "\nMissing parameters:\n",
                  paste0("- '", ParamTest$missing, "'", collapse = "\n")
                ))
  })
