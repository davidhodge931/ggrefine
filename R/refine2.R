# ------------------------------------------------------------------------------
# Internal helpers
# ------------------------------------------------------------------------------

.infer_focus <- function(discrete) {
  if (discrete == "x") {
    "x"
  } else if (discrete == "y") {
    "y"
  } else {
    "x"
  }
}

.validate_refine_args <- function(discrete, focus) {
  discrete <- rlang::arg_match(discrete, c("none", "x", "y", "both"))

  if (is.null(focus)) {
    focus <- .infer_focus(discrete)
  }

  focus <- rlang::arg_match(focus, c("x", "y"))

  list(
    discrete = discrete,
    focus = focus
  )
}

# ------------------------------------------------------------------------------
# Theme fragments
# ------------------------------------------------------------------------------

.remove_x_panel_grid <- function() {
  ggplot2::theme(
    panel.grid.major.x = ggplot2::element_line(linetype = 0),
    panel.grid.minor.x = ggplot2::element_line(linetype = 0)
  )
}

.remove_y_panel_grid <- function() {
  ggplot2::theme(
    panel.grid.major.y = ggplot2::element_line(linetype = 0),
    panel.grid.minor.y = ggplot2::element_line(linetype = 0)
  )
}

.remove_x_axis_line <- function() {
  ggplot2::theme(
    axis.line.x.bottom = ggplot2::element_line(linetype = 0),
    axis.line.x.top = ggplot2::element_line(linetype = 0)
  )
}

.remove_y_axis_line <- function() {
  ggplot2::theme(
    axis.line.y.left = ggplot2::element_line(linetype = 0),
    axis.line.y.right = ggplot2::element_line(linetype = 0)
  )
}

.remove_x_axis_ticks <- function() {
  ggplot2::theme(
    axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
    axis.ticks.x.top = ggplot2::element_line(linetype = 0),
    axis.minor.ticks.x.bottom = ggplot2::element_line(linetype = 0),
    axis.minor.ticks.x.top = ggplot2::element_line(linetype = 0)
  )
}

.remove_y_axis_ticks <- function() {
  ggplot2::theme(
    axis.ticks.y.left = ggplot2::element_line(linetype = 0),
    axis.ticks.y.right = ggplot2::element_line(linetype = 0),
    axis.minor.ticks.y.left = ggplot2::element_line(linetype = 0),
    axis.minor.ticks.y.right = ggplot2::element_line(linetype = 0)
  )
}

.remove_x_axis_text <- function() {
  ggplot2::theme(
    axis.text.x.top = ggplot2::element_blank(),
    axis.text.x.bottom = ggplot2::element_blank()
  )
}

.remove_y_axis_text <- function() {
  ggplot2::theme(
    axis.text.y.left = ggplot2::element_blank(),
    axis.text.y.right = ggplot2::element_blank()
  )
}

.remove_x_axis_title <- function() {
  ggplot2::theme(
    axis.title.x.top = ggplot2::element_blank(),
    axis.title.x.bottom = ggplot2::element_blank()
  )
}

.remove_y_axis_title <- function() {
  ggplot2::theme(
    axis.title.y.left = ggplot2::element_blank(),
    axis.title.y.right = ggplot2::element_blank()
  )
}

# ------------------------------------------------------------------------------
# Axis policies (prefixes)
# ------------------------------------------------------------------------------

