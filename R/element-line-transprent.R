#' Transparent Line Element for ggplot2
#'
#' A helper shortcut function that returns a \code{\link[ggplot2]{element_line}}
#' object with the color explicitly set to \code{"transparent"}. Intended for cleanly
#' removing tick marks without altering the spacing of axis text.
#'
#' @return An object of class \code{element_line} with \code{colour = "transparent"}.
#'
#' @export
element_line_transparent <- function() {
  ggplot2::element_line(colour = "transparent")
}
