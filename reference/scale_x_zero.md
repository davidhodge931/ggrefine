# Set continuous x-axis minimum flush to zero

A convenience wrapper around
[`ggplot2::scale_x_continuous()`](https://ggplot2.tidyverse.org/reference/scale_continuous.html)
that sets the lower limit of the x-axis strictly to zero with no padding
by default, while allowing full customization of scale parameters.

## Usage

``` r
scale_x_zero(expand = ggplot2::expansion(c(0, 0.05)), limits = c(0, NA), ...)
```

## Arguments

- expand:

  Padding multiplier/addend vector. Defaults to `expansion(c(0, 0.05))`.

- limits:

  Axis limits. Defaults to `c(0, NA)` to force the lower bound to zero.

- ...:

  Additional arguments passed on to
  [`ggplot2::scale_x_continuous()`](https://ggplot2.tidyverse.org/reference/scale_continuous.html).

## Value

A `ScaleContinuousPosition` object.
