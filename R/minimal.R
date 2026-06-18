#' Minimal refine
#'
#' Behaves like [ggrefine::fusion()] but additionally removes axis lines and
#' ticks from both axes. When both axes are continuous or binned, only axis
#' lines and ticks are removed, leaving gridlines untouched. When a discrete
#' axis is present, also removes gridlines and axis elements from the
#' non-focused dimension, as in [ggrefine::modern()].
#'
#' @inheritParams modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @inherit modern examples
#'
minimal <- function(
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

  # Strip axis lines and ticks from both axes unconditionally
  base <- ggplot2::theme(
    axis.line.x.bottom         = ggplot2::element_line(linetype = 0),
    axis.line.x.top            = ggplot2::element_line(linetype = 0),
    axis.line.y.left           = ggplot2::element_line(linetype = 0),
    axis.line.y.right          = ggplot2::element_line(linetype = 0),
    axis.ticks.x.bottom        = ggplot2::element_line(linetype = 0),
    axis.ticks.x.top           = ggplot2::element_line(linetype = 0),
    axis.ticks.y.left          = ggplot2::element_line(linetype = 0),
    axis.ticks.y.right         = ggplot2::element_line(linetype = 0),
    axis.minor.ticks.x.bottom  = ggplot2::element_line(linetype = 0),
    axis.minor.ticks.x.top     = ggplot2::element_line(linetype = 0),
    axis.minor.ticks.y.left    = ggplot2::element_line(linetype = 0),
    axis.minor.ticks.y.right   = ggplot2::element_line(linetype = 0),
  )

  both_continuous <- x_type %in% c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

  if (both_continuous) {
    return(base)
  }

  # Discrete axis present — add gridline removal on top
  base + modern(x_type = x_type, y_type = y_type, focus = focus)
}
