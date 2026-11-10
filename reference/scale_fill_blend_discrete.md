# Scale fill, and derive colour by blending (discrete)

Scales `fill` with a discrete scale, and derives `colour` as a blended
version of the resulting `fill`, via [`aes_blend()`](aes_blend.md).

## Usage

``` r
scale_fill_blend_discrete(..., blend = NULL)
```

## Arguments

- ...:

  Additional arguments passed on to
  [`ggplot2::scale_fill_discrete()`](https://ggplot2.tidyverse.org/reference/scale_colour_discrete.html).

- blend:

  A function that takes a colour vector and returns a blended colour
  vector.

## Value

A `list` of ggplot2 components (a mapping and a scale) that can be added
to a ggplot object.
