if (
  interactive() &&
  requireNamespace("rsthemes", quietly = TRUE) &&
  requireNamespace("later", quietly = TRUE)
) {
  # Use later to delay until RStudio is ready
  later::later(function() {
    rsthemes::set_theme_light("One Light {rsthemes}")  # light theme
    rsthemes::set_theme_dark("Mojave Dark (Static)") # dark theme

    # To automatically choose theme based on time of day
    rsthemes::use_theme_auto(dark_start = "18:00", dark_end = "6:00")
  }, delay = 1)
}
