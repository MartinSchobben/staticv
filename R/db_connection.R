#' Initialize database.
#'
#' @return Invisibly returns NULL.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  init()
#' }
init <- function() {

  if (file.exists("CV_db.sqlite")) {
    stop("Database already exists.", call. = FALSE)
  }

  system2(
    system.file(package = "staticv", "bash", "sqlite.sh"),
    stdout = FALSE,
    stderr = FALSE
  )

  invisible(NULL)
}


#' Get database connection
#'
#' @return Returns database connection.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  get_connection()
#' }
get_connection <- function() {
  DBI::dbConnect(RSQLite::SQLite(), "CV_db.sqlite")
}
