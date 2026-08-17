#' # aes_contrast_fill ------------------------------------------------------
#'
#' #' Aesthetic mapping for contrasting colour on fill
#' #'
#' #' @description
#' #' `aes_contrast_fill()` generates an aesthetic mapping for `colour` that
#' #' automatically evaluates to a contrasting dark or light shade depending on
#' #' the underlying `fill` aesthetic, using [ggplot2::after_scale()].
#' #'
#' #' Can be passed directly into [ggplot2::aes()] or spliced into layer
#' #' mappings using [rlang::!!!]. This is designed to sit downstream of
#' #' whatever `fill` scale you've already applied (e.g.
#' #' [ggplot2::scale_fill_viridis_d()], [ggplot2::scale_fill_manual()]) — it
#' #' reads the resulting fill colour and does not alter or replace your fill
#' #' scale.
#' #'
#' #' @param dark A dark colour string or hex value. If `NULL`, defaults to
#' #'   the primary dark text colour.
#' #' @param light A light colour string or hex value. If `NULL`, defaults to
#' #'   the primary light text colour.
#' #' @param ... Unused. Included to support trailing commas.
#' #'
#' #' @return A `ggplot2` aesthetic mapping object created by [ggplot2::aes()].
#' #'
#' #' @export
#' #' @examples
#' #' library(ggplot2)
#' #' library(dplyr)
#' #'
#' #' penguins |>
#' #'   count(species, sex) |>
#' #'   filter(!is.na(sex)) |>
#' #'   ggplot(aes(x = sex, y = n, fill = species)) +
#' #'   geom_col(position = "dodge") +
#' #'   geom_text(
#' #'     aes(label = n, !!!aes_contrast_fill()),
#' #'     position = position_dodge(width = 0.9),
#' #'     vjust = 1.33
#' #'   )
#' aes_contrast_fill <- function(dark = NULL, light = NULL, ...) {
#'   defaults <- .contrast_defaults(dark = dark, light = light)
#'   dark <- defaults$dark
#'   light <- defaults$light
#'
#'   ggplot2::aes(
#'     colour = ggplot2::after_scale(
#'       .get_contrast(col = .data$fill, dark = dark, light = light)
#'     )
#'   )
#' }
#'
#' # internal helpers ---------------------------------------------------------
#'
#' #' Get a dark/light colour for contrast
#' #'
#' #' @description Get a dark/light colour based on contrast.
#' #'
#' #' @param ... Unused. Included to support a trailing comma.
#' #' @param col A vector of colours from which to determine a contrast vector of
#' #'   light/dark colours.
#' #' @param dark A dark colour. If NULL, derived from theme text or panel background.
#' #' @param light A light colour. If NULL, derived from theme text or panel background.
#' #'
#' #' @return A character vector of colours, the same length as the `col` vector,
#' #'   containing either the dark or light colour determined for contrast.
#' #'
#' #' @noRd
#' .get_contrast <- function(..., col, dark = NULL, light = NULL) {
#'   defaults <- .contrast_defaults(dark = dark, light = light)
#'   dark <- defaults$dark
#'   light <- defaults$light
#'
#'   is_dark <- .is_col_dark(col)
#'
#'   out <- rep_len(dark, length(col))
#'   light_vals <- rep_len(light, length(col))
#'   out[is_dark] <- light_vals[is_dark]
#'
#'   out
#' }
#'
#' .contrast_defaults <- function(dark = NULL, light = NULL) {
#'   if (!rlang::is_null(dark) && !rlang::is_null(light)) {
#'     return(list(dark = dark, light = light))
#'   }
#'
#'   current_theme <- ggplot2::get_theme()
#'
#'   theme_text <- .first_theme_colour(
#'     current_theme,
#'     c(
#'       "axis.text.x.bottom",
#'       "axis.text.x.top",
#'       "axis.text.y.left",
#'       "axis.text.y.right",
#'       "axis.text.x",
#'       "axis.text.y",
#'       "axis.text",
#'       "text"
#'     )
#'   )
#'
#'   if (is.null(theme_text)) {
#'     theme_text <- "black"
#'   }
#'
#'   theme_panel <- .first_theme_fill(
#'     current_theme,
#'     c(
#'       "panel.background",
#'       "plot.background"
#'     )
#'   )
#'
#'   if (is.null(theme_panel)) {
#'     theme_panel <- "white"
#'   }
#'
#'   if (.is_col_dark(theme_text)) {
#'     list(
#'       dark = if (is.null(dark)) theme_text else dark,
#'       light = if (is.null(light)) theme_panel else light
#'     )
#'   } else {
#'     list(
#'       dark = if (is.null(dark)) theme_panel else dark,
#'       light = if (is.null(light)) theme_text else light
#'     )
#'   }
#' }
#'
#' # utils -------------------------------------------------------------------
#'
#' .first_theme_colour <- function(theme, elements) {
#'   for (element in elements) {
#'     value <- .theme_colour(theme, element)
#'     if (!is.null(value)) {
#'       return(value)
#'     }
#'   }
#'
#'   NULL
#' }
#'
#' .first_theme_fill <- function(theme, elements) {
#'   for (element in elements) {
#'     value <- .theme_fill(theme, element)
#'     if (!is.null(value)) {
#'       return(value)
#'     }
#'   }
#'
#'   NULL
#' }
#'
#' .theme_colour <- function(theme, element) {
#'   el <- tryCatch(
#'     ggplot2::calc_element(element, theme),
#'     error = function(...) NULL
#'   )
#'
#'   if (is.null(el)) {
#'     return(NULL)
#'   }
#'
#'   value <- el$colour
#'
#'   if (is.null(value)) {
#'     return(NULL)
#'   }
#'
#'   value
#' }
#'
#' .theme_fill <- function(theme, element) {
#'   el <- tryCatch(
#'     ggplot2::calc_element(element, theme),
#'     error = function(...) NULL
#'   )
#'
#'   if (is.null(el)) {
#'     return(NULL)
#'   }
#'
#'   value <- el$fill
#'
#'   if (is.null(value)) {
#'     return(NULL)
#'   }
#'
#'   value
#' }
#'
#' #' Check if a colour is dark
#' #'
#' #' @description
#' #' Determines whether a colour is dark by examining its luminance value.
#' #'
#' #' @param col A colour value. Can be a hex code, colour name, or any format
#' #'   accepted by farver. If NULL, returns FALSE.
#' #'
#' #' @return TRUE if dark (luminance <= 50) and FALSE otherwise.
#' #'
#' #' @noRd
#' .is_col_dark <- function(col) {
#'   if (rlang::is_null(col) || length(col) == 0) {
#'     return(FALSE)
#'   }
#'
#'   col_luminance <- farver::get_channel(
#'     colour = col,
#'     channel = "l",
#'     space = "hcl"
#'   )
#'
#'   col_luminance <= 50
#' }
#'
#' # aes_contrast_panel -----------------------------------------------------
#'
#' #' Aesthetic mapping for contrasting colour on panel background
#' #'
#' #' @description
#' #' `aes_contrast_panel()` generates an aesthetic mapping for `colour` that
#' #' automatically evaluates to a contrasting dark or light shade depending on
#' #' the underlying panel background fill, using [ggplot2::after_scale()].
#' #'
#' #' Can be passed directly into [ggplot2::aes()] or spliced into layer
#' #' mappings using [rlang::!!!].
#' #'
#' #' @param dark A dark colour string or hex value. If `NULL`, defaults to
#' #'   the primary dark text colour.
#' #' @param light A light colour string or hex value. If `NULL`, defaults to
#' #'   the primary light text colour.
#' #' @param ... Unused. Included to support trailing commas.
#' #'
#' #' @return A `ggplot2` aesthetic mapping object created by [ggplot2::aes()].
#' #'
#' #' @export
#' #' @examples
#' #' library(ggplot2)
#' #' library(dplyr)
#' #'
#' #' mpg |>
#' #'   count(class) |>
#' #'   ggplot(aes(x = class, y = n)) +
#' #'   geom_col() +
#' #'   geom_text(aes(y = n + 2, label = n, !!!aes_contrast_panel()), vjust = 0)
#' aes_contrast_panel <- function(dark = NULL, light = NULL, ...) {
#'   ggplot2::aes(
#'     colour = ggplot2::after_scale({
#'       panel_fill <- .first_theme_fill(
#'         ggplot2::get_theme(),
#'         c("panel.background", "plot.background")
#'       ) %||% "white"
#'
#'       .get_contrast(col = panel_fill, dark = dark, light = light)
#'     })
#'   )
#' }
