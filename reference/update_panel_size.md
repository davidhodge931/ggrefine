# Update panel dimensions in the current ggplot theme

Modifies panel dimensions such as heights and widths by updating the
global theme settings.

## Usage

``` r
update_panel_size(heights = ggplot2::waiver(), widths = ggplot2::waiver())
```

## Arguments

- heights:

  A [`margin`](https://ggplot2.tidyverse.org/reference/element.html) or
  unit object specifying the panel heights (e.g.,
  `grid::unit(5, "cm")`).

- widths:

  A [`margin`](https://ggplot2.tidyverse.org/reference/element.html) or
  unit object specifying the panel widths (e.g., `grid::unit(5, "cm")`).

## Value

Invisibly returns the updated theme object.

## Examples

``` r
if (FALSE) { # \dontrun{
update_panel_size(
  heights = grid::unit(6, "cm"),
  widths = grid::unit(8, "cm")
)
} # }
```
