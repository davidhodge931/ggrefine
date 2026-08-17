#' Set continuous x-axis minimum flush to zero
#'
#' @description
#' A convenience wrapper around [ggplot2::scale_x_continuous()] that sets the
#' lower limit of the x-axis strictly to zero with no padding by default, while
#' allowing full customization of scale parameters.
#'
#' @param expand Padding multiplier/addend vector. Defaults to `expansion(c(0, 0.05))`.
#' @param limits Axis limits. Defaults to `c(0, NA)` to force the lower bound to zero.
#' @param ... Additional arguments passed on to [ggplot2::scale_x_continuous()].
#'
#' @returns A `ScaleContinuousPosition` object.
#' @export
scale_x_zero <- function(
    expand = ggplot2::expansion(c(0, 0.05)),
    limits = c(0, NA),
    ...) {
  ggplot2::scale_x_continuous(
    expand = expand,
    limits = limits,
    ...
  )
}

#' Set continuous y-axis minimum flush to zero
#'
#' @description
#' A convenience wrapper around [ggplot2::scale_y_continuous()] that sets the
#' lower limit of the y-axis strictly to zero with no padding by default, while
#' allowing full customization of scale parameters.
#'
#' @param expand Padding multiplier/addend vector. Defaults to `expansion(c(0, 0.05))`.
#' @param limits Axis limits. Defaults to `c(0, NA)` to force the lower bound to zero.
#' @param ... Additional arguments passed on to [ggplot2::scale_y_continuous()].
#'
#' @returns A `ScaleContinuousPosition` object.
#' @export
scale_y_zero <- function(
    expand = ggplot2::expansion(c(0, 0.05)),
    limits = c(0, NA),
    ...) {
  ggplot2::scale_y_continuous(
    expand = expand,
    limits = limits,
    ...
  )
}
