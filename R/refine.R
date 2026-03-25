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
#' set_theme(new = theme_stone())
#'
#' p_continuous <- mpg |>
#'   ggplot(aes(x = displ, y = hwy)) +
#'   geom_point(shape = 21, colour = blends::multiply("#357BA2FF"))
#'
#' p_discrete_x <- mpg |>
#'   ggplot(aes(x = drv, y = hwy)) +
#'   geom_jitter(shape = 21, colour = blends::multiply("#357BA2FF"))
#'
#' p_discrete_y <- mpg |>
#'   ggplot(aes(x = hwy, y = drv)) +
#'   geom_jitter(shape = 21, colour = blends::multiply("#357BA2FF"))
#'
#' patchwork::wrap_plots(
#'   p_continuous + refine_modern() + labs(title = "refine_modern"),
#'   p_discrete_x + refine_modern(x_type = "discrete"),
#'   p_discrete_y + refine_modern(y_type = "discrete"),
#'   p_continuous + refine_classic() + labs(title = "refine_classic"),
#'   p_discrete_x + refine_classic(x_type = "discrete"),
#'   p_discrete_y + refine_classic(y_type = "discrete"),
#'   p_continuous + refine_fusion() + labs(title = "refine_fusion"),
#'   p_discrete_x + refine_fusion(x_type = "discrete"),
#'   p_discrete_y + refine_fusion(y_type = "discrete"),
#'   p_continuous + refine_void() + labs(title = "refine_void"),
#'   p_discrete_x + refine_void(x_type = "discrete"),
#'   p_discrete_y + refine_void(y_type = "discrete"),
#'   p_continuous + refine_none() + labs(title = "refine_none"),
#'   p_discrete_x + refine_none(x_type = "discrete"),
#'   p_discrete_y + refine_none(y_type = "discrete"),
#'   ncol = 3
#' )
#'
refine_modern <- function(
  x_type = "continuous",
  y_type = "continuous",
  focus = NULL,
  ...
) {
  rlang::arg_match(x_type, c("continuous", "binned", "discrete"))
  rlang::arg_match(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  rlang::arg_match(focus, c("x", "y"))

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

#' classic refine
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
refine_classic <- function(
  x_type = "continuous",
  y_type = "continuous",
  focus = NULL,
  ...
) {
  rlang::arg_match(x_type, c("continuous", "binned", "discrete"))
  rlang::arg_match(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  rlang::arg_match(focus, c("x", "y"))

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

#' Fusion refine
#'
#' Similar to [ggrefine::refine_modern()], but keeps gridlines on both axes when both
#' are continuous or binned. A fusion between [ggrefine::refine_modern()] and
#' [ggrefine::refine_classic()].
#'
#' @inheritParams refine_modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @inherit refine_modern examples
#'
refine_fusion <- function(
  x_type = "continuous",
  y_type = "continuous",
  focus = NULL,
  ...
) {
  rlang::arg_match(x_type, c("continuous", "binned", "discrete"))
  rlang::arg_match(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  rlang::arg_match(focus, c("x", "y"))

  both_continuous <- x_type %in%
    c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

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
      )
    if (!both_continuous) {
      theme <- theme +
        ggplot2::theme(
          panel.grid.major.x = ggplot2::element_line(linetype = 0),
          panel.grid.minor.x = ggplot2::element_line(linetype = 0)
        )
    }
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
      )
    if (!both_continuous) {
      theme <- theme +
        ggplot2::theme(
          panel.grid.major.y = ggplot2::element_line(linetype = 0),
          panel.grid.minor.y = ggplot2::element_line(linetype = 0)
        )
    }
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
  x_type = "continuous",
  y_type = "continuous",
  focus = NULL,
  ...
) {
  rlang::arg_match(x_type, c("continuous", "binned", "discrete"))
  rlang::arg_match(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  rlang::arg_match(focus, c("x", "y"))

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
  x_type = "continuous",
  y_type = "continuous",
  focus = NULL,
  ...
) {
  rlang::arg_match(x_type, c("continuous", "binned", "discrete"))
  rlang::arg_match(y_type, c("continuous", "binned", "discrete"))

  if (is.null(focus)) {
    if (x_type == "discrete" & y_type %in% c("continuous", "binned")) {
      focus <- "x"
    } else if (x_type %in% c("continuous", "binned") & y_type == "discrete") {
      focus <- "y"
    } else {
      focus <- "x"
    }
  }

  rlang::arg_match(focus, c("x", "y"))

  return(ggplot2::theme())
}
