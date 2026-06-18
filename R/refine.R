# ------------------------------------------------------------------------------
#' classic refine
#'
#' A refine with both axis lines/ticks.
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
classic <- function(
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

#' Timeless refine
#'
#' A variant of [ggrefine::classic()].
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
timeless <- function(
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
        panel.grid.major.x = ggplot2::element_line(linetype = 0),
        panel.grid.minor.x = ggplot2::element_line(linetype = 0)
      )
  }

  if (focus == "y") {
    theme <- theme +
      ggplot2::theme(
        panel.grid.major.y = ggplot2::element_line(linetype = 0),
        panel.grid.minor.y = ggplot2::element_line(linetype = 0)
      )
  }

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

#' journal refine
#'
#' A variant of [ggrefine::classic()].
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
journal <- function(
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
        axis.ticks.x.top = ggplot2::element_line(linetype = 0)
      )
  }

  if (y_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.y.left = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0)
      )
  }

  theme <- theme +
    ggplot2::theme(
      panel.grid.major.x = ggplot2::element_line(linetype = 0),
      panel.grid.minor.x = ggplot2::element_line(linetype = 0),
      panel.grid.major.y = ggplot2::element_line(linetype = 0),
      panel.grid.minor.y = ggplot2::element_line(linetype = 0)
    )

  return(theme)
}

# ------------------------------------------------------------------------------

#' drift refine
#'
#' A refine with one direction of axis line/ticks.
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
drift <- function(
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

  both_continuous <- x_type %in% c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

  theme <- ggplot2::theme()

  if (focus == "x") {
    theme <- theme +
      ggplot2::theme(
        axis.line.y.left             = ggplot2::element_line(linetype = 0),
        axis.line.y.right            = ggplot2::element_line(linetype = 0),
        axis.ticks.y.left            = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right           = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.left      = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.right     = ggplot2::element_line(linetype = 0),
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
        axis.line.x.bottom           = ggplot2::element_line(linetype = 0),
        axis.line.x.top              = ggplot2::element_line(linetype = 0),
        axis.ticks.x.bottom          = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top             = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.bottom    = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.top       = ggplot2::element_line(linetype = 0),
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
        axis.ticks.x.top    = ggplot2::element_line(linetype = 0),
      )
  }
  if (y_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.y.left  = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
      )
  }

  return(theme)
}

#' flow refine
#'
#' A variant of [ggrefine::drift()].
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
flow <- function(
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

  both_continuous <- x_type %in% c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

  theme <- ggplot2::theme()

  if (focus == "x") {
    theme <- theme +
      ggplot2::theme(
        axis.line.y.left             = ggplot2::element_line(linetype = 0),
        axis.line.y.right            = ggplot2::element_line(linetype = 0),
        axis.ticks.y.left            = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right           = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.left      = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.right     = ggplot2::element_line(linetype = 0),
        panel.grid.major.x = ggplot2::element_line(linetype = 0),
        panel.grid.minor.x = ggplot2::element_line(linetype = 0)
      )
  }

  if (focus == "y") {
    theme <- theme +
      ggplot2::theme(
        axis.line.x.bottom           = ggplot2::element_line(linetype = 0),
        axis.line.x.top              = ggplot2::element_line(linetype = 0),
        axis.ticks.x.bottom          = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top             = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.bottom    = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.top       = ggplot2::element_line(linetype = 0),
        panel.grid.major.y = ggplot2::element_line(linetype = 0),
        panel.grid.minor.y = ggplot2::element_line(linetype = 0)
      )
  }

  if (x_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top    = ggplot2::element_line(linetype = 0),
      )
  }
  if (y_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.y.left  = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
      )
  }

  return(theme)
}

#' still refine
#'
#' A variant of [ggrefine::drift()].
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
still <- function(
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

  both_continuous <- x_type %in% c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

  theme <- ggplot2::theme()

  if (focus == "x") {
    theme <- theme +
      ggplot2::theme(
        axis.line.y.left             = ggplot2::element_line(linetype = 0),
        axis.line.y.right            = ggplot2::element_line(linetype = 0),
        axis.ticks.y.left            = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right           = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.left      = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.y.right     = ggplot2::element_line(linetype = 0),
      )
  }

  if (focus == "y") {
    theme <- theme +
      ggplot2::theme(
        axis.line.x.bottom           = ggplot2::element_line(linetype = 0),
        axis.line.x.top              = ggplot2::element_line(linetype = 0),
        axis.ticks.x.bottom          = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top             = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.bottom    = ggplot2::element_line(linetype = 0),
        axis.minor.ticks.x.top       = ggplot2::element_line(linetype = 0),
      )
  }

  theme <- theme +
    ggplot2::theme(
      panel.grid.major.x = ggplot2::element_line(linetype = 0),
      panel.grid.minor.x = ggplot2::element_line(linetype = 0),
      panel.grid.major.y = ggplot2::element_line(linetype = 0),
      panel.grid.minor.y = ggplot2::element_line(linetype = 0)
    )

  if (x_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
        axis.ticks.x.top    = ggplot2::element_line(linetype = 0),
      )
  }
  if (y_type == "discrete") {
    theme <- theme +
      ggplot2::theme(
        axis.ticks.y.left  = ggplot2::element_line(linetype = 0),
        axis.ticks.y.right = ggplot2::element_line(linetype = 0),
      )
  }

  return(theme)
}

