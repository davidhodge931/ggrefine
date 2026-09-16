# Scale fill, and derive colour by blending (binned)

Scales `fill` with a binned colour scale, and additionally maps `colour`
to a blended version of the resulting `fill`, via
[`aes_colourblend()`](aes_colourblend.md). The `colour` legend is
suppressed since `fill` already communicates the mapping.

## Usage

``` r
scale_fill_colourblend_binned(blend = NULL, ...)
```

## Arguments

- blend:

  A function that takes a colour vector and returns a blended colour
  vector.

- ...:

  Additional arguments passed on to
  [`ggplot2::scale_colour_binned()`](https://ggplot2.tidyverse.org/reference/scale_colour_continuous.html),
  and
  [`ggplot2::scale_fill_binned()`](https://ggplot2.tidyverse.org/reference/scale_colour_continuous.html).

## Value

A `list` of ggplot2 components (a mapping, a binned colour/fill scale,
and a guide) that can be added to a ggplot object.
