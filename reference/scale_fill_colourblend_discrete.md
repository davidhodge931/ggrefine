# Scale fill, and derive colour by blending (discrete)

Scales `fill` with a discrete colour scale, and additionally maps
`colour` to a blended version of the resulting `fill`, via
[`aes_colourblend()`](aes_colourblend.md). The `colour` legend is
suppressed since `fill` already communicates the mapping.

## Usage

``` r
scale_fill_colourblend_discrete(blend = NULL, ...)
```

## Arguments

- blend:

  A function that takes a colour vector and returns a blended colour
  vector.

- ...:

  Additional arguments passed on to
  [`ggplot2::scale_colour_discrete()`](https://ggplot2.tidyverse.org/reference/scale_colour_discrete.html),
  and
  [`ggplot2::scale_fill_discrete()`](https://ggplot2.tidyverse.org/reference/scale_colour_discrete.html).

## Value

A `list` of ggplot2 components (a mapping, a discrete colour/fill scale,
and a guide) that can be added to a ggplot object.
