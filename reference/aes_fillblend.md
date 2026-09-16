# Blend colour into a derived fill mapping

Note: this sets `fill`, not `colour` — `colour` is the value it reads
from, `fill` is what it derives. Maps `fill` to a blended version of
`colour`, evaluated after scale training via
[`ggplot2::after_scale()`](https://ggplot2.tidyverse.org/reference/aes_eval.html).
Attaches no scale itself — use
[`scale_colour_fillblend_discrete()`](scale_colour_fillblend_discrete.md)
(or `_continuous`/`_binned`) for a ready-to-plot version that also
scales `colour`.

## Usage

``` r
aes_fillblend(blend = NULL)
```

## Arguments

- blend:

  A function that takes a colour vector and returns a blended colour
  vector.

## Value

A `ggplot2` mapping object (as returned by
[`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html)).
