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

options(
    Ncpus = 10,
    usethis.protocol = "ssh",
    install.packages.check.source = "no",
    pkgType = "source",
    precommit.executable = "/usr/local/bin/pre-commit",
    startup.check.options.ignore = "stringsAsFactors"
)

if (as.numeric(version$major) >= 4) {
  options(stringsAsFactors = FALSE)
  Sys.setenv("R_DEV" = TRUE)
}
