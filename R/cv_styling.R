#' Title
#'
#' @param topic `data.frame()` to be converted to `kableExtra::kable()` object.
#' @param align ALignement of text in cells.
#' @param font_size Font size.
#' @param bold Boolean whether first line of entry should be bold faced
#'  (defaults to `TRUE`).
#' @param width_key The width (as a character) of the key element of table
#'  (default to `"2.5cm"`).
#' @param width_body The width (as a character) of the body element of table
#'  (default to `"13cm"`).
#'
#' @return `kableExtra::kable()` object for inclusion in Rmarkdown.
#' @export
#'
#' @examples
#' reformat_cv_table(iris, "Sepal.Length", c("Sepal.Width", "Petal.Width")) |>
#'  add_cv_table()
add_cv_table <- function(topic, align = "l", font_size = NULL, bold = TRUE,
                         width_key = "2.5cm", width_body = "13cm") {

  # where is the header of each section
  header <- grepl(".", topic$key)

  # create spacing add set intervals
  vc <- character(length(header))
  vc[which(header) - 1] <- '\\addlinespace'

  tb <- kableExtra::kable(
    topic,
    "latex",
    booktabs = TRUE,
    col.names = NULL,
    align = align,
    linesep = vc,
    escape = FALSE
  ) |>
    kableExtra::kable_styling(
      full_width = FALSE,
      position = "left",
      font_size = font_size,
      latex_options = "hold_position"
    ) |>
    kableExtra::column_spec(column = 1, width = width_key) |>
    kableExtra::column_spec(column = 2, width = width_body)

  # bold first line
  if (isTRUE(bold)) {
    tb <- kableExtra::row_spec(
      tb,
      row = which(header),
      bold = TRUE
    )
  }

  # remove lines
  tb <- sub("\\\\toprule", "", tb)
  tb <- sub("\\\\bottomrule", "", tb)
  # remove strange `\vphantom{1}`
  sub("\\\\vphantom\\{1\\}", "", tb)
}

#' Convert datatables from database to long format.
#'
#' @param topic `data.frame()` to be converted to long format.
#' @param key Character string or vector of variables included in key. In case
#'  of multiple variables these are required to be of same type.
#' @param body Character string or vector of variables included in body of
#'  table. In case of multiple variables these are required to be of same type.
#' @param sep Separator in case of multiple variable used as key.
#'
#' @return `data.frame()` to be prepared for inclusion in the CV.
#' @export
#'
#' @examples
#' reformat_cv_table(iris, "Sepal.Length", c("Sepal.Width", "Petal.Width"))
reformat_cv_table <- function(topic, key, body, sep = "--") {

  # select information of interest
  tb <- dplyr::select(topic, key, body) |>
    tidyr::pivot_longer(!c(key), values_to = "body") |>
    # merge key names if exist
    tidyr::unite("key", !!!key, sep = sep)

  # remove duplicate keys
  tb[["key"]][duplicated(tb[["key"]])] <- ""
  tb

}
