if (requireNamespace("startup", quietly = TRUE)) {
  startup::startup()
}

if (
  interactive() &&
  requireNamespace("rsthemes", quietly = TRUE) &&
  requireNamespace("later", quietly = TRUE)
) {
  # Use later to delay until RStudio is ready
  later::later(function() {
    rsthemes::set_theme_light("One Light {rsthemes}")  # light theme
    rsthemes::set_theme_dark("One Dark {rsthemes}")  # dark theme

    # To automatically choose theme based on time of day
    # rsthemes::use_theme_auto(dark_start = "17:00", dark_end = "7:00")

    auto_dark <- function(delay = 1) {
      cmd_is_dark <- "defaults read NSGlobalDomain AppleInterfaceStyle"
      macos_style <- suppressWarnings(
        system(cmd_is_dark, intern = TRUE, ignore.stderr = TRUE)
      )
      if (identical(tolower(macos_style), "dark")) {
        rsthemes::use_theme_dark()
      } else {
        rsthemes::use_theme_light()
      }

      later::later(auto_dark, delay)
    }

    auto_dark()

  }, delay = 1)
}
