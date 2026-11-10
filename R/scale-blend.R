# blend family --------------------------------------------------------------

#' Derive an aesthetic by blending the other one
#'
#' Maps `aesthetic` to a blended version of the *other* colour aesthetic
#' (`fill` when deriving `"colour"`, `colour` when deriving `"fill"`),
#' evaluated after scale training via [ggplot2::after_scale()]. Attaches no
#' scale itself — use [scale_fill_blend_discrete()] (or
#' `_continuous`/`_binned`, or the `scale_colour_blend_*` equivalents) for a
#' ready-to-plot version. Requires the `ggrefine` function to be used instead
#' of `ggplot2::ggplot` to work where no source aesthetic is mapped.
#'
#' @param ... Unused. Included to require argument naming and support trailing commas.
#' @param aesthetic The aesthetic to derive, either `"colour"` (default,
#'   derived from `fill`) or `"fill"` (derived from `colour`).
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector. If `NULL`, a blend is chosen from the active theme's
#'   panel background.
#'
#' @returns A `ggplot2` mapping object (as returned by [ggplot2::aes()]).
#' @export
#' @importFrom rlang .data %||%
aes_blend <- function(..., aesthetic = "colour", blend = NULL) {
  aesthetic <- .arg_aesthetic(aesthetic)
  source <- .other_aesthetic(aesthetic)

  .aes_derived(
    aesthetic,
    ggplot2::after_scale(
      .get_blend(.data[[!!source]], blend = blend, aesthetic = aesthetic)
    )
  )
}

#' Scale fill, and derive colour by blending (discrete)
#'
#' Scales `fill` with a discrete scale, and derives `colour` as a blended
#' version of the resulting `fill`, via [aes_blend()].
#'
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_fill_discrete()].
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector.
#'
#' @returns A `list` of ggplot2 components (a mapping and a scale) that can be
#'   added to a ggplot object.
#' @export
scale_fill_blend_discrete <- function(..., blend = NULL) {
  list(
    aes_blend("colour", blend = blend),
    ggplot2::scale_fill_discrete(...)
  )
}

#' Scale colour, and derive fill by blending (discrete)
#'
#' Scales `colour` with a discrete scale, and derives `fill` as a blended
#' version of the resulting `colour`, via [aes_blend()].
#'
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_discrete()].
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector.
#'
#' @returns A `list` of ggplot2 components (a mapping and a scale) that can be
#'   added to a ggplot object.
#' @export
scale_colour_blend_discrete <- function(..., blend = NULL) {
  list(
    aes_blend("fill", blend = blend),
    ggplot2::scale_colour_discrete(...)
  )
}

#' Scale fill, and derive colour by blending (continuous)
#'
#' Scales `fill` with a continuous scale, and derives `colour` as a blended
#' version of the resulting `fill`, via [aes_blend()].
#'
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_fill_continuous()].
#' @inheritParams scale_fill_blend_discrete
#'
#' @returns A `list` of ggplot2 components (a mapping and a scale) that can be
#'   added to a ggplot object.
#' @export
scale_fill_blend_continuous <- function(..., blend = NULL) {
  list(
    aes_blend("colour", blend = blend),
    ggplot2::scale_fill_continuous(...)
  )
}

#' Scale colour, and derive fill by blending (continuous)
#'
#' Scales `colour` with a continuous scale, and derives `fill` as a blended
#' version of the resulting `colour`, via [aes_blend()].
#'
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_continuous()].
#' @inheritParams scale_colour_blend_discrete
#'
#' @returns A `list` of ggplot2 components (a mapping and a scale) that can be
#'   added to a ggplot object.
#' @export
scale_colour_blend_continuous <- function(..., blend = NULL) {
  list(
    aes_blend("fill", blend = blend),
    ggplot2::scale_colour_continuous(...)
  )
}

#' Scale fill, and derive colour by blending (binned)
#'
#' Scales `fill` with a binned scale, and derives `colour` as a blended
#' version of the resulting `fill`, via [aes_blend()].
#'
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_fill_binned()].
#' @inheritParams scale_fill_blend_discrete
#'
#' @returns A `list` of ggplot2 components (a mapping and a scale) that can be
#'   added to a ggplot object.
#' @export
scale_fill_blend_binned <- function(..., blend = NULL) {
  list(
    aes_blend("colour", blend = blend),
    ggplot2::scale_fill_binned(...)
  )
}

#' Scale colour, and derive fill by blending (binned)
#'
#' Scales `colour` with a binned scale, and derives `fill` as a blended
#' version of the resulting `colour`, via [aes_blend()].
#'
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_binned()].
#' @inheritParams scale_colour_blend_discrete
#'
#' @returns A `list` of ggplot2 components (a mapping and a scale) that can be
#'   added to a ggplot object.
#' @export
scale_colour_blend_binned <- function(..., blend = NULL) {
  list(
    aes_blend("fill", blend = blend),
    ggplot2::scale_colour_binned(...)
  )
}

# internal helpers ------------------------------------------------------

#' @noRd
.arg_aesthetic <- function(aesthetic, error_call = rlang::caller_env()) {
  rlang::arg_match0(
    aesthetic,
    values = c("colour", "fill"),
    arg_nm = "aesthetic",
    error_call = error_call
  )
}

#' Build a one-element aes() whose name is only known at runtime
#'
#' `ggplot2::aes()` doesn't support `:=`, so the quosure is spliced in as a
#' named list instead.
#' @noRd
.aes_derived <- function(aesthetic, expr) {
  mapping <- rlang::set_names(list(rlang::enquo(expr)), aesthetic)
  rlang::inject(ggplot2::aes(!!!mapping))
}

#' @noRd
.other_aesthetic <- function(aesthetic) {
  if (identical(aesthetic, "colour")) "fill" else "colour"
}

#' @noRd
.get_blend <- function(col, blend = NULL, aesthetic = "colour") {
  fn <- blend %||% .default_blend(aesthetic)
  fn(col)
}

#' @noRd
.default_blend <- function(aesthetic = "colour") {
  # Deriving colour from fill: darken on light panels, lighten on dark ones.
  # Deriving fill from colour: the reverse.
  dark_panel <- .is_col_dark(.panel_fill())
  use_screen <- if (identical(aesthetic, "colour")) dark_panel else !dark_panel

  if (use_screen) {
    function(x) blends::screen(x)
  } else {
    function(x) blends::multiply(x)
  }
}
