options(
  usethis.full_name = "Patrick Schratz",
  usethis.protocol = "ssh",
  usethis.description = list(
    `Authors@R` = 'person("Patrick", "Schratz", email = "patrick.schratz@gmail.com", role = c("aut", "cre"),
    comment = c(ORCID = "0000-0003-0748-6624"))',
    Version = "0.0.0.9000"
  ),
  startup.check.options.ignore = "stringsAsFactors",
  Ncpus = 10L,
  reprex.style = TRUE,
  # suppress rmarkdown vignettes warnings
  rmarkdown.html_vignette.check_title = FALSE,
  startup.check.options.ignore = "error",
  # do not print e-10 for small numbers
  scipen = 999
)
if (Sys.info()["sysname"] == "Darwin") {
  options(
    Ncpus = 10L,
    install.packages.check.source = "no",
    pkgType = "source",
    precommit.path_cp_config_from = "https://raw.githubusercontent.com/mlr-org/mlr/master/.pre-commit-config.yaml"
  )
}

if (Sys.info()["sysname"] == "Darwin" && Sys.info()[["machine"]] == "arm64") {
    options(precommit.executable = "/opt/homebrew/bin/pre-commit")
} else if (Sys.info()["sysname"] == "Darwin" && Sys.info()[["machine"]] == "x86_64") {
      options(precommit.executable = "/usr/local/bin/pre-commit")
}


if (grepl("mlr", getwd()) || grepl("paradox", getwd())) {
  options(styler.addins_style_transformer = "styler.mlr::mlr_style()")
}

# tibble > data.frame
# if (interactive() && "tibble" %in% rownames(utils::installed.packages())) {
#  print.data.frame = function(x, ...) {
#    tibble:::print.tbl_df(tibble::as_tibble(x), ...)
#  }
# }

if (as.numeric(version$major) >= 4) {
  options(stringsAsFactors = FALSE)
  Sys.setenv("R_DEV" = TRUE)
}

# from https://renkun.me/2020/03/31/a-simple-way-to-show-stack-trace-on-error-in-r/
options(error = function() {
  calls <- sys.calls()
  if (length(calls) >= 2L) {
    sink(stderr())
    on.exit(sink(NULL))
    cat("Backtrace:\n")
    calls <- rev(calls[-length(calls)])
    for (i in seq_along(calls)) {
      cat(i, ": ", deparse(calls[[i]], nlines = 1L), "\n", sep = "")
    }
  }
  if (!interactive()) {
    q(status = 1)
  }
})
