#' #' Move the legend place
#' #'
#' #' @description Move the legend position set in the theme to somewhere else.
#' #'
#' #' @param legend_place The position of the legend. Either "right", "top" or "bottom".
#' #' @param ... Require named arguments (and support trailing commas).
#' #' @param legend_key_fill The fill (and colour) of the legend.key theme element.
#' #' @param legend_background_fill The fill (and colour) of the legend.background theme element.
#' #' @param legend_axis_line_colour The colour of the legend.axis.line theme element.
#' #' @param legend_axis_line_linewidth The linewidth of the legend.axis.line theme element.
#' #' @param legend_ticks_colour The colour of the legend.ticks theme element.
#' #' @param legend_ticks_linewidth The linewidth of the legend.ticks theme element.
#' #' @param legend_ticks_length The legend.ticks.length theme element.
#' #'
#' #' @return A ggplot theme object with legend position settings.
#' #' @noRd
#' #'
#' legend_place <- function(
#'   legend_place = "right",
#'   ...,
#'   legend_key_fill = NULL,
#'   legend_background_fill = NULL,
#'   legend_axis_line_colour = NULL,
#'   legend_axis_line_linewidth = NULL,
#'   legend_ticks_colour = NULL,
#'   legend_ticks_linewidth = NULL,
#'   legend_ticks_length = NULL
#' ) {
#'   if (!legend_place %in% c("right", "top", "bottom")) {
#'     rlang::abort("legend_place must be 'right', 'top', or 'bottom'")
#'   }
#'
#'   current_theme <- ggplot2::get_theme()
#'
#'   if (is.null(legend_key_fill)) {
#'     legend_key_fill <- ggplot2::calc_element("legend.key", current_theme)@fill
#'   }
#'   if (is.null(legend_background_fill)) {
#'     legend_background_fill <- ggplot2::calc_element(
#'       "legend.background",
#'       current_theme
#'     )@fill
#'   }
#'   if (is.null(legend_axis_line_colour)) {
#'     legend_axis_line_colour <- ggplot2::calc_element(
#'       "legend.axis.line",
#'       current_theme
#'     )@colour
#'   }
#'   if (is.null(legend_axis_line_linewidth)) {
#'     legend_axis_line_linewidth <- ggplot2::calc_element(
#'       "legend.axis.line",
#'       current_theme
#'     )@linewidth
#'   }
#'   if (is.null(legend_ticks_colour)) {
#'     legend_ticks_colour <- ggplot2::calc_element(
#'       "legend.ticks",
#'       current_theme
#'     )@colour
#'   }
#'   if (is.null(legend_ticks_linewidth)) {
#'     legend_ticks_linewidth <- ggplot2::calc_element(
#'       "legend.ticks",
#'       current_theme
#'     )@linewidth
#'   }
#'   if (is.null(legend_ticks_length)) {
#'     legend_ticks_length <- ggplot2::calc_element(
#'       "legend.ticks.length",
#'       current_theme
#'     )
#'   }
#'
#'   if (legend_place == "right") {
#'     ggplot2::theme(
#'       # All legend elements for right position
#'       legend.position = "right",
#'       legend.justification = c(0, 1),
#'       legend.location = "panel",
#'       legend.title.position = "top",
#'       legend.margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 2.75),
#'       legend.box = "horizontal",
#'       legend.box.just = "top",
#'       legend.box.margin = ggplot2::margin(t = 0, r = -5, b = 0, l = 5),
#'       legend.title = ggplot2::element_text(
#'         margin = ggplot2::margin(t = 0, r = 0, b = 5.5, l = 0)
#'       ),
#'       legend.byrow = FALSE,
#'       legend.direction = "vertical",
#'       legend.spacing = grid::unit(11, "pt"),
#'       legend.spacing.y = grid::unit(16.50, "pt"),
#'       legend.spacing.x = NULL,
#'       legend.key = ggplot2::element_rect(
#'         colour = legend_key_fill,
#'         fill = legend_key_fill
#'       ),
#'       legend.key.height = ggplot2::rel(1),
#'       legend.key.width = ggplot2::rel(0.6),
#'       legend.key.spacing = NULL,
#'       legend.key.spacing.x = grid::unit(11, "pt"),
#'       legend.key.spacing.y = grid::unit(3.63, "pt"),
#'       legend.frame = NULL,
#'       legend.text = ggplot2::element_text(
#'         margin = ggplot2::margin(5.5, 0, 5.5, 5.5)
#'       ),
#'       legend.axis.line = ggplot2::element_line(
#'         colour = legend_axis_line_colour,
#'         linewidth = legend_axis_line_linewidth
#'       ),
#'       legend.ticks = ggplot2::element_line(
#'         colour = legend_ticks_colour,
#'         linewidth = legend_ticks_linewidth
#'       ),
#'       legend.ticks.length = legend_ticks_length,
#'       legend.box.background = NULL,
#'       legend.box.spacing = NULL,
#'       legend.background = ggplot2::element_rect(
#'         colour = legend_background_fill,
#'         fill = legend_background_fill
#'       )
#'     )
#'   } else if (legend_place == "top") {
#'     ggplot2::theme(
#'       # All legend elements for top position
#'       legend.position = "top",
#'       legend.justification = c(0, 0.5),
#'       legend.location = "plot",
#'       legend.title.position = "top",
#'       legend.margin = ggplot2::margin(t = 0, r = 22, b = 0, l = 0),
#'       legend.box = "vertical",
#'       legend.box.just = "left",
#'       legend.box.margin = ggplot2::margin(t = 0, r = 0, b = 5, l = 0),
#'       legend.title = ggplot2::element_text(
#'         margin = ggplot2::margin(t = 0, r = 0, b = 5.5, l = 0)
#'       ),
#'       legend.byrow = TRUE,
#'       legend.direction = "horizontal",
#'       legend.spacing = grid::unit(11, "pt"),
#'       legend.spacing.y = grid::unit(16.50, "pt"),
#'       legend.spacing.x = NULL,
#'       legend.key = ggplot2::element_rect(
#'         colour = legend_key_fill,
#'         fill = legend_key_fill
#'       ),
#'       legend.key.height = ggplot2::rel(1),
#'       legend.key.width = ggplot2::rel(0.6),
#'
#'       legend.key.spacing = NULL,
#'       legend.key.spacing.x = grid::unit(11, "pt"),
#'       legend.key.spacing.y = grid::unit(3.63, "pt"),
#'       legend.frame = NULL,
#'       legend.text = ggplot2::element_text(
#'         margin = ggplot2::margin(5.5, 5.5, 5.5, 5.5)
#'       ),
#'       legend.axis.line = ggplot2::element_line(
#'         colour = legend_axis_line_colour,
#'         linewidth = legend_axis_line_linewidth
#'       ),
#'       legend.ticks = ggplot2::element_line(
#'         colour = legend_ticks_colour,
#'         linewidth = legend_ticks_linewidth
#'       ),
#'       legend.ticks.length = legend_ticks_length,
#'       legend.box.background = NULL,
#'       legend.box.spacing = NULL,
#'       legend.background = ggplot2::element_rect(
#'         colour = legend_background_fill,
#'         fill = legend_background_fill
#'       )
#'     )
#'   } else if (legend_place == "bottom") {
#'     ggplot2::theme(
#'       # All legend elements for bottom position
#'       legend.position = "bottom",
#'       legend.justification = c(0, 0.5),
#'       legend.location = "plot",
#'       legend.title.position = "top",
#'       legend.margin = ggplot2::margin(t = 0, r = 22, b = 0, l = 0),
#'       legend.box = "vertical",
#'       legend.box.just = "left",
#'       legend.box.margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 0),
#'       legend.title = ggplot2::element_text(
#'         margin = ggplot2::margin(t = 2.75, r = 0, b = 5.5, l = 0)
#'       ),
#'       legend.byrow = TRUE,
#'       legend.direction = "horizontal",
#'       legend.spacing = grid::unit(11, "pt"),
#'       legend.spacing.y = grid::unit(16.50, "pt"),
#'       legend.spacing.x = NULL,
#'       legend.key = ggplot2::element_rect(
#'         colour = legend_key_fill,
#'         fill = legend_key_fill
#'       ),
#'       legend.key.height = ggplot2::rel(1),
#'       legend.key.width = ggplot2::rel(0.6),
#'
#'       legend.key.spacing = NULL,
#'       legend.key.spacing.x = grid::unit(11, "pt"),
#'       legend.key.spacing.y = grid::unit(3.63, "pt"),
#'       legend.frame = NULL,
#'       legend.text = ggplot2::element_text(
#'         margin = ggplot2::margin(5.5, 5.5, 5.5, 5.5)
#'       ),
#'       legend.axis.line = ggplot2::element_line(
#'         colour = legend_axis_line_colour,
#'         linewidth = legend_axis_line_linewidth
#'       ),
#'       legend.ticks = ggplot2::element_line(
#'         colour = legend_ticks_colour,
#'         linewidth = legend_ticks_linewidth
#'       ),
#'       legend.ticks.length = legend_ticks_length,
#'       legend.box.background = NULL,
#'       legend.box.spacing = NULL,
#'       legend.background = ggplot2::element_rect(
#'         colour = legend_background_fill,
#'         fill = legend_background_fill
#'       )
#'     )
#'   }
#' }
