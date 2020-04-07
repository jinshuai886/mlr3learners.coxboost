library(mlr3learners.CoxBoost)

test_that("surv.coxboost", {
  learner = lrn("surv.coxboost")
  fun = CoxBoost::CoxBoost
  exclude = c("time", # coerced internally
              "status", # coerced internally
              "x", # coerced internally
              "subset", # handled by task
              "weights" # handled by task
              )

              ParamTest = run_paramtest(learner, fun, exclude)
              expect_true(ParamTest, info = paste0(
                "\nMissing parameters:\n",
                paste0("- '", ParamTest$missing, "'", collapse = "\n")
              ))
})
