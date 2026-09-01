#' refine_lights (internal, not exported)
#'
#' @description Builds the colour-only, incomplete `theme()` elements used by
#'   `update_lights()`. Not exported (no `@export` tag); documented with `@keywords internal` so that
#'   `@inheritParams refine_lights` resolves on the public `update_*()` functions.
#'
#' @param ... Require named arguments (and support trailing commas).
#' @param text_colour The base colour of the text theme element.
#' @param title_colour The colour of the `plot.title` theme element. Defaults to `text_colour`.
#' @param subtitle_colour The colour of the `plot.subtitle` theme element. Defaults to `text_colour`.
#' @param caption_colour The colour of the `plot.caption` theme element. Defaults to `text_colour`.
#' @param axis_line_colour The colour of the axis.line theme element. Defaults to `text_colour`.
#' @param axis_ticks_colour The colour of the axis.ticks theme element. Defaults to `axis_line_colour`.
#' @param legend_axis_line_colour The colour of the legend.axis.line theme element. Defaults to `plot_background_fill`.
#' @param legend_background_fill The fill (and colour) of the `legend.background` theme element. Defaults to `plot_background_fill`.
#' @param legend_key_fill The fill (and colour) of the legend.key theme element. Defaults to `plot_background_fill`.
#' @param legend_ticks_colour The colour of the legend.ticks theme element. Defaults to `legend_axis_line_colour`.
#' @param panel_background_fill The fill (and colour) of the panel.background theme element.
#' @param panel_grid_colour The colour of the panel.grid theme element.
#' @param plot_background_fill The fill (and colour) of the plot.background theme element.
#'
#' @return An incomplete ggplot theme, intended to be added to an existing theme.
#' @keywords internal
refine_lights <- function(
    ...,
    text_colour = "#100F0F", # flexoki::flexoki$base["black"],
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = "white",
    panel_grid_colour = "#F2F0E5", # flexoki::flexoki$base["base50"],
    plot_background_fill = "white"
) {
  # Resolve dependent defaults inside the function body to avoid lazy
  # evaluation surprises when arguments inherit from other arguments.
  if (is.null(title_colour)) {
    title_colour <- text_colour
  }
  if (is.null(subtitle_colour)) {
    subtitle_colour <- text_colour
  }
  if (is.null(caption_colour)) {
    caption_colour <- text_colour
  }
  if (is.null(axis_line_colour)) {
    axis_line_colour <- text_colour
  }

  # Convert all colour arguments to plain character strings
  text_colour <- as.character(text_colour)
  title_colour <- as.character(title_colour)
  subtitle_colour <- as.character(subtitle_colour)
  caption_colour <- as.character(caption_colour)
  axis_line_colour <- as.character(axis_line_colour)
  panel_background_fill <- as.character(panel_background_fill)
  panel_grid_colour <- as.character(panel_grid_colour)
  plot_background_fill <- as.character(plot_background_fill)

  # Set defaults for dependent parameters
  if (is.null(axis_ticks_colour)) {
    axis_ticks_colour <- axis_line_colour
  }
  if (is.null(legend_axis_line_colour)) {
    legend_axis_line_colour <- plot_background_fill
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

  # Convert dependent colour arguments to plain character strings
  axis_ticks_colour <- as.character(axis_ticks_colour)
  legend_axis_line_colour <- as.character(legend_axis_line_colour)
  legend_background_fill <- as.character(legend_background_fill)
  legend_key_fill <- as.character(legend_key_fill)
  legend_ticks_colour <- as.character(legend_ticks_colour)

  ggplot2::theme(
    text = ggplot2::element_text(colour = text_colour),
    line = ggplot2::element_line(colour = axis_line_colour),
    axis.line = ggplot2::element_line(colour = axis_line_colour),
    axis.ticks = ggplot2::element_line(colour = axis_ticks_colour),
    axis.minor.ticks.x.bottom = ggplot2::element_line(colour = axis_ticks_colour),
    axis.minor.ticks.x.top = ggplot2::element_line(colour = axis_ticks_colour),
    axis.minor.ticks.y.left = ggplot2::element_line(colour = axis_ticks_colour),
    axis.minor.ticks.y.right = ggplot2::element_line(colour = axis_ticks_colour),

    legend.key = ggplot2::element_rect(
      colour = legend_key_fill,
      fill = legend_key_fill
    ),
    legend.axis.line = ggplot2::element_line(colour = legend_axis_line_colour),
    legend.ticks = ggplot2::element_line(colour = legend_ticks_colour),
    legend.background = ggplot2::element_rect(
      colour = legend_background_fill,
      fill = legend_background_fill
    ),

    panel.background = ggplot2::element_rect(
      colour = panel_background_fill,
      fill = panel_background_fill
    ),
    panel.grid = ggplot2::element_line(colour = panel_grid_colour),

    plot.background = ggplot2::element_rect(
      colour = plot_background_fill,
      fill = plot_background_fill
    ),
    plot.title = ggplot2::element_text(colour = title_colour),
    plot.subtitle = ggplot2::element_text(colour = subtitle_colour),
    plot.caption = ggplot2::element_text(colour = caption_colour),

    geom = ggplot2::element_geom(fill = "steelblue", colour = "steelblue"),
    geom.text = ggplot2::element_geom(colour = text_colour),
    geom.label = ggplot2::element_geom(
      colour = text_colour,
      fill = panel_background_fill
    ),

    complete = FALSE
  )
}

#' refine_greys (internal, not exported)
#'
#' @description Builds the colour-only, incomplete `theme()` elements used by
#'   `update_greys()`. Not exported (no `@export` tag); documented with `@keywords internal` so that
#'   `@inheritParams refine_lights` resolves on the public `update_*()` functions.
#'
#' @inheritParams refine_lights
#'
#' @return An incomplete ggplot theme, intended to be added to an existing theme.
#' @keywords internal
refine_greys <- function(
    ...,
    text_colour = "#100F0F", # flexoki::flexoki$base["black"],
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = "#F2F0E5FF", # flexoki::flexoki$base["base50"]
    panel_grid_colour = "white",
    plot_background_fill = "white"
) {
  refine_lights(
    ...,
    text_colour = text_colour,
    title_colour = title_colour,
    subtitle_colour = subtitle_colour,
    caption_colour = caption_colour,
    axis_line_colour = axis_line_colour,
    axis_ticks_colour = axis_ticks_colour,
    legend_axis_line_colour = legend_axis_line_colour,
    legend_background_fill = legend_background_fill,
    legend_key_fill = legend_key_fill,
    legend_ticks_colour = legend_ticks_colour,
    panel_background_fill = panel_background_fill,
    panel_grid_colour = panel_grid_colour,
    plot_background_fill = plot_background_fill
  )
}

#' update_lights
#'
#' Update the set theme (Lights)
#'
#' @description Updates the currently active/set theme in place with the
#'   colours of `theme_lights()`, via `ggplot2::theme_update()`. Useful for
#'   recolouring every plot for the rest of the session without swapping out
#'   the full theme.
#'
#' @inheritParams refine_lights
#'
#' @return The previous theme, invisibly (see `ggplot2::theme_update()`).
#' @export
update_lights <- function(
    ...,
    text_colour = "#100F0F", # flexoki::flexoki$base["black"],
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = "white",
    panel_grid_colour = "#F2F0E5", # flexoki::flexoki$base["base50"],
    plot_background_fill = "white"
) {
  do.call(
    ggplot2::theme_update,
    as.list(
      refine_lights(
        ...,
        text_colour = text_colour,
        title_colour = title_colour,
        subtitle_colour = subtitle_colour,
        caption_colour = caption_colour,
        axis_line_colour = axis_line_colour,
        axis_ticks_colour = axis_ticks_colour,
        legend_axis_line_colour = legend_axis_line_colour,
        legend_background_fill = legend_background_fill,
        legend_key_fill = legend_key_fill,
        legend_ticks_colour = legend_ticks_colour,
        panel_background_fill = panel_background_fill,
        panel_grid_colour = panel_grid_colour,
        plot_background_fill = plot_background_fill
      )
    )
  )
}

#' update_greys
#'
#' Update the set theme (greys)
#'
#' @description Updates the currently active/set theme in place with the
#'   colours of `theme_greys()`, via `ggplot2::theme_update()`. Useful for
#'   recolouring every plot for the rest of the session without swapping out
#'   the full theme.
#'
#' @inheritParams refine_lights
#'
#' @return The previous theme, invisibly (see `ggplot2::theme_update()`).
#' @export
update_greys <- function(
    ...,
    text_colour = "#100F0F", # flexoki::flexoki$base["black"],
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = "#F2F0E5FF", # flexoki::flexoki$base["base50"]
    panel_grid_colour = "white",
    plot_background_fill = "white"
) {
  do.call(
    ggplot2::theme_update,
    as.list(
      refine_greys(
        ...,
        text_colour = text_colour,
        title_colour = title_colour,
        subtitle_colour = subtitle_colour,
        caption_colour = caption_colour,
        axis_line_colour = axis_line_colour,
        axis_ticks_colour = axis_ticks_colour,
        legend_axis_line_colour = legend_axis_line_colour,
        legend_background_fill = legend_background_fill,
        legend_key_fill = legend_key_fill,
        legend_ticks_colour = legend_ticks_colour,
        panel_background_fill = panel_background_fill,
        panel_grid_colour = panel_grid_colour,
        plot_background_fill = plot_background_fill
      )
    )
  )
}

#' refine_darks (internal, not exported)
#'
#' @description Builds the colour-only, incomplete `theme()` elements used by
#'   `update_darks()`. Not exported (no `@export` tag); documented with `@keywords internal` so that
#'   `@inheritParams refine_lights` resolves on the public `update_*()` functions.
#'
#' @inheritParams refine_lights
#'
#' @return An incomplete ggplot theme, intended to be added to an existing theme.
#' @keywords internal
refine_darks <- function(
    ...,
    text_colour = "#CECDC3",
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = "#282726", # flexoki::flexoki$base["base900"]
    panel_grid_colour = "#100F0F", # flexoki::flexoki$base["black"],
    plot_background_fill = "#100F0F" # flexoki::flexoki$base["black"]
) {
  refine_lights(
    ...,
    text_colour = text_colour,
    title_colour = title_colour,
    subtitle_colour = subtitle_colour,
    caption_colour = caption_colour,
    axis_line_colour = axis_line_colour,
    axis_ticks_colour = axis_ticks_colour,
    legend_axis_line_colour = legend_axis_line_colour,
    legend_background_fill = legend_background_fill,
    legend_key_fill = legend_key_fill,
    legend_ticks_colour = legend_ticks_colour,
    panel_background_fill = panel_background_fill,
    panel_grid_colour = panel_grid_colour,
    plot_background_fill = plot_background_fill
  )
}

#' update_darks
#'
#' Update the set theme (Darks)
#'
#' @description Updates the currently active/set theme in place with the
#'   colours of `theme_darks()`, via `ggplot2::theme_update()`. Useful for
#'   recolouring every plot for the rest of the session without swapping out
#'   the full theme.
#'
#' @inheritParams refine_lights
#'
#' @return The previous theme, invisibly (see `ggplot2::theme_update()`).
#' @export
update_darks <- function(
    ...,
    text_colour = "#CECDC3",
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = "#282726", # flexoki::flexoki$base["base900"]
    panel_grid_colour = "#100F0F", # flexoki::flexoki$base["black"],
    plot_background_fill = "#100F0F" # flexoki::flexoki$base["black"]
) {
  do.call(
    ggplot2::theme_update,
    as.list(
      refine_darks(
        ...,
        text_colour = text_colour,
        title_colour = title_colour,
        subtitle_colour = subtitle_colour,
        caption_colour = caption_colour,
        axis_line_colour = axis_line_colour,
        axis_ticks_colour = axis_ticks_colour,
        legend_axis_line_colour = legend_axis_line_colour,
        legend_background_fill = legend_background_fill,
        legend_key_fill = legend_key_fill,
        legend_ticks_colour = legend_ticks_colour,
        panel_background_fill = panel_background_fill,
        panel_grid_colour = panel_grid_colour,
        plot_background_fill = plot_background_fill
      )
    )
  )
}

#' Update colour/fill palettes or fixed geom colour/fill
#'
#' Modifies active theme settings for fixed, discrete, and continuous palettes
#' only for parameters explicitly provided by the user.
#'
#' @param fixed Colour applied to geometric elements via \code{element_geom()}.
#'   Updates both `colour` and `fill`.
#' @param discrete Palette specification (e.g., \code{scales::pal_hue()}) for
#'   discrete scales (`palette.colour.discrete` and `palette.fill.discrete`).
#' @param continuous Palette specification for continuous scales
#'   (`palette.colour.continuous` and `palette.fill.continuous`).
#'
#' @return Invisibly returns the result of the \code{theme_update()} calls.
#' @export
#'
#' @examples
#' \dontrun{
#' # Update fixed geom colour
#' update_palette(fixed = "steelblue")
#'
#' # Update discrete palette
#' update_palette(discrete = scales::pal_hue())
#'
#' # Update continuous palette
#' update_palette(continuous = scales::pal_viridis())
#' }
update_palette <- function(
    fixed = NULL,
    discrete = NULL,
    continuous = NULL
) {
  if (!is.null(fixed)) {
    ggplot2::theme_update(geom = ggplot2::element_geom(colour = fixed, fill = fixed))
  }

  if (!is.null(discrete)) {
    ggplot2::theme_update(
      palette.colour.discrete = discrete,
      palette.fill.discrete   = discrete
    )
  }

  if (!is.null(continuous)) {
    ggplot2::theme_update(
      palette.colour.continuous = continuous,
      palette.fill.continuous   = continuous
    )
  }
}

#' Update panel dimensions in the current ggplot theme
#'
#' Modifies panel dimensions such as heights and widths by updating
#' the global theme settings.
#'
#' @param heights A \code{\link[ggplot2]{margin}} or unit object specifying the panel
#'   heights (e.g., \code{grid::unit(5, "cm")}).
#' @param widths A \code{\link[ggplot2]{margin}} or unit object specifying the panel
#'   widths (e.g., \code{grid::unit(5, "cm")}).
#'
#' @return Invisibly returns the updated theme object.
#' @export
#'
#' @examples
#' \dontrun{
#' update_panel_size(
#'   heights = grid::unit(6, "cm"),
#'   widths = grid::unit(8, "cm")
#' )
#' }
update_panel_size <- function(
    heights = ggplot2::waiver(),
    widths = ggplot2::waiver()
) {
  if (!ggplot2::is_waiver(heights)) ggplot2::theme_update(panel.heights = heights)
  if (!ggplot2::is_waiver(widths)) ggplot2::theme_update(panel.widths = widths)
}
