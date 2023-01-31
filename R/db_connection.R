init <- function() {
  system2(
    system.file(package = "staticv", "bash", "sqlite.sh"),
    stdout = FALSE,
    stderr = FALSE
  )
}

get_connection <- function() {
  DBI::dbConnect(RSQLite::SQLite(), "CV_db.sqlite")
}
