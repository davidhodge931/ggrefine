# blend family --------------------------------------------------------------

#' Blend fill into a derived colour mapping
#'
#' Note: this sets `colour`, not `fill` — `fill` is the value it reads
#' from, `colour` is what it derives. Maps `colour` to a blended version of
#' `fill`, evaluated after scale training via [ggplot2::after_scale()].
#' Attaches no scale itself — use [scale_fill_blend_discrete()] (or
#' `_continuous`/`_binned`) for a ready-to-plot version that also scales
#' `fill`.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector.
#'
#' @returns A `ggplot2` mapping object (as returned by [ggplot2::aes()]).
#' @export
#' @importFrom rlang .data
aes_fill_blend <- function(blend = \(x) blends::multiply(x)) {
  ggplot2::aes(colour = ggplot2::after_scale(blend(.data$fill)))
}

#' Blend colour into a derived fill mapping
#'
#' Note: this sets `fill`, not `colour` — `colour` is the value it reads
#' from, `fill` is what it derives. Maps `fill` to a blended version of
#' `colour`, evaluated after scale training via [ggplot2::after_scale()].
#' Attaches no scale itself — use [scale_colour_blend_discrete()] (or
#' `_continuous`/`_binned`) for a ready-to-plot version that also scales
#' `colour`.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector.
#'
#' @returns A `ggplot2` mapping object (as returned by [ggplot2::aes()]).
#' @export
aes_colour_blend <- function(blend = \(x) blends::screen(x)) {
  ggplot2::aes(fill = ggplot2::after_scale(blend(.data$colour)))
}

