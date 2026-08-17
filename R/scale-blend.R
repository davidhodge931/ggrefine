#' #' Create a colour aesthetic blended from fill
#' #'
#' #' Internal helper that builds an `aes()` mapping setting `colour` to a
#' #' blended version of `fill`, evaluated after scale training via
#' #' [ggplot2::after_scale()]. Used by the `scale_blend_fill_*()` family.
#' #'
#' #' @param blend A function that takes a colour vector and returns a blended
#' #'   colour vector.
#' #'
#' #' @returns A `ggplot2` `mapping` object (as returned by [ggplot2::aes()]).
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' ggplot2::ggplot(mpg, ggplot2::aes(class, fill = class)) +
#' #'   ggplot2::geom_bar() +
#' #'   aes_blend_fill(blends::multiply)
#' #' }
#' aes_blend_fill <- function(blend = \(x) blends::multiply(x)) {
#'   ggplot2::aes(colour = ggplot2::after_scale(blend(.data$fill)))
#' }
#'
#' #' Create a fill aesthetic blended from colour
#' #'
#' #' Internal helper that builds an `aes()` mapping setting `fill` to a
#' #' blended version of `colour`, evaluated after scale training via
#' #' [ggplot2::after_scale()]. Used by the `scale_blend_colour_*()` family.
#' #'
#' #' @param blend A function that takes a colour vector and returns a blended
#' #'   colour vector.
#' #'
#' #' @returns A `ggplot2` `mapping` object (as returned by [ggplot2::aes()]).
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' ggplot2::ggplot(mpg, ggplot2::aes(class, colour = class)) +
#' #'   ggplot2::geom_point() +
#' #'   aes_blend_colour(blends::screen)
#' #' }
#' aes_blend_colour <- function(blend = \(x) blends::screen(x)) {
#'   ggplot2::aes(fill = ggplot2::after_scale(blend(.data$colour)))
#' }
#'
#' #' Blend fill into colour for discrete scales
#' #'
#' #' Adds a `colour` aesthetic that is computed from the `fill` aesthetic
#' #' after scale evaluation, using a blend function. Useful for automatically
#' #' deriving an outline colour from a discrete fill scale.
#' #'
#' #' @param blend A function that takes a colour vector and returns a blended
#' #'   colour vector. Defaults to [blends::multiply()].
#' #' @param ... Additional arguments passed on to
#' #'   [ggplot2::scale_colour_discrete()].
#' #'
#' #' @returns A `list` of ggplot2 components (an `aes` mapping, a discrete
#' #'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' ggplot2::ggplot(mpg, ggplot2::aes(class, fill = class)) +
#' #'   ggplot2::geom_bar() +
#' #'   scale_blend_fill_discrete()
#' #' }
#' scale_blend_fill_discrete <- function(blend = \(x) blends::multiply(x), ...) {
#'   list(
#'     aes_blend_fill(blend),
#'     ggplot2::scale_colour_discrete(..., aesthetics = c("colour", "fill")),
#'     ggplot2::guides(colour = ggplot2::guide_none())
#'   )
#' }
#'
#' #' Blend colour into fill for discrete scales
#' #'
#' #' Adds a `fill` aesthetic that is computed from the `colour` aesthetic
#' #' after scale evaluation, using a blend function. Useful for automatically
#' #' deriving a fill colour from a discrete colour scale.
#' #'
#' #' @param blend A function that takes a colour vector and returns a blended
#' #'   colour vector. Defaults to [blends::screen()].
#' #' @param ... Additional arguments passed on to
#' #'   [ggplot2::scale_colour_discrete()].
#' #'
#' #' @returns A `list` of ggplot2 components (an `aes` mapping, a discrete
#' #'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' ggplot2::ggplot(mpg, ggplot2::aes(class, colour = class)) +
#' #'   ggplot2::geom_point() +
#' #'   scale_blend_colour_discrete()
#' #' }
#' scale_blend_colour_discrete <- function(blend = \(x) blends::screen(x), ...) {
#'   list(
#'     aes_blend_colour(blend),
#'     ggplot2::scale_colour_discrete(..., aesthetics = c("colour", "fill")),
#'     ggplot2::guides(fill = ggplot2::guide_none())
#'   )
#' }
#'
#' #' Blend fill into colour for continuous scales
#' #'
#' #' Adds a `colour` aesthetic that is computed from the `fill` aesthetic
#' #' after scale evaluation, using a blend function. Useful for automatically
#' #' deriving an outline colour from a continuous fill scale.
#' #'
#' #' @param blend A function that takes a colour vector and returns a blended
#' #'   colour vector. Defaults to [blends::multiply()].
#' #' @param ... Additional arguments passed on to
#' #'   [ggplot2::scale_colour_continuous()].
#' #'
#' #' @returns A `list` of ggplot2 components (an `aes` mapping, a continuous
#' #'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, fill = hp)) +
#' #'   ggplot2::geom_point(shape = 21) +
#' #'   scale_blend_fill_continuous()
#' #' }
#' scale_blend_fill_continuous <- function(blend = \(x) blends::multiply(x), ...) {
#'   list(
#'     aes_blend_fill(blend),
#'     ggplot2::scale_colour_continuous(..., aesthetics = c("colour", "fill")),
#'     ggplot2::guides(colour = ggplot2::guide_none())
#'   )
#' }
#'
#' #' Blend colour into fill for continuous scales
#' #'
#' #' Adds a `fill` aesthetic that is computed from the `colour` aesthetic
#' #' after scale evaluation, using a blend function. Useful for automatically
#' #' deriving a fill colour from a continuous colour scale.
#' #'
#' #' @param blend A function that takes a colour vector and returns a blended
#' #'   colour vector. Defaults to [blends::screen()].
#' #' @param ... Additional arguments passed on to
#' #'   [ggplot2::scale_colour_continuous()].
#' #'
#' #' @returns A `list` of ggplot2 components (an `aes` mapping, a continuous
#' #'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = hp)) +
#' #'   ggplot2::geom_point() +
#' #'   scale_blend_colour_continuous()
#' #' }
#' scale_blend_colour_continuous <- function(blend = \(x) blends::screen(x), ...) {
#'   list(
#'     aes_blend_colour(blend),
#'     ggplot2::scale_colour_continuous(..., aesthetics = c("colour", "fill")),
#'     ggplot2::guides(fill = ggplot2::guide_none())
#'   )
#' }
#'
#' #' Blend fill into colour for binned scales
#' #'
#' #' Adds a `colour` aesthetic that is computed from the `fill` aesthetic
#' #' after scale evaluation, using a blend function. Useful for automatically
#' #' deriving an outline colour from a binned fill scale.
#' #'
#' #' @param blend A function that takes a colour vector and returns a blended
#' #'   colour vector. Defaults to [blends::multiply()].
#' #' @param ... Additional arguments passed on to
#' #'   [ggplot2::scale_colour_binned()].
#' #'
#' #' @returns A `list` of ggplot2 components (an `aes` mapping, a binned
#' #'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, fill = hp)) +
#' #'   ggplot2::geom_point(shape = 21) +
#' #'   scale_blend_fill_binned()
#' #' }
#' scale_blend_fill_binned <- function(blend = \(x) blends::multiply(x), ...) {
#'   list(
#'     aes_blend_fill(blend),
#'     ggplot2::scale_colour_binned(..., aesthetics = c("colour", "fill")),
#'     ggplot2::guides(colour = ggplot2::guide_none())
#'   )
#' }
#'
#' #' Blend colour into fill for binned scales
#' #'
#' #' Adds a `fill` aesthetic that is computed from the `colour` aesthetic
#' #' after scale evaluation, using a blend function. Useful for automatically
#' #' deriving a fill colour from a binned colour scale.
#' #'
#' #' @param blend A function that takes a colour vector and returns a blended
#' #'   colour vector. Defaults to [blends::screen()].
#' #' @param ... Additional arguments passed on to
#' #'   [ggplot2::scale_colour_binned()].
#' #'
#' #' @returns A `list` of ggplot2 components (an `aes` mapping, a binned
#' #'   colour/fill scale, and a guide) that can be added to a ggplot object.
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = hp)) +
#' #'   ggplot2::geom_point() +
#' #'   scale_blend_colour_binned()
#' #' }
#' scale_blend_colour_binned <- function(blend = \(x) blends::screen(x), ...) {
#'   list(
#'     aes_blend_colour(blend),
#'     ggplot2::scale_colour_binned(..., aesthetics = c("colour", "fill")),
#'     ggplot2::guides(fill = ggplot2::guide_none())
#'   )
#' }