# ------------------------------------------------------------------------------

#' Minimal refine
#'
#' A minimal refine without axis lines and ticks.
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
minimal <- function(
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

  both_continuous <- x_type %in% c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

  theme <- ggplot2::theme()

  theme <- theme +
    ggplot2::theme(
      axis.line.y.left             = ggplot2::element_line(linetype = 0),
      axis.line.y.right            = ggplot2::element_line(linetype = 0),
      axis.ticks.y.left            = ggplot2::element_line(linetype = 0),
      axis.ticks.y.right           = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.y.left      = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.y.right     = ggplot2::element_line(linetype = 0),
      axis.line.x.bottom           = ggplot2::element_line(linetype = 0),
      axis.line.x.top              = ggplot2::element_line(linetype = 0),
      axis.ticks.x.bottom          = ggplot2::element_line(linetype = 0),
      axis.ticks.x.top             = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.x.bottom    = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.x.top       = ggplot2::element_line(linetype = 0),
    )

  if (focus == "x") {
    if (!both_continuous) {
      theme <- theme +
        ggplot2::theme(
          panel.grid.major.x = ggplot2::element_line(linetype = 0),
          panel.grid.minor.x = ggplot2::element_line(linetype = 0)
        )
    }
  }

  if (focus == "y") {
    if (!both_continuous) {
      theme <- theme +
        ggplot2::theme(
          panel.grid.major.y = ggplot2::element_line(linetype = 0),
          panel.grid.minor.y = ggplot2::element_line(linetype = 0)
        )
    }
  }

  return(theme)
}

#' Minuscule refine
#'
#' A variant of [ggrefine::minimal()].
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
minuscule <- function(
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

  both_continuous <- x_type %in% c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

  theme <- ggplot2::theme()

  theme <- theme +
    ggplot2::theme(
      axis.line.y.left             = ggplot2::element_line(linetype = 0),
      axis.line.y.right            = ggplot2::element_line(linetype = 0),
      axis.ticks.y.left            = ggplot2::element_line(linetype = 0),
      axis.ticks.y.right           = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.y.left      = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.y.right     = ggplot2::element_line(linetype = 0),
      axis.line.x.bottom           = ggplot2::element_line(linetype = 0),
      axis.line.x.top              = ggplot2::element_line(linetype = 0),
      axis.ticks.x.bottom          = ggplot2::element_line(linetype = 0),
      axis.ticks.x.top             = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.x.bottom    = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.x.top       = ggplot2::element_line(linetype = 0),
    )

  if (focus == "x") {
    theme <- theme +
      ggplot2::theme(
        panel.grid.major.x = ggplot2::element_line(linetype = 0),
        panel.grid.minor.x = ggplot2::element_line(linetype = 0)
      )
  }

  if (focus == "y") {
    theme <- theme +
      ggplot2::theme(
        panel.grid.major.y = ggplot2::element_line(linetype = 0),
        panel.grid.minor.y = ggplot2::element_line(linetype = 0)
      )
  }

  return(theme)
}

#' Minimum refine
#'
#' A variant of [ggrefine::minimal()].
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
minimum <- function(
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

  both_continuous <- x_type %in% c("continuous", "binned") &
    y_type %in% c("continuous", "binned")

  theme <- ggplot2::theme()

  theme <- theme +
    ggplot2::theme(
      axis.line.y.left             = ggplot2::element_line(linetype = 0),
      axis.line.y.right            = ggplot2::element_line(linetype = 0),
      axis.ticks.y.left            = ggplot2::element_line(linetype = 0),
      axis.ticks.y.right           = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.y.left      = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.y.right     = ggplot2::element_line(linetype = 0),
      axis.line.x.bottom           = ggplot2::element_line(linetype = 0),
      axis.line.x.top              = ggplot2::element_line(linetype = 0),
      axis.ticks.x.bottom          = ggplot2::element_line(linetype = 0),
      axis.ticks.x.top             = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.x.bottom    = ggplot2::element_line(linetype = 0),
      axis.minor.ticks.x.top       = ggplot2::element_line(linetype = 0),
      panel.grid.major.x = ggplot2::element_line(linetype = 0),
      panel.grid.minor.x = ggplot2::element_line(linetype = 0),
      panel.grid.major.y = ggplot2::element_line(linetype = 0),
      panel.grid.minor.y = ggplot2::element_line(linetype = 0)
    )

  return(theme)
}

# ------------------------------------------------------------------------------

#' Void refine
#'
#' Removes axes and gridlines.
#'
#' @inheritParams classic
#'
#' @return A ggplot2 theme object
#' @export
void <- function(
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

# ------------------------------------------------------------------------------

#' No refine
#'
#' Leaves the theme unchanged.
#'
#' @inheritParams classic
#'
#' @return An empty ggplot2 theme object
#' @export
none <- function(
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