#' Scale fill, and derive colour by blending (discrete)
#'
#' Scales `fill` with a discrete colour scale, and additionally maps
#' `colour` to a blended version of the resulting `fill`, via
#' [aes_fill_blend()]. The `colour` legend is suppressed since `fill`
#' already communicates the mapping.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector. Defaults to [blends::multiply()].
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_discrete()], and [ggplot2::scale_fill_discrete()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a discrete
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_fill_blend_discrete <- function(blend = \(x) blends::multiply(x), ...) {
  list(
    aes_fill_blend(blend),
    ggplot2::scale_colour_discrete(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(colour = ggplot2::guide_none())
  )
}

#' Scale colour, and derive fill by blending (discrete)
#'
#' Scales `colour` with a discrete colour scale, and additionally maps
#' `fill` to a blended version of the resulting `colour`, via
#' [aes_colour_blend()]. The `fill` legend is suppressed since `colour`
#' already communicates the mapping.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector. Defaults to [blends::screen()].
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_discrete()], and [ggplot2::scale_fill_discrete()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a discrete
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_colour_blend_discrete <- function(blend = \(x) blends::screen(x), ...) {
  list(
    aes_colour_blend(blend),
    ggplot2::scale_colour_discrete(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(fill = ggplot2::guide_none())
  )
}

#' Scale fill, and derive colour by blending (continuous)
#'
#' Scales `fill` with a continuous colour scale, and additionally maps
#' `colour` to a blended version of the resulting `fill`, via
#' [aes_fill_blend()]. The `colour` legend is suppressed since `fill`
#' already communicates the mapping.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector. Defaults to [blends::multiply()].
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_continuous()], and [ggplot2::scale_fill_continuous()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a continuous
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_fill_blend_continuous <- function(blend = \(x) blends::multiply(x), ...) {
  list(
    aes_fill_blend(blend),
    ggplot2::scale_colour_continuous(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(colour = ggplot2::guide_none())
  )
}

#' Scale colour, and derive fill by blending (continuous)
#'
#' Scales `colour` with a continuous colour scale, and additionally maps
#' `fill` to a blended version of the resulting `colour`, via
#' [aes_colour_blend()]. The `fill` legend is suppressed since `colour`
#' already communicates the mapping.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector. Defaults to [blends::screen()].
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_continuous()], and [ggplot2::scale_fill_continuous()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a continuous
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_colour_blend_continuous <- function(blend = \(x) blends::screen(x), ...) {
  list(
    aes_colour_blend(blend),
    ggplot2::scale_colour_continuous(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(fill = ggplot2::guide_none())
  )
}

#' Scale fill, and derive colour by blending (binned)
#'
#' Scales `fill` with a binned colour scale, and additionally maps `colour`
#' to a blended version of the resulting `fill`, via [aes_fill_blend()].
#' The `colour` legend is suppressed since `fill` already communicates the
#' mapping.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector. Defaults to [blends::multiply()].
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_binned()], and [ggplot2::scale_fill_binned()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a binned
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_fill_blend_binned <- function(blend = \(x) blends::multiply(x), ...) {
  list(
    aes_fill_blend(blend),
    ggplot2::scale_colour_binned(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(colour = ggplot2::guide_none())
  )
}

#' Scale colour, and derive fill by blending (binned)
#'
#' Scales `colour` with a binned colour scale, and additionally maps `fill`
#' to a blended version of the resulting `colour`, via [aes_colour_blend()].
#' The `fill` legend is suppressed since `colour` already communicates the
#' mapping.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector. Defaults to [blends::screen()].
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_binned()], and [ggplot2::scale_fill_binned()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a binned
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_colour_blend_binned <- function(blend = \(x) blends::screen(x), ...) {
  list(
    aes_colour_blend(blend),
    ggplot2::scale_colour_binned(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(fill = ggplot2::guide_none())
  )
}

# contrast family -------------------------------------------------------

#' Derive a legible colour by contrasting against fill
#'
#' Note: this sets `colour`, not `fill` — `fill` is the value it reads
#' from, `colour` is what it derives. Maps `colour` to a dark or light
#' shade chosen for contrast against the layer's `fill` aesthetic,
#' evaluated after scale training via [ggplot2::after_scale()]. Attaches
#' no scale itself — sits downstream of whatever `fill` scale you've
#' already applied.
#'
#' @param dark A dark colour string or hex value. If `NULL`, derived from
#'   the active theme.
#' @param light A light colour string or hex value. If `NULL`, derived from
#'   the active theme.
#' @param ... Unused. Included to support trailing commas.
#'
#' @returns A `ggplot2` mapping object (as returned by [ggplot2::aes()]).
#' @export
aes_fill_contrast <- function(dark = NULL, light = NULL, ...) {
  defaults <- .contrast_defaults(dark = dark, light = light)
  dark <- defaults$dark
  light <- defaults$light

  ggplot2::aes(
    colour = ggplot2::after_scale(
      .get_contrast(col = .data$fill, dark = dark, light = light)
    )
  )
}

#' Derive a legible colour by contrasting against the panel background
#'
#' Maps `colour` to a dark or light shade chosen for contrast against the
#' active theme's panel (or plot) background fill, evaluated after scale
#' training via [ggplot2::after_scale()]. Attaches no scale itself.
#'
#' @param dark A dark colour string or hex value. If `NULL`, derived from
#'   the active theme.
#' @param light A light colour string or hex value. If `NULL`, derived from
#'   the active theme.
#' @param ... Unused. Included to support trailing commas.
#'
#' @returns A `ggplot2` mapping object (as returned by [ggplot2::aes()]).
#' @export
aes_panel_contrast <- function(dark = NULL, light = NULL, ...) {
  ggplot2::aes(
    colour = ggplot2::after_scale({
      panel_fill <- .first_theme_fill(
        ggplot2::get_theme(),
        c("panel.background", "plot.background")
      ) %||% "white"

      .get_contrast(col = panel_fill, dark = dark, light = light)
    })
  )
}

# internal helpers ------------------------------------------------------

#' @noRd
.get_contrast <- function(..., col, dark = NULL, light = NULL) {
  defaults <- .contrast_defaults(dark = dark, light = light)
  dark <- defaults$dark
  light <- defaults$light

  is_dark <- .is_col_dark(col)

  out <- rep_len(dark, length(col))
  light_vals <- rep_len(light, length(col))
  out[is_dark] <- light_vals[is_dark]

  out
}

#' @noRd
.contrast_defaults <- function(dark = NULL, light = NULL) {
  if (!rlang::is_null(dark) && !rlang::is_null(light)) {
    return(list(dark = dark, light = light))
  }

  current_theme <- ggplot2::get_theme()

  theme_text <- .first_theme_colour(
    current_theme,
    c(
      "axis.text.x.bottom",
      "axis.text.x.top",
      "axis.text.y.left",
      "axis.text.y.right",
      "axis.text.x",
      "axis.text.y",
      "axis.text",
      "text"
    )
  )

  if (is.null(theme_text)) {
    theme_text <- "black"
  }

  theme_panel <- .first_theme_fill(
    current_theme,
    c("panel.background", "plot.background")
  )

  if (is.null(theme_panel)) {
    theme_panel <- "white"
  }

  if (.is_col_dark(theme_text)) {
    list(
      dark = if (is.null(dark)) theme_text else dark,
      light = if (is.null(light)) theme_panel else light
    )
  } else {
    list(
      dark = if (is.null(dark)) theme_panel else dark,
      light = if (is.null(light)) theme_text else light
    )
  }
}

#' @noRd
.first_theme_colour <- function(theme, elements) {
  for (element in elements) {
    value <- .theme_colour(theme, element)
    if (!is.null(value)) return(value)
  }
  NULL
}

#' @noRd
.first_theme_fill <- function(theme, elements) {
  for (element in elements) {
    value <- .theme_fill(theme, element)
    if (!is.null(value)) return(value)
  }
  NULL
}

#' @noRd
.theme_colour <- function(theme, element) {
  el <- tryCatch(ggplot2::calc_element(element, theme), error = function(...) NULL)
  if (is.null(el)) return(NULL)
  el$colour
}

#' @noRd
.theme_fill <- function(theme, element) {
  el <- tryCatch(ggplot2::calc_element(element, theme), error = function(...) NULL)
  if (is.null(el)) return(NULL)
  el$fill
}

#' @noRd
.is_col_dark <- function(col) {
  if (rlang::is_null(col) || length(col) == 0) return(FALSE)

  col_luminance <- farver::get_channel(colour = col, channel = "l", space = "hcl")
  col_luminance <= 50
}
