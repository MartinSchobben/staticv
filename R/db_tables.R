#' Retrieves/delete tables from database.
#'
#' @param table Name of table.
#' @param verbose Set to `FALSE` to make function silent.
#'
#' @return Invisibly returns NULL.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  init()
#'  get_CV_table("education")
#' }
get_CV_table <- function(table) {
  con <- get_connection()
  DBI::dbReadTable(con, table)
}
#' @rdname get_CV_table
#'
#' @export
delete_CV_table <- function(table, verbose = TRUE) {
  if (isTRUE(verbose)) {
    usethis::ui_yeah("Are you sure you want to delete this table?")
  }
  con <- get_connection()
  DBI::dbRemoveTable(con, table)
  invisible(NULL)
}
