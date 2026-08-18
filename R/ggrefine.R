#' Initialize a ggplot object with theme-aware default aesthetics
#'
#' @description
#' `ggrefine()` initializes a [ggplot2::ggplot()] object and pre-populates default
#' identity `fill` and `colour` aesthetic mappings derived from the active theme's
#' `geom` defaults (falling back to `"grey35"` and `"black"` respectively).
#'
#' These default aesthetics act as lightweight fallbacks and are cleanly overridden
#' when explicit mappings are added in subsequent layers via [ggplot2::aes()].
#'
#' @param data Default data frame to use for plot. If not specified, must be
#'   supplied in individual layers.
#'
#' @return A [ggplot2::ggplot()] object initialized with default aesthetic mappings.
#'
#' @export
#' @examples
#' library(ggplot2)
#' library(dplyr)
#'
#' set_theme(ggrefine::theme_lighter())
#'
#' mpg |>
#'   count(class) |>
#'   ggrefine() +
#'   aes(x = class, y = n, fill = class) +
#'   geom_col()
ggrefine <- function(data) {
  ggplot2::ggplot(data) +
    ggplot2::aes(fill = I(ggplot2::get_theme()$geom@fill %||% "grey35")) +
    ggplot2::aes(colour = I(ggplot2::get_theme()$geom@colour %||% "black"))
}
