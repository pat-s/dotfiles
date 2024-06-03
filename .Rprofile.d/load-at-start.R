# only load on macOS, not on RStudio Server
if (interactive() && Sys.info()[["sysname"]] == "Darwin") {
  suppressMessages(require(usethis))
  suppressMessages(require(teamtools))
  suppressMessages(require(reprex))
  suppressMessages(require(fledge))
  suppressMessages(require(remotes))
  #suppressMessages(require(prettycode))
  suppressMessages(require(browse))
  suppressMessages(require(pak))
}
#if (requireNamespace("prompt", quietly = TRUE)) {
#  prompt::set_prompt(prompt::prompt_git)
#}

# remotes::install_github("cynkra/fledge")
# remotes::install_github("r-lib/prettycode")
# remotes::install_github("tmastny/browse")
# remotes::install_github("lorenzwalthert/teamtools")
# remotes::install_github("gadenbuie/rsthemes")
# remotes::install_github("mine-cetinkaya-rundel/addmins")
# install.packages(c("reprex", "remotes", "startup"))


