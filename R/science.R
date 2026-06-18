#' science refine
#'
#' Similar to [ggrefine::modern()].
#'
#' @inheritParams modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @inherit modern examples
#'
science <- function(
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

  both_continuous <- x_type %in% c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

  theme <- ggplot2::theme()

  if (focus == "x") {
    theme <- theme +
      ggplot2::theme(
        axis.line.y.left             = ggplot2::element_line(linetype = 0),
        axis.line.y.right            = ggplot2::element_line(linetype = 0),
        axis.ticks.y.left            = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right           = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.left      = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.right     = ggplot2::element_line(linetype = 0),
      )
    if (!both_continuous) {
      theme <- theme +
        ggplot2::theme(
          panel.grid.major.x = ggplot2::element_line(linetype = 0),
          panel.grid.minor.x = ggplot2::element_line(linetype = 0)
        )
    }
  }

  if (focus == "y") {
    theme <- theme +
      ggplot2::theme(
        axis.line.x.bottom           = ggplot2::element_line(linetype = 0),
        axis.line.x.top              = ggplot2::element_line(linetype = 0),
        axis.ticks.x.bottom          = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top             = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.bottom    = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.top       = ggplot2::element_line(linetype = 0),
      )
    if (!both_continuous) {
      theme <- theme +
        ggplot2::theme(
          panel.grid.major.y = ggplot2::element_line(linetype = 0),
          panel.grid.minor.y = ggplot2::element_line(linetype = 0)
        )
    }
  }

  if (x_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top    = ggplot2::element_line(linetype = 0),
      )
  }
  if (y_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.y.left  = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
      )
  }

  return(theme)
}
