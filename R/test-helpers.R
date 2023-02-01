local_create_project <- function(dir = tempdir(), env = parent.frame(), rstudio = TRUE) {

  old_project <- usethis::proj_get()

  # create new folder and project
  usethis::create_project(dir, rstudio = rstudio, open = rstudio)
  withr::defer(fs::dir_delete(dir), envir = env) # -A

  # change working directory
  setwd(dir) # B
  withr::defer(setwd(old_project), envir = env) # -B

  # switch to new usethis project
  usethis::proj_set(dir) # C
  withr::defer(usethis::proj_set(old_project, force = TRUE), envir = env) # -C

  dir
}

delete_db <- function() {
  unlink("CV_db.sqlite")
}
