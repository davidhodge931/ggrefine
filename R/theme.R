#' Lighter theme
#'
#' @description A complete theme for a white panel background.
#'
#' @param ... Require named arguments (and support trailing commas).
#' @param text_size The base size of the text theme element. Defaults to 10.
#' @param text_family The base family of the text theme element. Defaults to "".
#' @param text_colour The base colour of the text theme element.
#' @param legend_place The place of the legend. Either "right", "top" or "bottom".
#' @param legend_axis_line_colour The colour of the legend.axis.line theme element.
#' @param legend_axis_line_linewidth The linewidth of the legend.axis.line theme element.
#' @param legend_background_fill The fill (and colour) of the legend.background theme element.
#' @param legend_key_fill The fill (and colour) of the legend.key theme element.
#' @param legend_ticks_colour The colour of the legend.ticks theme element.
#' @param legend_ticks_linewidth The linewidth of the legend.ticks theme element.
#' @param legend_ticks_length The legend.ticks.length theme element.
#' @param axis_line_colour The colour of the axis.line theme element.
#' @param axis_line_linewidth The linewidth of the axis.line theme element.
#' @param axis_ticks_colour The colour of the axis.ticks theme element.
#' @param axis_ticks_linewidth The linewidth of the axis.ticks theme element.
#' @param axis_ticks_length The length of the axis.ticks.length theme element.
#' @param panel_background_fill The fill (and colour) of the panel.background theme element.
#' @param panel_grid_colour The colour of the panel.grid theme element.
#' @param panel_grid_linetype The linetype of the panel.grid.major theme element.
#' @param panel_grid_linewidth The linewidth of the panel.grid.major theme element.
#' @param panel_grid_minor_linetype The linetype of the panel.grid.minor theme element.
#' @param panel_grid_minor_linewidth The linewidth of the panel.grid.minor theme element.
#' @param plot_background_fill The fill (and colour) of the plot.background theme element.
#' @param geom_fill The default fill colour of geom elements.
#' @param geom_colour The default border colour of geom elements. Defaults to `geom_fill`.
#' @param palette_fill_discrete The default discrete fill palette. A function or vector of colours.
#' @param palette_colour_discrete The default discrete colour palette. Defaults to `palette_fill_discrete`.
#' @param palette_fill_continuous The default continuous fill palette. A vector of colours.
#' @param palette_colour_continuous The default continuous colour palette. Defaults to `palette_fill_continuous`.
#' @param panel_widths The panel.widths theme element. A `unit` or unit vector setting the width of
#'   individual panels, or a single unit for the total panel area width. Overrides aspect ratio set
#'   by the theme, coord, or facets. Defaults to `NULL`.
#' @param panel_heights The panel.heights theme element. A `unit` or unit vector setting the height of
#'   individual panels, or a single unit for the total panel area height. Overrides aspect ratio set
#'   by the theme, coord, or facets. Defaults to `NULL`.
#'
#' @return A ggplot theme.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' p_base_light <- mpg |>
#'   ggplot(aes(x = hwy)) +
#'   geom_histogram(
#'     stat = "bin", shape = 21,
#'     colour = blends::multiply("#357BA2FF")
#'   ) +
#'   scale_y_continuous(expand = expansion(mult = c(0, 0.05)))
#'
#' p_base_dark <- mpg |>
#'   ggplot(aes(x = hwy)) +
#'   geom_histogram(
#'     stat = "bin", shape = 21,
#'     colour = blends::screen("#357BA2FF")
#'   ) +
#'   scale_y_continuous(expand = expansion(mult = c(0, 0.05)))
#'
#' p_light  <- p_base_light + ggrefine::theme_light() + labs(title = "ggrefine::theme_light")
#' p_dark  <- p_base_dark  + ggrefine::theme_dark() + labs(title = "ggrefine::theme_dark")
#' p_grey <- p_base_light + ggrefine::theme_grey() + labs(title = "ggrefine::theme_grey")
#'
#' patchwork::wrap_plots(
#'   p_light,
#'   p_dark,
#'   p_grey
#' )
#'
theme_light <- function(
  ...,
  text_size = 10,
  text_family = "",
  text_colour = flexoki::flexoki$base["black"],
  legend_place = "right",
  legend_axis_line_colour = NULL,
  legend_axis_line_linewidth = NULL,
  legend_background_fill = NULL,
  legend_key_fill = NULL,
  legend_ticks_colour = NULL,
  legend_ticks_linewidth = NULL,
  legend_ticks_length = grid::unit(c(2.75, 0), "pt"),
  axis_line_colour = flexoki::flexoki$base["base600"],
  axis_line_linewidth = 0.25,
  axis_ticks_colour = NULL,
  axis_ticks_linewidth = NULL,
  axis_ticks_length = grid::unit(3.66, "pt"),
  panel_background_fill = "white",
  panel_grid_colour = flexoki::flexoki$base["base50"],
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
  # Convert all colour arguments to plain character strings
  text_colour <- as.character(text_colour)
  axis_line_colour <- as.character(axis_line_colour)
  panel_background_fill <- as.character(panel_background_fill)
  panel_grid_colour <- as.character(panel_grid_colour)
  plot_background_fill <- as.character(plot_background_fill)
  geom_fill <- as.character(geom_fill)
  geom_colour <- as.character(geom_colour)

  # Set defaults for dependent parameters
  if (is.null(axis_ticks_colour)) {
    axis_ticks_colour <- axis_line_colour
  }
  if (is.null(axis_ticks_linewidth)) {
    axis_ticks_linewidth <- axis_line_linewidth
  }
  if (is.null(legend_axis_line_colour)) {
    legend_axis_line_colour <- plot_background_fill
  }
  if (is.null(legend_axis_line_linewidth)) {
    legend_axis_line_linewidth <- axis_line_linewidth
  }
  if (is.null(legend_background_fill)) {
    legend_background_fill <- plot_background_fill
  }
  if (is.null(legend_key_fill)) {
    legend_key_fill <- plot_background_fill
  }
  if (is.null(legend_ticks_colour)) {
    legend_ticks_colour <- legend_axis_line_colour
  }
  if (is.null(legend_ticks_linewidth)) {
    legend_ticks_linewidth <- legend_axis_line_linewidth
  }

  # Convert dependent colour arguments to plain character strings
  axis_ticks_colour <- as.character(axis_ticks_colour)
  legend_axis_line_colour <- as.character(legend_axis_line_colour)
  legend_background_fill <- as.character(legend_background_fill)
  legend_key_fill <- as.character(legend_key_fill)
  legend_ticks_colour <- as.character(legend_ticks_colour)

  title_size <- text_size
  title_family <- text_family
  title_colour <- text_colour
  subtitle_size <- text_size
  subtitle_family <- text_family
  subtitle_colour <- text_colour
  caption_size <- ggplot2::rel(0.9)
  caption_family <- text_family
  caption_colour <- text_colour
  caption_hjust <- 0

  # Base theme (same for all legend positions)
  theme <-
    ggplot2::theme(
      text = ggplot2::element_text(
        size = text_size,
        family = text_family,
        colour = text_colour,
        lineheight = 0.9,
        hjust = 0.5,
        vjust = 0.5,
        angle = 0,
        margin = ggplot2::margin(),
      ),
      axis.line = ggplot2::element_line(
        colour = axis_line_colour,
        linewidth = axis_line_linewidth,
        lineend = "square"
      ),
      axis.line.x = NULL,
      axis.line.x.bottom = NULL,
      axis.line.x.top = NULL,
      axis.line.y = NULL,
      axis.line.y.left = NULL,
      axis.line.y.right = NULL,
      axis.ticks = ggplot2::element_line(
        colour = axis_ticks_colour,
        linewidth = axis_ticks_linewidth
      ),
      axis.minor.ticks.x.bottom = ggplot2::element_line(
        colour = axis_ticks_colour
      ),
      axis.minor.ticks.x.top = ggplot2::element_line(
        colour = axis_ticks_colour
      ),
      axis.minor.ticks.y.left = ggplot2::element_line(
        colour = axis_ticks_colour
      ),
      axis.minor.ticks.y.right = ggplot2::element_line(
        colour = axis_ticks_colour
      ),
      axis.ticks.x = NULL,
      axis.ticks.x.top = NULL,
      axis.ticks.x.bottom = NULL,
      axis.ticks.y = NULL,
      axis.ticks.y.left = NULL,
      axis.ticks.y.right = NULL,
      axis.ticks.length = axis_ticks_length,
      axis.ticks.length.x = NULL,
      axis.ticks.length.x.top = NULL,
      axis.ticks.length.x.bottom = NULL,
      axis.ticks.length.y = NULL,
      axis.ticks.length.y.left = NULL,
      axis.ticks.length.y.right = NULL,
      axis.minor.ticks.length = ggplot2::rel(0.66),
      axis.title = ggplot2::element_text(),
      axis.text = ggplot2::element_text(),
      axis.text.y = ggplot2::element_text(
        margin = ggplot2::margin(r = 2.75),
        hjust = 1
      ),
      axis.text.y.right = ggplot2::element_text(
        margin = ggplot2::margin(l = 2.75),
        hjust = 0
      ),
      panel.background = ggplot2::element_rect(
        colour = panel_background_fill,
        fill = panel_background_fill
      ),
      panel.border = ggplot2::element_blank(),
      panel.grid = ggplot2::element_line(
        colour = panel_grid_colour,
      ),
      panel.grid.major = ggplot2::element_line(
        linewidth = panel_grid_linewidth,
        linetype = panel_grid_linetype
      ),
      panel.grid.major.x = NULL,
      panel.grid.major.y = NULL,
      panel.grid.minor = ggplot2::element_line(
        linetype = panel_grid_minor_linetype,
        linewidth = panel_grid_minor_linewidth
      ),
      panel.grid.minor.x = NULL,
      panel.grid.minor.y = NULL,
      panel.spacing = grid::unit(20, "pt"),
      panel.spacing.x = NULL,
      panel.spacing.y = NULL,
      panel.ontop = FALSE,
      panel.widths = panel_widths,
      panel.heights = panel_heights,
      spacing = grid::unit(5.5, "pt"),
      strip.background = ggplot2::element_rect(fill = NA, colour = NA),
      strip.clip = "off",
      strip.text = ggplot2::element_text(
        margin = ggplot2::margin(t = 0, r = 0, b = 8, l = 0)
      ),
      strip.text.x = NULL,
      strip.text.x.bottom = ggplot2::element_text(
        margin = ggplot2::margin(t = 8, r = 0, b = 0, l = 0)
      ),
      strip.text.y = ggplot2::element_text(
        margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 8),
        angle = -90
      ),
      strip.text.y.left = ggplot2::element_text(
        margin = ggplot2::margin(t = 0, r = 8, b = 0, l = 0),
        angle = 90
      ),
      strip.placement = "outside",
      strip.placement.x = NULL,
      strip.placement.y = NULL,
      strip.switch.pad.grid = grid::unit(0.15, "pt"),
      strip.switch.pad.wrap = grid::unit(0.15, "pt"),
      plot.background = ggplot2::element_rect(
        colour = plot_background_fill,
        fill = plot_background_fill
      ),
      plot.title = ggplot2::element_text(
        size = title_size,
        family = title_family,
        colour = title_colour,
        hjust = 0,
        margin = ggplot2::margin(b = 27.50)
      ),
      plot.title.position = "plot",
      plot.subtitle = ggplot2::element_text(
        size = subtitle_size,
        family = subtitle_family,
        colour = subtitle_colour,
        hjust = 0,
        margin = ggplot2::margin(b = 22)
      ),
      plot.caption = ggplot2::element_text(
        size = caption_size,
        family = caption_family,
        colour = caption_colour,
        hjust = caption_hjust,
        margin = ggplot2::margin(t = 7.5, r = 0, b = 0, l = 0)
      ),
      plot.caption.position = "plot",
      plot.tag = ggplot2::element_text(
        size = ggplot2::rel(1.2),
        hjust = 0,
        vjust = 0.5
      ),
      plot.tag.position = "topleft",
      plot.margin = ggplot2::margin(7.5, 17.5, 7.5, 7.5),
      complete = TRUE
    ) +
    ggplot2::theme(
      geom = ggplot2::element_geom(
        fill = geom_fill,
        colour = geom_colour,
        pointshape = 21,
        linewidth = 0.66,
        borderwidth = 0.33,
        pointsize = 1.5,
        fontsize = text_size,
        family = text_family
      ),
      geom.point = ggplot2::element_geom(borderwidth = 0.33),
      geom.pointrange = ggplot2::element_geom(borderwidth = 0.33),
      geom.dotplot = ggplot2::element_geom(borderwidth = 0.33),
      geom.text = ggplot2::element_geom(colour = text_colour),
      palette.colour.discrete = palette_colour_discrete,
      palette.fill.discrete = palette_fill_discrete,
      palette.colour.continuous = palette_colour_continuous,
      palette.fill.continuous = palette_fill_continuous,
      palette.shape.discrete = scales::pal_manual(c(21, 24, 22, 23, 25)),
      palette.linetype.discrete = scales::pal_manual(1:6)
    )

  # Apply legend position specific settings
  theme +
    legend_place(
      legend_place = legend_place,
      legend_key_fill = legend_key_fill,
      legend_background_fill = legend_background_fill,
      legend_axis_line_colour = legend_axis_line_colour,
      legend_axis_line_linewidth = legend_axis_line_linewidth,
      legend_ticks_colour = legend_ticks_colour,
      legend_ticks_linewidth = legend_ticks_linewidth,
      legend_ticks_length = legend_ticks_length
    )
}

#' Darker theme
#'
#' @description A complete theme for a dark panel background.
#'
#' @inheritParams theme_light
#'
#' @return A ggplot theme.
#' @export
#' @inherit theme_light examples
#'
theme_dark <- function(
  ...,
  text_size = 10,
  text_family = "",
  text_colour = flexoki::flexoki$base["base200"],
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
  panel_background_fill = flexoki::flexoki$base["base950"],
  panel_grid_colour = "black",
  panel_grid_linetype = 1,
  panel_grid_linewidth = 1,
  panel_grid_minor_linetype = 1,
  panel_grid_minor_linewidth = 0.5,
  plot_background_fill = "black",
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

#' Greyer theme
#'
#' @description A complete theme with a grey panel background on a white plot
#'   background. The panel grid colour is derived automatically by blending
#'   `panel_background_fill` with itself using `blends::multiply()`,
#'   producing a subtly darker tone that stays harmonious with the panel colour.
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
  panel_background_fill = "#EAEEEFFF",
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
