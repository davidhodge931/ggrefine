#' Update Colour and Fill Palettes
#'
#' Modifies active theme settings for fixed, discrete, and continuous palettes
#' only for parameters explicitly provided by the user.
#'
#' @param fixed Color applied to geometric elements via \code{element_geom()}.
#'   Updates both `colour` and `fill`.
#' @param discrete Palette specification (e.g., \code{scales::pal_hue()}) for
#'   discrete scales (`palette.colour.discrete` and `palette.fill.discrete`).
#' @param continuous Palette specification for continuous scales
#'   (`palette.colour.continuous` and `palette.fill.continuous`).
#'
#' @return Invisibly returns the result of the \code{update_theme()} calls.
#' @export
#'
#' @examples
#' \dontrun{
#' # Update fixed geom colors
#' update_palette(fixed = "steelblue")
#'
#' # Update discrete palettes
#' update_palette(discrete = scales::pal_hue())
#'
#' # Update continuous palettes
#' update_palette(continuous = scales::pal_viridis())
#' }
update_palette <- function(fixed = NULL,
                           discrete = NULL,
                           continuous = NULL) {

  if (!is.null(fixed)) {
    ggplot2::update_theme(geom = ggplot2::element_geom(colour = fixed, fill = fixed))
  }

  if (!is.null(discrete)) {
    ggplot2::update_theme(
      palette.colour.discrete = discrete,
      palette.fill.discrete   = discrete
    )
  }

  if (!is.null(continuous)) {
    ggplot2::update_theme(
      palette.colour.continuous = continuous,
      palette.fill.continuous   = continuous
    )
  }
}

#' Update panel dimensions in the current ggplot theme
#'
#' Modifies panel dimensions such as height, width, and aspect ratio by updating
#' the global theme settings.
#'
#' @param height A \code{\link[ggplot2]{margin}} or unit object specifying the panel
#'   height (e.g., \code{grid::unit(5, "cm")}).
#' @param width A \code{\link[ggplot2]{margin}} or unit object specifying the panel
#'   width (e.g., \code{grid::unit(5, "cm")}).
#' @param aspect_ratio A numeric value specifying the ratio of panel height to
#'   width (\code{height / width}).
#'
#' @return Invisibly returns the updated theme object.
#' @export
#'
#' @examples
#' \dontrun{
#' update_panel_dimensions(
#'   height = grid::unit(6, "cm"),
#'   width = grid::unit(8, "cm"),
#'   aspect_ratio = 0.75
#' )
#' }
update_panel_dimensions <- function(height = NULL, width = NULL, aspect_ratio = NULL) {
  if (!rlang::is_null(height)) ggplot2::update_theme(panel.height = height)
  if (!rlang::is_null(width)) ggplot2::update_theme(panel.width = width)
  if (!rlang::is_null(aspect_ratio)) ggplot2::update_theme(aspect.ratio = aspect_ratio)
}
