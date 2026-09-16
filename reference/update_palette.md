# Update colour/fill palettes or fixed geom colour/fill

Modifies active theme settings for fixed, discrete, and continuous
palettes only for parameters explicitly provided by the user.

## Usage

``` r
update_palette(fixed = NULL, discrete = NULL, continuous = NULL)
```

## Arguments

- fixed:

  Colour applied to geometric elements via
  [`element_geom()`](https://ggplot2.tidyverse.org/reference/element.html).
  Updates both `colour` and `fill`.

- discrete:

  Palette specification (e.g.,
  [`scales::pal_hue()`](https://scales.r-lib.org/reference/pal_hue.html))
  for discrete scales (`palette.colour.discrete` and
  `palette.fill.discrete`).

- continuous:

  Palette specification for continuous scales
  (`palette.colour.continuous` and `palette.fill.continuous`).

## Value

Invisibly returns the result of the
[`theme_update()`](https://ggplot2.tidyverse.org/reference/get_theme.html)
calls.

## Examples

``` r
if (FALSE) { # \dontrun{
# Update fixed geom colour
update_palette(fixed = "steelblue")

# Update discrete palette
update_palette(discrete = scales::pal_hue())

# Update continuous palette
update_palette(continuous = scales::pal_viridis())
} # }
```
