options(scipen = 999) # do not print e-10 for small numbers
options(
  usethis.full_name = "Patrick Schratz",
  usethis.protocol  = "ssh",
  usethis.description = list(
    `Authors@R` = 'person("Patrick", "Schratz", email = "patrick.schratz@gmail.com", role = c("aut", "cre"),
    comment = c(ORCID = "0000-0003-0748-6624"))',
    Version = "0.0.0.9000"
  )
)
options(reprex.styler = TRUE) # use styler indention when doing a reprex

if (grepl("mlr", getwd()) || grepl("paradox", getwd())) {
  options(styler.addins_style_transformer = "mlr_style()")
}

# tibble > data.frame
if (interactive() && "tibble" %in% rownames(utils::installed.packages())) {
  print.data.frame = function(x, ...) {
    tibble:::print.tbl(tibble::as_tibble(x), ...)
  }
}

# suppress rmarkdown vignettes warnings
options(rmarkdown.html_vignette.check_title = FALSE)

options(
    Ncpus = 10,
    usethis.protocol = "ssh",
    install.packages.check.source = "no",
    pkgType = "source",
    precommit.executable = "/usr/local/bin/pre-commit",
    precommit.path_cp_config_from = "https://raw.githubusercontent.com/mlr-org/mlr/master/.pre-commit-config.yaml",
    startup.check.options.ignore = "stringsAsFactors"
)

if (as.numeric(version$major) >= 4) {
  options(stringsAsFactors = FALSE)
  Sys.setenv("R_DEV" = TRUE)
}

options(startup.check.options.ignore = "error")
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

