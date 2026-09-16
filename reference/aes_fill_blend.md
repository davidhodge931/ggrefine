# Blend fill into a derived colour mapping

Note: this sets `colour`, not `fill` — `fill` is the value it reads
from, `colour` is what it derives. Maps `colour` to a blended version of
`fill`, evaluated after scale training via
[`ggplot2::after_scale()`](https://ggplot2.tidyverse.org/reference/aes_eval.html).
Attaches no scale itself — use
[`scale_fill_blend_discrete()`](scale_fill_blend_discrete.md) (or
`_continuous`/`_binned`) for a ready-to-plot version that also scales
`fill`.

## Usage

``` r
aes_fill_blend(blend = NULL)
```

## Arguments

- blend:

  A function that takes a colour vector and returns a blended colour
  vector.

## Value

A `ggplot2` mapping object (as returned by
[`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html)).