.apply_axis_policy <- function(theme, axis_mode, discrete, focus) {
  axis_mode <- rlang::arg_match(
    axis_mode,
    c("classic", "modern", "minimal", "void")
  )

  if (axis_mode == "classic") {
    if (discrete %in% c("x", "both")) {
      theme <- theme + .remove_x_axis_ticks()
    }

    if (discrete %in% c("y", "both")) {
      theme <- theme + .remove_y_axis_ticks()
    }

    return(theme)
  }

  if (axis_mode == "modern") {
    if (focus == "x") {
      theme <- theme +
        .remove_y_axis_line() +
        .remove_y_axis_ticks()
    }

    if (focus == "y") {
      theme <- theme +
        .remove_x_axis_line() +
        .remove_x_axis_ticks()
    }

    if (discrete %in% c("x", "both")) {
      theme <- theme + .remove_x_axis_ticks()
    }

    if (discrete %in% c("y", "both")) {
      theme <- theme + .remove_y_axis_ticks()
    }

    return(theme)
  }

  if (axis_mode == "minimal") {
    theme <- theme +
      .remove_x_axis_line() +
      .remove_y_axis_line() +
      .remove_x_axis_ticks() +
      .remove_y_axis_ticks()

    return(theme)
  }

  if (axis_mode == "void") {
    theme <- theme +
      .remove_x_axis_line() +
      .remove_y_axis_line() +
      .remove_x_axis_ticks() +
      .remove_y_axis_ticks() +
      .remove_x_axis_text() +
      .remove_y_axis_text() +
      .remove_x_axis_title() +
      .remove_y_axis_title()

    return(theme)
  }

  theme
}

# ------------------------------------------------------------------------------
# Grid policies (suffixes)
# ------------------------------------------------------------------------------

.apply_grid_policy <- function(theme, grid_mode, discrete, focus) {
  grid_mode <- rlang::arg_match(
    grid_mode,
    c("keep", "drift", "flow", "still")
  )

  if (grid_mode == "keep") {
    return(theme)
  }

  if (grid_mode == "drift") {
    if (discrete != "none") {
      if (focus == "x") {
        theme <- theme + .remove_x_panel_grid()
      }

      if (focus == "y") {
        theme <- theme + .remove_y_panel_grid()
      }
    }

    return(theme)
  }

  if (grid_mode == "flow") {
    if (focus == "x") {
      theme <- theme + .remove_x_panel_grid()
    }

    if (focus == "y") {
      theme <- theme + .remove_y_panel_grid()
    }

    return(theme)
  }

  if (grid_mode == "still") {
    theme <- theme +
      .remove_x_panel_grid() +
      .remove_y_panel_grid()

    return(theme)
  }

  theme
}

# ------------------------------------------------------------------------------
# Composition helper
# ------------------------------------------------------------------------------

.compose_refine <- function(axis_mode, grid_mode, discrete, focus) {
  args <- .validate_refine_args(discrete = discrete, focus = focus)

  theme <- ggplot2::theme()

  theme <- .apply_axis_policy(
    theme = theme,
    axis_mode = axis_mode,
    discrete = args$discrete,
    focus = args$focus
  )

  theme <- .apply_grid_policy(
    theme = theme,
    grid_mode = grid_mode,
    discrete = args$discrete,
    focus = args$focus
  )

  theme
}

# ------------------------------------------------------------------------------
# Classic family
# ------------------------------------------------------------------------------

#' Classic keep refine
#'
#' Removes axis ticks on discrete axes and leaves panel gridlines unchanged.
#'
#' If `discrete = "x"`, x-axis ticks are removed.
#' If `discrete = "y"`, y-axis ticks are removed.
#' If `discrete = "both"`, ticks are removed on both axes.
#'
#' @param ... Reserved for future extensions. Placed first so later arguments
#'   must be named, and to support trailing commas in calls.
#' @param discrete Character scalar describing which axes should be treated as
#'   discrete for refinement purposes: `"none"`, `"x"`, `"y"`, or `"both"`.
#' @param focus Character. The primary axis of interest: `"x"` or `"y"`.
#'   This affects grid modes such as `*_drift()` and `*_flow()`. If `NULL`
#'   (default), focus is inferred from `discrete`: `"x"` gives `"x"`,
#'   `"y"` gives `"y"`, otherwise `"x"`.
#'
#' @return A ggplot2 theme object
#' @export
classic_keep <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("classic", "keep", discrete, focus)
}

