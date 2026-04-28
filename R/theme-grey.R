#' Grey theme
#'
#' @description A complete theme for a grey panel background on a white plot
#'   background. The panel background fill defaults so 'grey92'. The panel grid
#'   colour is derived automatically by blending the
#'   `panel_background_fill` with itself using `blends::multiply()` to
#'   produce a darker tone that stays harmonious with the panel background.
#'
#' @inheritParams theme_light
#'
#' @return A ggplot theme.
#' @export
#' @inherit theme_light examples
#'
theme_grey <- function(
    ...,
    text_size = 10,
    text_family = "",
    text_colour = flexoki::flexoki$base["black"],
    legend_place = "right",
    legend_axis_line_colour = plot_background_fill,
    legend_axis_line_linewidth = axis_line_linewidth,
    legend_background_fill = plot_background_fill,
    legend_key_fill = plot_background_fill,
    legend_ticks_colour = legend_axis_line_colour,
    legend_ticks_linewidth = legend_axis_line_linewidth,
    legend_ticks_length = grid::unit(c(2.75, 0), "pt"),
    axis_line_colour = flexoki::flexoki$base["base600"],
    axis_line_linewidth = 0.25,
    axis_ticks_colour = axis_line_colour,
    axis_ticks_linewidth = axis_line_linewidth,
    axis_ticks_length = grid::unit(3.66, "pt"),
    panel_background_fill = "grey92",
    panel_grid_colour = blends::multiply(panel_background_fill),
    panel_grid_linetype = 1,
    panel_grid_linewidth = 1,
    panel_grid_minor_linetype = 1,
    panel_grid_minor_linewidth = 0.5,
    plot_background_fill = "white",
    geom_fill = "#357BA2FF",
    geom_colour = geom_fill,
    palette_fill_discrete = jumble::jumble,
    palette_colour_discrete = palette_fill_discrete,
    palette_fill_continuous = viridis::turbo(n = 256),
    palette_colour_continuous = palette_fill_continuous,
    panel_widths = NULL,
    panel_heights = NULL
) {
  theme_light(
    ...,
    text_size = text_size,
    text_family = text_family,
    text_colour = as.character(text_colour),
    legend_place = legend_place,
    legend_axis_line_colour = as.character(legend_axis_line_colour),
    legend_axis_line_linewidth = legend_axis_line_linewidth,
    legend_background_fill = as.character(legend_background_fill),
    legend_key_fill = as.character(legend_key_fill),
    legend_ticks_colour = as.character(legend_ticks_colour),
    legend_ticks_linewidth = legend_ticks_linewidth,
    legend_ticks_length = legend_ticks_length,
    axis_line_colour = as.character(axis_line_colour),
    axis_line_linewidth = axis_line_linewidth,
    axis_ticks_colour = as.character(axis_ticks_colour),
    axis_ticks_linewidth = axis_ticks_linewidth,
    axis_ticks_length = axis_ticks_length,
    plot_background_fill = as.character(plot_background_fill),
    panel_background_fill = as.character(panel_background_fill),
    panel_grid_colour = as.character(panel_grid_colour),
    panel_grid_linetype = panel_grid_linetype,
    panel_grid_linewidth = panel_grid_linewidth,
    panel_grid_minor_linetype = panel_grid_minor_linetype,
    panel_grid_minor_linewidth = panel_grid_minor_linewidth,
    geom_fill = as.character(geom_fill),
    geom_colour = as.character(geom_colour),
    palette_fill_discrete = palette_fill_discrete,
    palette_colour_discrete = palette_colour_discrete,
    palette_fill_continuous = palette_fill_continuous,
    palette_colour_continuous = palette_colour_continuous,
    panel_widths = panel_widths,
    panel_heights = panel_heights
  )
}
