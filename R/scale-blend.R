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
aes_fill_blend <- function(blend = NULL) {
  ggplot2::aes(colour = ggplot2::after_scale({
    fn <- blend %||% .default_fill_blend()
    fn(.data$fill)
  }))
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
aes_colour_blend <- function(blend = NULL) {
  ggplot2::aes(fill = ggplot2::after_scale({
    fn <- blend %||% .default_colour_blend()
    fn(.data$colour)
  }))
}

#' Scale fill, and derive colour by blending (discrete)
#'
#' Scales `fill` with a discrete colour scale, and additionally maps
#' `colour` to a blended version of the resulting `fill`, via
#' [aes_fill_blend()]. The `colour` legend is suppressed since `fill`
#' already communicates the mapping.
#'
#' @param blend A function that takes a colour vector and returns a blended
#'   colour vector.
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_discrete()], and [ggplot2::scale_fill_discrete()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a discrete
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_fill_blend_discrete <- function(blend = NULL, ...) {
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
#'   colour vector.
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_discrete()], and [ggplot2::scale_fill_discrete()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a discrete
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_colour_blend_discrete <- function(blend = NULL, ...) {
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
#'   colour vector.
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_continuous()], and [ggplot2::scale_fill_continuous()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a continuous
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_fill_blend_continuous <- function(blend = NULL, ...) {
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
#'   colour vector.
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_continuous()], and [ggplot2::scale_fill_continuous()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a continuous
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_colour_blend_continuous <- function(blend = NULL, ...) {
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
#'   colour vector.
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_binned()], and [ggplot2::scale_fill_binned()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a binned
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_fill_blend_binned <- function(blend = NULL, ...) {
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
#'   colour vector.
#' @param ... Additional arguments passed on to
#'   [ggplot2::scale_colour_binned()], and [ggplot2::scale_fill_binned()].
#'
#' @returns A `list` of ggplot2 components (a mapping, a binned
#'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' @export
scale_colour_blend_binned <- function(blend = NULL, ...) {
  list(
    aes_colour_blend(blend),
    ggplot2::scale_colour_binned(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(fill = ggplot2::guide_none())
  )
}

