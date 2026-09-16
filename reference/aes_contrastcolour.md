# Derive a legible colour by contrasting against fill

Note: this sets `colour`, not `fill` — `fill` is the value it reads
from, `colour` is what it derives. Maps `colour` to a dark or light
shade chosen for contrast against the layer's `fill` aesthetic,
evaluated after scale training via
[`ggplot2::after_scale()`](https://ggplot2.tidyverse.org/reference/aes_eval.html).
Attaches no scale itself — sits downstream of whatever `fill` scale
you've already applied.

## Usage

``` r
aes_contrastcolour(dark = NULL, light = NULL, ...)
```

## Arguments

- dark:

  A dark colour string or hex value. If `NULL`, derived from the active
  theme.

- light:

  A light colour string or hex value. If `NULL`, derived from the active
  theme.

- ...:

  Unused. Included to support trailing commas.

## Value

A `ggplot2` mapping object (as returned by
[`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html)).
