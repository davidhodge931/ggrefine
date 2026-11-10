# Derive an aesthetic by blending the other one

Maps `aesthetic` to a blended version of the *other* colour aesthetic
(`fill` when deriving `"colour"`, `colour` when deriving `"fill"`),
evaluated after scale training via
[`ggplot2::after_scale()`](https://ggplot2.tidyverse.org/reference/aes_eval.html).
Attaches no scale itself — use
[`scale_fill_blend_discrete()`](scale_fill_blend_discrete.md) (or
`_continuous`/`_binned`, or the `scale_colour_blend_*` equivalents) for
a ready-to-plot version. Requires the `ggrefine` function to be used
instead of
[`ggplot2::ggplot`](https://ggplot2.tidyverse.org/reference/ggplot.html)
to work where no source aesthetic is mapped.

## Usage

``` r
aes_blend(..., aesthetic = "colour", blend = NULL)
```

## Arguments

- ...:

  Unused. Included to require argument naming and support trailing
  commas.

- aesthetic:

  The aesthetic to derive, either `"colour"` (default, derived from
  `fill`) or `"fill"` (derived from `colour`).

- blend:

  A function that takes a colour vector and returns a blended colour
  vector. If `NULL`, a blend is chosen from the active theme's panel
  background.

## Value

A `ggplot2` mapping object (as returned by
[`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html)).
