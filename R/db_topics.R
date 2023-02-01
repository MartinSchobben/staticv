#' Predefined functions for database entry
#'
#' These functions are meant to exemplify the functionality of `staticv`. More
#' flexibility can be gained by using the lower level functions `add_CV_item()`
#' for ordered (possibly chronological) itemized entries and `add_CV_list()` for
#' un-ordered lists of information.
#'
#' @param begin Begin date of entry.
#' @param end End date of entry.
#' @param place Place of activity.
#' @param title Title of activity.
#' @param type Type of activity.
#' @param degree Degree in case of education.
#' @param position Title of the position.
#' @param description Description of the position.
#' @param skill Name of the skill.
#' @param ... In case of `add_skills()` takes a list of skills.
#' @param key The key can be used to prevent double entries and takes a string
#'  or a vector of strings that represent the variable to be used as unique
#'  identifier.
#'
#' @return Invisibly returns NULL.
#' @export
#'
#' @examples
#' if (interactive()) {
#' init()
#' add_education(2010, 2014, "University of Musterhaussen", "Study of Information Technology", "degree", "Master of Science", key = c("begin", "end"))
#' add_education(2006, 2010, "University of Musterhaussen", "Study of Social Sciences", "degree", "Bachelor of Science", key = c("begin", "end"))
#' add_education(2000, 2006, "Musterstadt Public Schhool", "Gymnasium", "degree", "Diploma", key = c("begin", "end"))
#' }
#'
add_education <- function(begin, end, place, title, type, degree, key = NULL) {
  begin <- as.character(begin)
  end <- as.character(end)
  add_CV_item("education", begin, end, place, title, type, degree, key = key)
  invisible(NULL)
}
#' @rdname add_education
#'
#' @export
add_experience <- function(begin, end, position, place, description, key = NULL) {
  begin <- as.character(begin)
  end <- as.character(end)
  add_CV_item("experience", begin, end, position, place, description, key = key)
  invisible(NULL)
}
#' @rdname add_education
#'
#' @export
add_skills <- function(skill, ...) {
  add_CV_list("skills", skill, ...)
  invisible(NULL)
}
