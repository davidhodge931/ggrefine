#' Move and Format Legend Placement
#'
#' Adjusts the legend position, location, and margin padding for a given
#' \code{ggplot2} theme object.
#'
#' @param legend_place Character string specifying where to place the legend.
#'   Options are \code{"right"}, \code{"top"}, or \code{"bottom"}. Defaults to \code{"right"}.
#'
#' @return A modified \code{ggplot2} theme object with updated legend layout settings.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' base_theme <- theme_minimal()
#'
#' # Apply top legend layout to a plot
#' ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
#'   geom_point() +
#'   move_legend_place("top")
move_legend_place <- function(legend_place = "right") {

  if (legend_place == "right") {
    return(
      ggplot2::theme(
        legend.position = "right",
        legend.location = "panel",
        legend.margin   = ggplot2::margin(l = 5.5, b = 11)
      )
    )
  }

  if (legend_place == "top") {
    return(
      ggplot2::theme(
        legend.position = "top",
        legend.location = "plot",
        legend.margin   = ggplot2::margin(r = 5.5, b = 11)
      )
    )
  }

  if (legend_place == "bottom") {
    return(
      ggplot2::theme(
        legend.position = "bottom",
        legend.location = "plot",
        legend.margin   = ggplot2::margin(r = 5.5, b = 11)
      )
    )
  }
}
