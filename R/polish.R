#' Modern theme polish
#'
#' Removes gridlines and axis line/tick elements from the non-focused dimension.
#' Also removes ticks on discrete axes.
#'
#' @param ... Additional arguments (currently unused)
#' @param focus Character. The primary axis of interest: "x" or "y". Gridlines
#'   and axis elements are removed from the opposite axis.
#' @param x_type Character. Type of x-axis: "continuous", "binned", or "discrete"
#' @param y_type Character. Type of y-axis: "continuous", "binned", or "discrete"
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' p1 <- palmerpenguins::penguins |>
#'   ggplot(aes(x = species, y = body_mass_g, colour = species, fill = species)) +
#'   geom_point(shape = 21) +
#'   scale_colour_discrete(palette = paletteblend::multiply(scales::pal_hue())) +
#'   theme_greyer()
#'
#' p2 <- palmerpenguins::penguins |>
#'   ggplot(aes(
#'     x = flipper_length_mm,
#'     y = body_mass_g,
#'     colour = species,
#'     fill = species
#'   )) +
#'   geom_point(shape = 21) +
#'   scale_colour_discrete(palette = paletteblend::multiply(scales::pal_hue())) +
#'   theme_greyer()
#'
#' p1 + polish_none(x_type = "discrete", y_type = "continuous")
#' p1 + polish_modern(x_type = "discrete", y_type = "continuous")
#' p1 + polish_science(x_type = "discrete", y_type = "continuous")
#' p1 + polish_void(x_type = "discrete", y_type = "continuous")
#'
#' p2 + polish_none(x_type = "continuous", y_type = "continuous")
#' p2 + polish_modern(x_type = "continuous", y_type = "continuous")
#' p2 + polish_science(x_type = "continuous", y_type = "continuous")
#' p2 + polish_void(x_type = "continuous", y_type = "continuous")
#'
polish_modern <- function(
    ...,
    focus = c("x", "y"),
    x_type = c("continuous", "binned", "discrete"),
    y_type = c("continuous", "binned", "discrete")
) {

  focus  <- match.arg(focus)
  x_type <- match.arg(x_type)
  y_type <- match.arg(y_type)

  theme <- ggplot2::theme()

  if (focus == "x") {
    theme <- theme +
      ggplot2::theme(
        axis.line.y.left = ggplot2::element_line(linetype = 0),
        axis.line.y.right = ggplot2::element_line(linetype = 0),
        axis.ticks.y.left = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.left = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.right = ggplot2::element_line(linetype = 0),
        panel.grid.major.x = ggplot2::element_line(linetype = 0),
        panel.grid.minor.x = ggplot2::element_line(linetype = 0)
      )
  }
  if (focus == "y") {
    theme <- theme +
      ggplot2::theme(
        axis.line.x.bottom = ggplot2::element_line(linetype = 0),
        axis.line.x.top = ggplot2::element_line(linetype = 0),
        axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.top = ggplot2::element_line(linetype = 0),
        panel.grid.major.y = ggplot2::element_line(linetype = 0),
        panel.grid.minor.y = ggplot2::element_line(linetype = 0)
      )
  }

  if (x_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top = ggplot2::element_line(linetype = 0),
      )
  }
  if (y_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.y.left = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
      )
  }

  return(theme)
}

#' Science polish
#'
#' Removes gridlines and ticks from discrete axes.
#'
#' @inheritParams polish_modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' p1 <- palmerpenguins::penguins |>
#'   ggplot(aes(x = species, y = body_mass_g, colour = species, fill = species)) +
#'   geom_point(shape = 21) +
#'   scale_colour_discrete(palette = paletteblend::multiply(scales::pal_hue())) +
#'   theme_greyer()
#'
#' p2 <- palmerpenguins::penguins |>
#'   ggplot(aes(
#'     x = flipper_length_mm,
#'     y = body_mass_g,
#'     colour = species,
#'     fill = species
#'   )) +
#'   geom_point(shape = 21) +
#'   scale_colour_discrete(palette = paletteblend::multiply(scales::pal_hue())) +
#'   theme_greyer()
#'
#' p1 + polish_none(x_type = "discrete", y_type = "continuous")
#' p1 + polish_modern(x_type = "discrete", y_type = "continuous")
#' p1 + polish_science(x_type = "discrete", y_type = "continuous")
#' p1 + polish_void(x_type = "discrete", y_type = "continuous")
#'
#' p2 + polish_none(x_type = "continuous", y_type = "continuous")
#' p2 + polish_modern(x_type = "continuous", y_type = "continuous")
#' p2 + polish_science(x_type = "continuous", y_type = "continuous")
#' p2 + polish_void(x_type = "continuous", y_type = "continuous")
#'
polish_science <- function(
    ...,
    focus = c("x", "y"),
    x_type = c("continuous", "binned", "discrete"),
    y_type = c("continuous", "binned", "discrete")
) {

  focus  <- match.arg(focus)
  x_type <- match.arg(x_type)
  y_type <- match.arg(y_type)

  theme <- ggplot2::theme()

  if (x_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top = ggplot2::element_line(linetype = 0),
        panel.grid.major.x = ggplot2::element_line(linetype = 0),
        panel.grid.minor.x = ggplot2::element_line(linetype = 0)
      )
  }

  if (y_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.y.left = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
        panel.grid.major.y = ggplot2::element_line(linetype = 0),
        panel.grid.minor.y = ggplot2::element_line(linetype = 0)
      )
  }

  return(theme)
}

