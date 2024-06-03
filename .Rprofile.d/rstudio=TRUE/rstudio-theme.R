if (interactive() && requireNamespace("rsthemes", quietly = TRUE)) {
  # Set preferred themes if not handled elsewhere..
  #rsthemes::set_theme_light("One Light {rsthemes}")  # light theme
  #rsthemes::set_theme_light("Flat White {rsthemes}")  # light theme
  #rsthemes::set_theme_light("base16 Tomorrow {rsthemes}")  # light theme
  #rsthemes::set_theme_light("base16 Gruvbox light, hard {rsthemes}")  # light theme
  #rsthemes::set_theme_light("Flat White {rsthemes}")  # light theme
  rsthemes::set_theme_light("Textmate (default)")  # light theme
  #rsthemes::set_theme_light("Serendipity Light {rsthemes}") # dark theme


  #rsthemes::set_theme_dark("Mojave Dark") # dark theme
  #rsthemes::set_theme_dark("base16 Gruvbox dark, pale {rsthemes}") # dark theme
  #rsthemes::set_theme_dark("Horizon Dark {rsthemes}") # dark theme
  #rsthemes::set_theme_dark("Yule RStudio {rsthemes}") # dark theme
  rsthemes::set_theme_dark("Dracula") # dark theme
  #rsthemes::set_theme_dark("Serendipity Dark {rsthemes}") # dark theme

  # Whenever the R session restarts inside RStudio...
  setHook("rstudio.sessionInit", function(isNewSession) {
    rsthemes::use_theme_auto(lat = 47.37, lon = 8.54)
  }, action = "append")
}

