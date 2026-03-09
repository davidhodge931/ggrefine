#' Modern refine
#'
#' Removes gridlines and axis line/tick elements from the non-focused dimension.
#' Also removes ticks on discrete axes.
#'
#' @param x_type Character. Type of x-axis: "continuous", "binned", or "discrete".
#' @param y_type Character. Type of y-axis: "continuous", "binned", or "discrete".
#' @param focus Character. The primary axis of interest: "x" or "y". Gridlines
#'   and axis elements are removed from the opposite axis. If `NULL` (default),
#'   focus is inferred from `x_type` and `y_type`: discrete x with continuous/binned
#'   y gives `"x"`, continuous/binned x with discrete y gives `"y"`, otherwise `"x"`.
#' @param ... Additional arguments (currently unused).
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
#'   theme_silver()
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
#'   theme_silver()
#'
#' p1 + refine_none(x_type = "discrete", y_type = "continuous")
#' p1 + refine_modern(x_type = "discrete", y_type = "continuous")
#' p1 + refine_science(x_type = "discrete", y_type = "continuous")
#' p1 + refine_void(x_type = "discrete", y_type = "continuous")
#'
#' p2 + refine_none(x_type = "continuous", y_type = "continuous")
#' p2 + refine_modern(x_type = "continuous", y_type = "continuous")
#' p2 + refine_science(x_type = "continuous", y_type = "continuous")
#' p2 + refine_void(x_type = "continuous", y_type = "continuous")
#'
refine_modern <- function(
    x_type,
    y_type,
    focus = NULL,
    ...
) {
  x_type <- match.arg(x_type, c("continuous", "binned", "discrete"))
  y_type <- match.arg(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  focus <- match.arg(focus, c("x", "y"))

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

#' Science refine
#'
#' Removes gridlines and ticks from discrete axes.
#'
#' @inheritParams refine_modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @inherit refine_modern examples
#'
refine_science <- function(
    x_type,
    y_type,
    focus = NULL,
    ...
) {
  x_type <- match.arg(x_type, c("continuous", "binned", "discrete"))
  y_type <- match.arg(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  focus <- match.arg(focus, c("x", "y"))

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

#' Void refine
#'
#' Removes axes and gridlines.
#'
#' @inheritParams refine_modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @inherit refine_modern examples
#'
refine_void <- function(
    x_type,
    y_type,
    focus = NULL,
    ...
) {
  x_type <- match.arg(x_type, c("continuous", "binned", "discrete"))
  y_type <- match.arg(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  focus <- match.arg(focus, c("x", "y"))

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

#' No refine
#'
#' Leaves the theme unchanged.
#'
#' @inheritParams refine_modern
#'
#' @return An empty ggplot2 theme object
#' @export
#'
#' @inherit refine_modern examples
#'
refine_none <- function(
    x_type,
    y_type,
    focus = NULL,
    ...
) {
  x_type <- match.arg(x_type, c("continuous", "binned", "discrete"))
  y_type <- match.arg(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  focus <- match.arg(focus, c("x", "y"))

  return(ggplot2::theme())
}
