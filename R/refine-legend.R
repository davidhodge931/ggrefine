#' Move Legend
#'
#' Helper shortcut to set legend position, location, and margins.
#'
#' @param place Character. Where to place the legend ("right", "top", or "bottom").
#' @return A ggplot2 theme object.
#' @export
refine_legend <- function(place = "right") {

  if (place == "right") {
    return(
      ggplot2::theme(
        legend.position = "right",
        legend.location = "panel",
        legend.margin   = ggplot2::margin(l = 5.5, b = 11),
        legend.justification = "top",
        legend.title.position = "top"
      )
    )
  }

  if (place == "top") {
    return(
      ggplot2::theme(
        legend.position = "top",
        legend.location = "plot",
        legend.margin   = ggplot2::margin(r = 5.5, b = 11),
        legend.justification = "left",
        legend.title.position = "top"
      )
    )
  }

  if (place == "bottom") {
    return(
      ggplot2::theme(
        legend.position = "bottom",
        legend.location = "plot",
        legend.margin   = ggplot2::margin(r = 5.5, b = 11),
        legend.justification = "left",
        legend.title.position = "top"
      )
    )
  }
}
