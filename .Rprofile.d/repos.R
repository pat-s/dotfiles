if (Sys.info()[["sysname"]] == "Darwin") {
  options(repos = structure(c(
    CRAN = "https://stat.ethz.ch/CRAN/" # ,
    # mlr3learners = 'https://mlr3learners.github.io/mlr3learners.drat'
  )))
} else if (Sys.info()[["nodename"]] == "parallels") {
  options(repos = structure(c(
    CRAN = "https://packagemanager.rstudio.com/all/__linux__/focal/latest"
  )))
}
