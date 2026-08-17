scale_fill_blend_discrete <- function(blend = \(x) blends::multiply(x), ...) {
  list(
    ggplot2::aes(colour = ggplot2::after_scale(blend(rlang::.data$fill))),
    ggplot2::scale_colour_discrete(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(colour = ggplot2::guide_none())
  )
}

scale_colour_blend_discrete <- function(blend = \(x) blends::screen(x), ...) {
  list(
    ggplot2::aes(fill = ggplot2::after_scale(blend(rlang::.data$colour))),
    ggplot2::scale_colour_discrete(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(fill = ggplot2::guide_none())
  )
}

scale_fill_blend_continuous <- function(blend = \(x) blends::multiply(x), ...) {
  list(
    ggplot2::aes(colour = ggplot2::after_scale(blend(rlang::.data$fill))),
    ggplot2::scale_colour_continuous(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(colour = ggplot2::guide_none())
  )
}

scale_colour_blend_continuous <- function(blend = \(x) blends::screen(x), ...) {
  list(
    ggplot2::aes(fill = ggplot2::after_scale(blend(rlang::.data$colour))),
    ggplot2::scale_colour_continuous(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(fill = ggplot2::guide_none())
  )
}

scale_fill_blend_binned <- function(blend = \(x) blends::multiply(x), ...) {
  list(
    ggplot2::aes(colour = ggplot2::after_scale(blend(rlang::.data$fill))),
    ggplot2::scale_colour_binned(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(colour = ggplot2::guide_none())
  )
}

scale_colour_blend_binned <- function(blend = \(x) blends::screen(x), ...) {
  list(
    ggplot2::aes(fill = ggplot2::after_scale(blend(rlang::.data$colour))),
    ggplot2::scale_colour_binned(..., aesthetics = c("colour", "fill")),
    ggplot2::guides(fill = ggplot2::guide_none())
  )
}
