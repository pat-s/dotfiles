# An 'improved' library() function that, if necessary, first installs a
# package before trying to load it. It can also take multiple package names
# at once (and requires no quotes), that is, your code could start with:
#
# library(pkg1, pkg2, pkg3).
#
# and all packages will be installed (if necessary) and then loaded.
#
# If you put this into your .Rprofile file, library(pkg) will call this
# function instead of base::library(pkg). You can still use base::library(pkg)
# if you want to make use of the 'base' package library() function.
#
# Note that if you share code with others that makes use of this function,
# you should stick to:
#
# library(pkg1)
# library(pkg2)
# library(pkg3)
# ...
#
# at the beginning of your code so it remains runnable for those who do not
# have this function (of course, they would have to manually install the
# packages first if they are not already installed).
#
# The following line creates an environment into which we will store the
# library() function. By prefixing the environment with a dot, it is not
# directly visible with ls() and hence running rm(list=ls()) to clear your
# workspace will not delete this environment (and hence not the function).

.rstuff <- new.env()

.rstuff$library <- function(...) {
   pkgs <- as.character(substitute(list(...)))[-1L] # -1L to remove 'list'
   apkgs <- .packages() # get attached packages
   message("")
   for (i in seq_along(pkgs)) {
      message("******************** ", pkgs[i], " ********************")
      if (pkgs[i] %in% apkgs) {
         message("** Package is already loaded.")
      } else {
         message("** Trying to load package ...")
         if (!suppressWarnings(require(pkgs[i], quietly=TRUE, character.only=TRUE))) {
            message("** Package not installed.")
            message("** Trying to install it ...")
            inst <- tryCatch(install.packages(pkgs[i]), warning = function(w) return(w), error = function(e) return(e))
            if (!inherits(inst, c("error", "warning"))) {
               message("** Package successfully installed.")
               message("** Now trying again to load package ...")
               if (suppressWarnings(require(pkgs[i], quietly=TRUE, character.only=TRUE))) {
                  message("** Package successfully loaded.")
               } else {
                  warning("Loading package '", pkgs[i], "' not successful.", call.=FALSE, immediate.=TRUE)
               }
            } else {
               warning("Could not install package '", pkgs[i], "'.", call.=FALSE, immediate.=TRUE)
            }
         } else {
            message("** Package successfully loaded.")
         }
      }
      message("")
   }
}

# Now we attach the .rstuff environment so that calling library() will call
# the function above and not base::library(). With 'warn.conflicts=FALSE', we
# avoid the note that the base package library() function has been masked.

attach(.rstuff, warn.conflicts=FALSE)
