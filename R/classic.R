#' classic refine
#'
#' Removes gridlines and ticks from discrete axes.
#'
#' @inheritParams modern
#'
#' @return A ggplot2 theme object
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' set_theme(new = theme_grey())
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
#'   p_continuous + ggrefine::classic() + labs(title = "ggrefine::classic"),
#'   p_discrete_x + ggrefine::classic(x_type = "discrete"),
#'   p_discrete_y + ggrefine::classic(y_type = "discrete"),
#'   p_continuous + ggrefine::modern() + labs(title = "ggrefine::modern"),
#'   p_discrete_x + ggrefine::modern(x_type = "discrete"),
#'   p_discrete_y + ggrefine::modern(y_type = "discrete"),
#'   p_continuous + ggrefine::hybrid() + labs(title = "ggrefine::hybrid"),
#'   p_discrete_x + ggrefine::hybrid(x_type = "discrete"),
#'   p_discrete_y + ggrefine::hybrid(y_type = "discrete"),
#'   p_continuous + ggrefine::void() + labs(title = "ggrefine::void"),
#'   p_discrete_x + ggrefine::void(x_type = "discrete"),
#'   p_discrete_y + ggrefine::void(y_type = "discrete"),
#'   p_continuous + ggrefine::none() + labs(title = "ggrefine::none"),
#'   p_discrete_x + ggrefine::none(x_type = "discrete"),
#'   p_discrete_y + ggrefine::none(y_type = "discrete"),
#'   ncol = 3
#' )
#'
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