#' Classic drift refine
#'
#' Removes axis ticks on discrete axes. Removes panel gridlines on the focused
#' axis only when at least one axis is discrete.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
classic_drift <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("classic", "drift", discrete, focus)
}

#' Classic flow refine
#'
#' Removes axis ticks on discrete axes and removes panel gridlines on the
#' focused axis.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
classic_flow <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("classic", "flow", discrete, focus)
}

#' Classic still refine
#'
#' Removes axis ticks on discrete axes and removes all panel gridlines.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
classic_still <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("classic", "still", discrete, focus)
}

# ------------------------------------------------------------------------------
# Modern family
# ------------------------------------------------------------------------------

#' Modern keep refine
#'
#' Removes axis lines, ticks, and minor ticks from the non-focused axis.
#' Axis ticks on discrete axes are removed. Panel gridlines are left unchanged.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
modern_keep <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("modern", "keep", discrete, focus)
}

#' Modern drift refine
#'
#' Removes axis lines, ticks, and minor ticks from the non-focused axis.
#' Axis ticks on discrete axes are removed. Removes panel gridlines on the
#' focused axis only when at least one axis is discrete.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
modern_drift <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("modern", "drift", discrete, focus)
}

#' Modern flow refine
#'
#' Removes axis lines, ticks, and minor ticks from the non-focused axis.
#' Axis ticks on discrete axes are removed. Removes panel gridlines on the
#' focused axis.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
modern_flow <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("modern", "flow", discrete, focus)
}

#' Modern still refine
#'
#' Removes axis lines, ticks, and minor ticks from the non-focused axis.
#' Axis ticks on discrete axes are removed. Removes all panel gridlines.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
modern_still <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("modern", "still", discrete, focus)
}

# ------------------------------------------------------------------------------
# Minimal family
# ------------------------------------------------------------------------------

#' Minimal keep refine
#'
#' Removes all axis lines, ticks, and minor ticks. Panel gridlines are left
#' unchanged.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
minimal_keep <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("minimal", "keep", discrete, focus)
}

#' Minimal drift refine
#'
#' Removes all axis lines, ticks, and minor ticks. Removes panel gridlines on
#' the focused axis only when at least one axis is discrete.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
minimal_drift <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("minimal", "drift", discrete, focus)
}

#' Minimal flow refine
#'
#' Removes all axis lines, ticks, and minor ticks. Removes panel gridlines on
#' the focused axis.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
minimal_flow <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("minimal", "flow", discrete, focus)
}

#' Minimal still refine
#'
#' Removes all axis lines, ticks, and minor ticks. Removes all panel gridlines.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
minimal_still <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("minimal", "still", discrete, focus)
}

# ------------------------------------------------------------------------------
# Void family
# ------------------------------------------------------------------------------

#' Void keep refine
#'
#' Removes all axis lines, ticks, and minor ticks, and removes all axis text
#' and axis titles. Panel gridlines are left unchanged.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
void_keep <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("void", "keep", discrete, focus)
}

#' Void drift refine
#'
#' Removes all axis lines, ticks, and minor ticks, and removes all axis text
#' and axis titles. Removes panel gridlines on the focused axis only when at
#' least one axis is discrete.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
void_drift <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("void", "drift", discrete, focus)
}

#' Void flow refine
#'
#' Removes all axis lines, ticks, and minor ticks, and removes all axis text
#' and axis titles. Removes panel gridlines on the focused axis.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
void_flow <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("void", "flow", discrete, focus)
}

#' Void still refine
#'
#' Removes all axis lines, ticks, and minor ticks, and removes all axis text
#' and axis titles. Removes all panel gridlines.
#'
#' @inheritParams classic_keep
#'
#' @return A ggplot2 theme object
#' @export
void_still <- function(
    ...,
    discrete = "none",
    focus = NULL
) {
  rlang::check_dots_empty0(...)

  .compose_refine("void", "still", discrete, focus)
}
