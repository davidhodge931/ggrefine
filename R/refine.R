#' Modern refine
#'
#' Removes gridlines and axis line/tick elements from the non-focused dimension.
#' Also removes ticks on discrete axes.
#'
#' @param x_type Character. Type of x-axis: "continuous", "binned", or "discrete".
#' @param y_type Character. Type of y-axis: "continuous", "binned", or "discrete".
#' @param focus Character. The primary axis of interest: "x" or "y". Gridlines
#'   and axis elements are removed from the opposite axis. If `NULL` (default),
#'   focus is inferred from `x_type` and `y_type`: discrete x with continuous/binned
#'   y gives `"x"`, continuous/binned x with discrete y gives `"y"`, otherwise `"x"`.
#' @param ... Additional arguments (currently unused).
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @inherit classic examples
#'
modern <- function(
  x_type = "continuous",
  y_type = "continuous",
  focus = NULL,
  ...
) {
  rlang::arg_match(x_type, c("continuous", "binned", "discrete"))
  rlang::arg_match(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  rlang::arg_match(focus, c("x", "y"))

  theme <- ggplot2::theme()

  if (focus == "x") {
    theme <- theme +
      ggplot2::theme(
        axis.line.y.left = ggplot2::element_line(linetype = 0),
        axis.line.y.right = ggplot2::element_line(linetype = 0),
        axis.ticks.y.left = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.left = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.right = ggplot2::element_line(linetype = 0),
        panel.grid.major.x = ggplot2::element_line(linetype = 0),
        panel.grid.minor.x = ggplot2::element_line(linetype = 0)
      )
  }
  if (focus == "y") {
    theme <- theme +
      ggplot2::theme(
        axis.line.x.bottom = ggplot2::element_line(linetype = 0),
        axis.line.x.top = ggplot2::element_line(linetype = 0),
        axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.top = ggplot2::element_line(linetype = 0),
        panel.grid.major.y = ggplot2::element_line(linetype = 0),
        panel.grid.minor.y = ggplot2::element_line(linetype = 0)
      )
  }

  if (x_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top = ggplot2::element_line(linetype = 0),
      )
  }
  if (y_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.y.left = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
      )
  }

  return(theme)
}
