if (Sys.info()[["sysname"]] == "Darwin") {
  options(repos = structure(c(
                              CRAN = "https://stat.ethz.ch/CRAN/"#,
                              #mlr3learners = 'https://mlr3learners.github.io/mlr3learners.drat'
  )))
}
#options(repos = BiocManager::repositories())

