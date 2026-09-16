# Scale colour, and derive fill by blending (continuous)

Scales `colour` with a continuous colour scale, and additionally maps
`fill` to a blended version of the resulting `colour`, via
[`aes_colour_blend()`](aes_colour_blend.md). The `fill` legend is
suppressed since `colour` already communicates the mapping.

## Usage

``` r
scale_colour_blend_continuous(blend = NULL, ...)
```

## Arguments

- blend:

  A function that takes a colour vector and returns a blended colour
  vector.

- ...:

  Additional arguments passed on to
  [`ggplot2::scale_colour_continuous()`](https://ggplot2.tidyverse.org/reference/scale_colour_continuous.html),
  and
  [`ggplot2::scale_fill_continuous()`](https://ggplot2.tidyverse.org/reference/scale_colour_continuous.html).

## Value

A `list` of ggplot2 components (a mapping, a continuous colour/fill
scale, and a guide) that can be added to a ggplot object.
