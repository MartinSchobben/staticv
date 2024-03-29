% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cv_styling.R
\name{add_cv_table}
\alias{add_cv_table}
\title{Title}
\usage{
add_cv_table(
  topic,
  align = "l",
  font_size = NULL,
  bold = TRUE,
  width_key = "3cm",
  width_body = "13cm"
)
}
\arguments{
\item{topic}{\code{data.frame()} to be converted to \code{kableExtra::kable()} object.}

\item{align}{ALignement of text in cells.}

\item{font_size}{Font size.}

\item{bold}{Boolean whether first line of entry should be bold faced
(defaults to \code{TRUE}).}

\item{width_key}{The width (as a character) of the key element of table
(default to \code{"2.5cm"}).}

\item{width_body}{The width (as a character) of the body element of table
(default to \code{"13cm"}).}
}
\value{
\code{kableExtra::kable()} object for inclusion in Rmarkdown.
}
\description{
Title
}
\examples{
reformat_cv_table(iris, "Sepal.Length", c("Sepal.Width", "Petal.Width")) |>
 add_cv_table()
}
