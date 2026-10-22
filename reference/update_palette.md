# Update colour/fill palettes or fixed geom colour/fill

Modifies active theme settings for fixed, discrete, and continuous
palettes only for parameters explicitly provided by the user.

## Usage

``` r
update_palette(
  fixed = NULL,
  discrete = NULL,
  continuous = NULL,
  aesthetic = c("colour", "fill")
)
```

## Arguments

- fixed:

  Colour applied to geometric elements via
  [`element_geom()`](https://ggplot2.tidyverse.org/reference/element.html).
  Updates the aesthetics named in `aesthetic`.

- discrete:

  Palette specification (e.g.,
  [`scales::pal_hue()`](https://scales.r-lib.org/reference/pal_hue.html))
  for discrete scales (`palette.<aesthetic>.discrete`).

- continuous:

  Palette specification for continuous scales
  (`palette.<aesthetic>.continuous`).

- aesthetic:

  Which aesthetic(s) to update: `"colour"`, `"fill"`, or both (the
  default).

## Value

Invisibly returns the result of the
[`theme_update()`](https://ggplot2.tidyverse.org/reference/get_theme.html)
calls.

## Examples

``` r
if (FALSE) { # \dontrun{
# Update fixed geom colour and fill
update_palette(fixed = "steelblue")

# Update only the fill of fixed geoms
update_palette(fixed = "steelblue", aesthetic = "fill")

# Update discrete palette for colour only
update_palette(discrete = scales::pal_hue(), aesthetic = "colour")

# Update continuous palette for both colour and fill
update_palette(continuous = scales::pal_viridis())
} # }
```
