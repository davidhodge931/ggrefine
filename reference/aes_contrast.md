# Derive a legible aesthetic by contrasting against the other one

Maps `aesthetic` to a dark or light shade chosen for contrast against
the *other* colour aesthetic (`fill` when deriving `"colour"`, `colour`
when deriving `"fill"`), evaluated after scale training via
[`ggplot2::after_scale()`](https://ggplot2.tidyverse.org/reference/aes_eval.html).
Attaches no scale itself — sits downstream of whatever scale you've
already applied.

## Usage

``` r
aes_contrast(..., aesthetic = "colour", dark = NULL, light = NULL)
```

## Arguments

- ...:

  Unused. Included to require argument naming and support trailing
  commas.

- aesthetic:

  The aesthetic to derive, either `"colour"` (default, contrasted
  against `fill`) or `"fill"` (contrasted against `colour`).

- dark:

  A dark colour string or hex value. If `NULL`, derived from the active
  theme.

- light:

  A light colour string or hex value. If `NULL`, derived from the active
  theme.

## Value

A `ggplot2` mapping object (as returned by
[`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html)).
