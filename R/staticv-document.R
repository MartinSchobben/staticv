#' Staticv document
#'
#' @param ... Other parameters to generate PDF document with rmarkdown render.
#' @param keep_tex Keep text file.
#'
#' @export
staticv <- function(..., keep_tex = TRUE){

  template <- system.file('rmarkdown', 'templates', 'staticv', 'resources', 'staticv-template.tex', package = 'staticv')

  # no automatic hyperlink generation
  base <- inherit_pdf_document(..., template = template, keep_tex = keep_tex, number_sections = FALSE, md_extensions = "-autolink_bare_uris")

  base$knitr$opts_chunk$prompt    <- FALSE
  base$knitr$opts_chunk$comment   <- '# '
  base$knitr$opts_chunk$highlight <- TRUE

  base
}

# Call rmarkdown::pdf_document and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...){
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"

  fmt
}
