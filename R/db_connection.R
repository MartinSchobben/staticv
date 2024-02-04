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

  name <- basename(getwd())
  if (file.exists(paste0(name, "_db.sqlite"))) {
    stop("Database already exists.", call. = FALSE)
  }

  system2(
    system.file(package = "staticv", "bash", "sqlite.sh"),
    name,
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
  DBI::dbConnect(RSQLite::SQLite(), paste0(basename(getwd()), "_db.sqlite"))
}
