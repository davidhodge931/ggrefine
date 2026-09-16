# Scale colour, and derive fill by blending (binned)

Scales `colour` with a binned colour scale, and additionally maps `fill`
to a blended version of the resulting `colour`, via
[`aes_colour_blend()`](aes_colour_blend.md). The `fill` legend is
suppressed since `colour` already communicates the mapping.

## Usage

``` r
scale_colour_blend_binned(blend = NULL, ...)
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
