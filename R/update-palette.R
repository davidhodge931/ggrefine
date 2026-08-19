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
