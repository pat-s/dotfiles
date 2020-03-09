if (interactive() && requireNamespace("rsthemes", quietly = TRUE)) {
  # Set preferred themes if not handled elsewhere..
  #rsthemes::set_theme_light("One Light {rsthemes}")  # light theme
  #rsthemes::set_theme_light("Flat White {rsthemes}")  # light theme
  rsthemes::set_theme_light("base16 Tomorrow")  # light theme

  #rsthemes::set_theme_dark("Mojave Dark") # dark theme
  rsthemes::set_theme_dark("base16 Gruvbox dark, pale") # dark theme


  # Whenever the R session restarts inside RStudio...
  setHook("rstudio.sessionInit", function(isNewSession) {
    # Automatically choose the correct theme based on time of day
    rsthemes::use_theme_auto(dark_start = "18:00", dark_end = "8:00")
  }, action = "append")
}
