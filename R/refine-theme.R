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
    text_colour = "#100F0F", #flexoki::flexoki$base["black"],
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
    panel_grid_colour = "#F2F0E5", #flexoki::flexoki$base["base50"],
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

#' refine_ggplot2 (internal, not exported)
#'
#' @description Builds the colour-only, incomplete `theme()` elements used by
#'   `update_ggplot2()`. Not exported (no `@export` tag); documented with `@keywords internal` so that
#'   `@inheritParams refine_lights` resolves on the public `update_*()` functions.
#'
#' @inheritParams refine_lights
#' @param panel_background_fill The fill (and colour) of the panel.background theme element.
#' @param panel_grid_colour The colour of the panel.grid theme element. Defaults to a 75% white mix of `panel_background_fill`.
#'
#' @return An incomplete ggplot theme, intended to be added to an existing theme.
#' @keywords internal
refine_ggplot2 <- function(
    ...,
    text_colour = "#100F0F", #flexoki::flexoki$base["black"],
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = scales::col_mix(
      "#E6E4D9", #flexoki::flexoki$base["base100"],
      "white",
      0.5
    ),
    panel_grid_colour = NULL,
    plot_background_fill = "white"
) {
  # Handle defaults dynamically to prevent lazy evaluation conflicts
  if (is.null(panel_grid_colour)) {
    panel_grid_colour <- scales::col_mix(panel_background_fill, "white", 0.75)
  }

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

#' refine_greys (internal, not exported)
#'
#' @description Builds the colour-only, incomplete `theme()` elements used by
#'   `update_greys()`. Not exported (no `@export` tag); documented with `@keywords internal` so that
#'   `@inheritParams refine_lights` resolves on the public `update_*()` functions.
#'
#' @inheritParams refine_lights
#' @param panel_background_fill The fill (and colour) of the panel.background theme element.
#' @param panel_grid_colour The colour of the panel.grid theme element. Defaults to a multiply blend of `panel_background_fill` with itself.
#'
#' @return An incomplete ggplot theme, intended to be added to an existing theme.
#' @keywords internal
refine_greys <- function(
    ...,
    text_colour = "#100F0F", #flexoki::flexoki$base["black"],
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = scales::col_mix(
      "#E6E4D9", #flexoki::flexoki$base["base100"],
      "white",
      0.5
    ),
    panel_grid_colour = NULL,
    plot_background_fill = "white"
) {
  # Handle defaults dynamically to prevent lazy evaluation conflicts
  if (is.null(panel_grid_colour)) {
    panel_grid_colour <- blends::multiply(panel_background_fill)
  }

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

#' update_lights-----------------------------------------------------------------
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
    text_colour = "#100F0F", #flexoki::flexoki$base["black"],
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
    panel_grid_colour = "#F2F0E5", #flexoki::flexoki$base["base50"],
    plot_background_fill = "white"
) {
  do.call(
    ggplot2::theme_update,
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
}

#' update_ggplot2-----------------------------------------------------------------
#'
#' Update the set theme (ggplot2)
#'
#' @description Updates the currently active/set theme in place with the
#'   colours of `theme_ggplot2()`, via `ggplot2::theme_update()`. Useful for
#'   recolouring every plot for the rest of the session without swapping out
#'   the full theme.
#'
#' @inheritParams refine_lights
#'
#' @return The previous theme, invisibly (see `ggplot2::theme_update()`).
#' @export
update_ggplot2 <- function(
    ...,
    text_colour = "#100F0F", #flexoki::flexoki$base["black"],
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = scales::col_mix(
      "#E6E4D9", #flexoki::flexoki$base["base100"],
      "white",
      0.5
    ),
    panel_grid_colour = NULL,
    plot_background_fill = "white"
) {
  do.call(
    ggplot2::theme_update,
    refine_ggplot2(
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
}

#' update_greys-----------------------------------------------------------------
#'
#' Update the set theme (Greys)
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
    text_colour = "#100F0F", #flexoki::flexoki$base["black"],
    title_colour = NULL,
    subtitle_colour = NULL,
    caption_colour = NULL,
    axis_line_colour = NULL,
    axis_ticks_colour = NULL,
    legend_axis_line_colour = NULL,
    legend_background_fill = NULL,
    legend_key_fill = NULL,
    legend_ticks_colour = NULL,
    panel_background_fill = scales::col_mix(
      "#E6E4D9", #flexoki::flexoki$base["base100"],
      "white",
      0.5
    ),
    panel_grid_colour = NULL,
    plot_background_fill = "white"
) {
  do.call(
    ggplot2::theme_update,
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
}

#' refine_darks (internal, not exported)
#'
#' @description Builds the colour-only, incomplete `theme()` elements used by
#'   `update_darks()`. Not exported (no `@export` tag); documented with `@keywords internal` so that
#'   `@inheritParams refine_lights` resolves on the public `update_*()` functions.
#'
#' @inheritParams refine_lights
#' @param panel_background_fill The fill (and colour) of the panel.background theme element.
#' @param panel_grid_colour The colour of the panel.grid theme element. Defaults to `plot_background_fill`.
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
    panel_background_fill = "#1C1B1A", #flexoki::flexoki$base["base950"],
    panel_grid_colour = NULL,
    plot_background_fill = "#100F0F" #flexoki::flexoki$base["black"],
) {
  if (is.null(panel_grid_colour)) {
    panel_grid_colour <- plot_background_fill
  }

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

#' update_darks-----------------------------------------------------------------
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
    panel_background_fill = "#1C1B1A", #flexoki::flexoki$base["base950"],
    panel_grid_colour = NULL,
    plot_background_fill = "#100F0F" #flexoki::flexoki$base["black"],
) {
  do.call(
    ggplot2::theme_update,
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
}
