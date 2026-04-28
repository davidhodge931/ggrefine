#' No refine
#'
#' Leaves the theme unchanged.
#'
#' @inheritParams modern
#'
#' @return An empty ggplot2 theme object
#' @export
#'
#' @inherit classic examples
#'
none <- function(
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

  return(ggplot2::theme())
}
