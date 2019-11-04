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
  library("usethis")
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
    install.packages.compile.from.source = "always",
    install.packages.check.source = "no",

    # styler
    # styler.addins.style = "mlr_style",

    # see https://help.farbox.com/pygments.html
    # for a list of supported color schemes, default scheme is "native"
    radian.color_scheme = "native",

    # either  `"emacs"` (default) or `"vi"`.
    radian.editing_mode = "vi",

    # indent continuation lines
    # turn this off if you want to copy code without the extra indentation;
    # but it leads to less elegent layout
    radian.indent_lines = TRUE,

    # auto match brackets and quotes
    radian.auto_match = TRUE,

    # auto indentation for new line and curly braces
    radian.auto_indentation = TRUE,
    radian.tab_size = 2,

    # pop up completion while typing
    radian.complete_while_typing = TRUE,
    # timeout in seconds to cancel completion if it takes too long
    # set it to 0 to disable it
    radian.completion_timeout = 0.05,

    # automatically adjust R buffer size based on terminal width
    radian.auto_width = TRUE,

    # insert new line between prompts
    radian.insert_new_line = TRUE,

    # when using history search (ctrl-r/ctrl-s in emacs mode), do not show duplicate results
    radian.history_search_no_duplicates = FALSE,

    # custom prompt for different modes
    radian.prompt = "\033[0;34mr$>\033[0m ",
    radian.shell_prompt = "\033[0;31m#!>\033[0m ",
    radian.browse_prompt = "\033[0;33mBrowse[{}]>\033[0m ",

    # supress the loading message for reticulate
    radian.suppress_reticulate_message = FALSE,
    # enable reticulate prompt and trigger `~`
    radian.enable_reticulate_prompt = TRUE
)
