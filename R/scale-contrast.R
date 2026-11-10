# contrast family -------------------------------------------------------

#' Derive a legible aesthetic by contrasting against the other one
#'
#' Maps `aesthetic` to a dark or light shade chosen for contrast against the
#' *other* colour aesthetic (`fill` when deriving `"colour"`, `colour` when
#' deriving `"fill"`), evaluated after scale training via
#' [ggplot2::after_scale()]. Attaches no scale itself — sits downstream of
#' whatever scale you've already applied.
#'
#' @param ... Unused. Included to require argument naming and support trailing commas.
#' @param aesthetic The aesthetic to derive, either `"colour"` (default,
#'   contrasted against `fill`) or `"fill"` (contrasted against `colour`).
#' @param dark A dark colour string or hex value. If `NULL`, derived from
#'   the active theme.
#' @param light A light colour string or hex value. If `NULL`, derived from
#'   the active theme.
#'
#' @returns A `ggplot2` mapping object (as returned by [ggplot2::aes()]).
#' @export
#' @importFrom rlang .data
aes_contrast <- function(..., aesthetic = "colour", dark = NULL, light = NULL) {
  aesthetic <- .arg_aesthetic(aesthetic)
  source <- .other_aesthetic(aesthetic)

  .aes_derived(
    aesthetic,
    ggplot2::after_scale(
      .get_contrast(col = .data[[!!source]], dark = dark, light = light)
    )
  )
}

#' Derive a legible aesthetic by contrasting against the panel background
#'
#' Maps `aesthetic` to a dark or light shade chosen for contrast against the
#' active theme's panel (or plot) background fill, evaluated after scale
#' training via [ggplot2::after_scale()]. Attaches no scale itself.
#'
#' @inheritParams aes_contrast
#'
#' @returns A `ggplot2` mapping object (as returned by [ggplot2::aes()]).
#' @export
aes_panel <- function(..., aesthetic = "colour", dark = NULL, light = NULL) {
  aesthetic <- .arg_aesthetic(aesthetic)

  .aes_derived(
    aesthetic,
    ggplot2::after_scale(
      .get_contrast(col = .panel_fill(), dark = dark, light = light)
    )
  )
}

# internal helpers ------------------------------------------------------

#' @noRd
.panel_fill <- function() {
  .first_theme_fill(
    ggplot2::get_theme(),
    c("panel.background", "plot.background")
  ) %||% "white"
}

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

  theme_panel <- .panel_fill()

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
