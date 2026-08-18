#' Initialize a plot object with theme-aware default aesthetics
#'
#' @description
#' `ggrefine()` initializes a plot object using a specified plotting function
#' (defaults to [ggplot2::ggplot()]) and pre-populates default identity `fill` and
#' `colour` aesthetic mappings derived from the active theme's `geom` defaults
#' (falling back to `"grey35"` and `"black"` respectively).
#'
#' These default aesthetics act as lightweight fallbacks and are cleanly overridden
#' when explicit mappings are added in subsequent layers via [ggplot2::aes()].
#'
#' @param data Default data frame or graph object to use for plot. If not specified,
#'   must be supplied in individual layers.
#' @param initialise Function or lambda used to initialize the plot object
#'   (e.g., [ggplot2::ggplot], `\(x) ggplot2::ggplot(x)`, or
#'   `\(x) ggraph::ggraph(x, layout = "kk")`). Defaults to [ggplot2::ggplot()].
#'
#' @return A plot object initialized with default aesthetic mappings.
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
#'   geom_col() +
#'   scale_fill_blend_discrete()
#'
ggrefine <- function(data = NULL, initialise = ggplot2::ggplot) {
  init_fun <- rlang::as_function(initialise)

  init_fun(data) +
    ggplot2::aes(fill = I(ggplot2::get_theme()$geom@fill %||% "grey35")) +
    ggplot2::aes(colour = I(ggplot2::get_theme()$geom@colour %||% "black"))
}
