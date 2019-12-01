options(scipen = 999) # do not print e-10 for small numbers

options(usethis.full_name = "Patrick Schratz")
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
    usethis.protocol = "ssh"
)
