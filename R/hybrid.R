#' Hybrid refine
#'
#' Behaves like [ggrefine::classic()] when both axes are continuous or binned —
#' leaving gridlines and axis elements untouched. When a discrete axis is
#' present, behaves like [ggrefine::modern()], removing gridlines and axis
#' line/tick elements from the non-focused dimension and stripping ticks from
#' the discrete axis.
#'
#' @inheritParams modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @inherit classic examples
#'
hybrid <- function(
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

  if (both_continuous) {
    return(ggplot2::theme())
  }

  modern(x_type = x_type, y_type = y_type, focus = focus)
}
