if (requireNamespace("startup", quietly = TRUE)) {
  startup::startup(check = FALSE)
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


# if (Sys.getenv("IS_KUBERNETES") == "1" && Sys.getenv("IS_WORKBENCH") == "1") {
#   cores_avail = round(as.numeric(system("cat /sys/fs/cgroup/cpu/cpu.cfs_quota_us", intern = TRUE)) / 100000)
#   options(Ncpus = cores_avail)
#   print("foo")
# } else {
#   cores_avail = as.numeric(system("cat /proc/cpuinfo | grep processor | wc -l", intern = TRUE))
#   # cap at four cores to avoid parallelization overhead issues on machines with many cores
#   if (cores_avail > 4) {
#     cores_avail = 4
#   }
#   options(Ncpus = cores_avail)
# }
# 
# 
# 
# cynkra_blue <- cli::make_ansi_style('#184fa9')
# # cli::cli_text('Welcome to {.emph Posit Workbench} {cynkra_blue(cli::style_italic(as.character(rstudioapi::getVersion())))}!')
# cli::cli_h1('Session Resource Limits')
# if (Sys.getenv('IS_KUBERNETES') == '1') {
#   cli::cli_li('Cores: {.val {as.numeric(system("cat /sys/fs/cgroup/cpu/cpu.cfs_quota_us", intern = TRUE)) / 100000}}')
#   cli::cli_li('Memory: {.val {(unix::rlimit_as()$cur + 1000000) / 1000000}} MB')
#   cli::cli_text('If you need more resources, set higher session values in the session launcher menu.\f')
#   cli::cli_text('Option {.val Ncpus} has automatically been set to {.num {cores_avail}} to allow for implicit parallelization during package installation. You can override this setting via {.code options(Ncpus = <value>)} in your personal {.file ~/.Rprofile}.')
# } else {
#   cli::cli_li('Cores: unlimited (max available: {.val {as.numeric(system("cat /proc/cpuinfo | grep processor | wc -l", intern = TRUE))}})')
#   if (unix::rlimit_as()$cur == 'Inf') {
#     cli::cli_li('Memory: unlimited (up to {.val {round(as.numeric(system("vmstat -s | grep -i \'total memory\' | sed \'s/ *//\' | sed \'s/ .*//\'", intern = TRUE)) / 1000000, 2)}} GB)')
#   } else {
#     cli::cli_li('Memory: {.val {(unix::rlimit_as()$cur) / 1000000}} MB')
#   }
#   cli::cli_text('Resources are set on the admin level. Please contact {.strong cynkra} if resources should be adjusted.')
# }
# cli::cli_h1('Support & Product Manual')
# cli::cli_div()
# cli::cli_end()
# cli::cli_text('The product manual by {.strong cynkra} including a changelog can be found at {.url https://server-manual.cynkra.com}.')
# cli::cli_text('If you encounter issues, you can contact us via {.email posit@cynkra.com}.')
# rm(cores_avail, envir = globalenv())
# 
# options(renv.config.pak.enabled = TRUE)
