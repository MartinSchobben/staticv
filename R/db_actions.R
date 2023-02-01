#' Lower level functions to enter activities in database
#'
#' @param table Name of table.
#' @param key Name of the skill.
#' @param ... Items to be included.
#'
#' @return  Invisibly returns NULL.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  init()
#'  # create new table
#'  DBI::dbCreateTable(get_connection(), "hobbies", c(skill = "TEXT", item = "TEXT"))
#'  # add a list of activities
#'  add_CV_list("hobbies", key = NULL, sport, c("tennis", "rugby"))
#' }
add_CV_item <- function(table, key, ...) {

  # connection to db
  con <- get_connection()
  # get table from db in memory
  tb <- dplyr::tbl(con, table)

  # if a key is given then care is taken not the replace existing entries
  if (!is.null(key)) {
    dplyr::rows_insert(
      tb,
      tibble::tibble(..., lang = get_language()),
      by = key,
      copy = TRUE,
      conflict = "ignore",
      in_place = TRUE
    )
  } else {
    dplyr::rows_append(
      tb,
      tibble::tibble(..., lang = get_language()),
      copy = TRUE,
      in_place = TRUE
    )
  }
  invisible(NULL)
}
#' @rdname add_CV_item
#'
#' @export
add_CV_list <- function(table, key, ...) {

  con <- get_connection()
  tb <- dplyr::tbl(con, table)

  # this always appends, where the key is necessary to ensure not double entries
  dplyr::rows_insert(
    tb,
    tibble::tibble(skill = key, item = c(...), lang = get_language()),
    by = c("skill", "item"),
    copy = TRUE,
    conflict = "ignore",
    in_place = TRUE
  )
  invisible(NULL)
}

# get language from rstudio, locale, env variable
get_language <- function() {
  Sys.getenv("LANGUAGE")
}


