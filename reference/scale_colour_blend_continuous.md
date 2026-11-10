# Scale colour, and derive fill by blending (continuous)

Scales `colour` with a continuous scale, and derives `fill` as a blended
version of the resulting `colour`, via [`aes_blend()`](aes_blend.md).

## Usage

``` r
scale_colour_blend_continuous(..., blend = NULL)
```

## Arguments

- ...:

  Additional arguments passed on to
  [`ggplot2::scale_colour_continuous()`](https://ggplot2.tidyverse.org/reference/scale_colour_continuous.html).

- blend:

  A function that takes a colour vector and returns a blended colour
  vector.

## Value

A `list` of ggplot2 components (a mapping and a scale) that can be added
to a ggplot object.