#' Void polish
#'
#' Removes axes and gridlines.
#'
#' @inheritParams polish_modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' p1 <- palmerpenguins::penguins |>
#'   ggplot(aes(x = species, y = body_mass_g, colour = species, fill = species)) +
#'   geom_point(shape = 21) +
#'   scale_colour_discrete(palette = paletteblend::multiply(scales::pal_hue())) +
#'   theme_greyer()
#'
#' p2 <- palmerpenguins::penguins |>
#'   ggplot(aes(
#'     x = flipper_length_mm,
#'     y = body_mass_g,
#'     colour = species,
#'     fill = species
#'   )) +
#'   geom_point(shape = 21) +
#'   scale_colour_discrete(palette = paletteblend::multiply(scales::pal_hue())) +
#'   theme_greyer()
#'
#' p1 + polish_none(x_type = "discrete", y_type = "continuous")
#' p1 + polish_modern(x_type = "discrete", y_type = "continuous")
#' p1 + polish_science(x_type = "discrete", y_type = "continuous")
#' p1 + polish_void(x_type = "discrete", y_type = "continuous")
#'
#' p2 + polish_none(x_type = "continuous", y_type = "continuous")
#' p2 + polish_modern(x_type = "continuous", y_type = "continuous")
#' p2 + polish_science(x_type = "continuous", y_type = "continuous")
#' p2 + polish_void(x_type = "continuous", y_type = "continuous")
#'
polish_void <- function(
    ...,
    focus = c("x", "y"),
    x_type = c("continuous", "binned", "discrete"),
    y_type = c("continuous", "binned", "discrete")
) {

  focus  <- match.arg(focus)
  x_type <- match.arg(x_type)
  y_type <- match.arg(y_type)

  theme <- ggplot2::theme()

  theme <- theme +
    ggplot2::theme(
      axis.line.x.bottom = ggplot2::element_line(linetype = 0),
      axis.line.x.top = ggplot2::element_line(linetype = 0),
      axis.line.y.left = ggplot2::element_line(linetype = 0),
      axis.line.y.right = ggplot2::element_line(linetype = 0),
      axis.ticks.x.top = ggplot2::element_line(linetype = 0),
      axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
      axis.ticks.y.left = ggplot2::element_line(linetype = 0),
      axis.ticks.y.right = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.x.bottom = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.x.top = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.y.left = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.y.right = ggplot2::element_line(linetype = 0),

      axis.text.x.top = ggplot2::element_blank(),
      axis.text.x.bottom = ggplot2::element_blank(),
      axis.text.y.left = ggplot2::element_blank(),
      axis.text.y.right = ggplot2::element_blank(),

      axis.title.x.top = ggplot2::element_blank(),
      axis.title.x.bottom = ggplot2::element_blank(),
      axis.title.y.left = ggplot2::element_blank(),
      axis.title.y.right = ggplot2::element_blank(),

      panel.grid = ggplot2::element_line(linetype = 0),
      panel.grid.major = ggplot2::element_line(linetype = 0),
      panel.grid.minor = ggplot2::element_line(linetype = 0),
      panel.grid.major.x = ggplot2::element_line(linetype = 0),
      panel.grid.minor.x = ggplot2::element_line(linetype = 0),
      panel.grid.major.y = ggplot2::element_line(linetype = 0),
      panel.grid.minor.y = ggplot2::element_line(linetype = 0)
    )

  return(theme)
}

#' No polish
#'
#' Leaves the theme unchanged.
#'
#' @inheritParams polish_modern
#'
#' @return An empty ggplot2 theme object
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' p1 <- palmerpenguins::penguins |>
#'   ggplot(aes(x = species, y = body_mass_g, colour = species, fill = species)) +
#'   geom_point(shape = 21) +
#'   scale_colour_discrete(palette = paletteblend::multiply(scales::pal_hue())) +
#'   theme_greyer()
#'
#' p2 <- palmerpenguins::penguins |>
#'   ggplot(aes(
#'     x = flipper_length_mm,
#'     y = body_mass_g,
#'     colour = species,
#'     fill = species
#'   )) +
#'   geom_point(shape = 21) +
#'   scale_colour_discrete(palette = paletteblend::multiply(scales::pal_hue())) +
#'   theme_greyer()
#'
#' p1 + polish_none(x_type = "discrete", y_type = "continuous")
#' p1 + polish_modern(x_type = "discrete", y_type = "continuous")
#' p1 + polish_science(x_type = "discrete", y_type = "continuous")
#' p1 + polish_void(x_type = "discrete", y_type = "continuous")
#'
#' p2 + polish_none(x_type = "continuous", y_type = "continuous")
#' p2 + polish_modern(x_type = "continuous", y_type = "continuous")
#' p2 + polish_science(x_type = "continuous", y_type = "continuous")
#' p2 + polish_void(x_type = "continuous", y_type = "continuous")
#'
polish_none <- function(
    ...,
    focus = c("x", "y"),
    x_type = c("continuous", "binned", "discrete"),
    y_type = c("continuous", "binned", "discrete")
) {

  theme <- ggplot2::theme()

  return(theme)
}
