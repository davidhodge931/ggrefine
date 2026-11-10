# Update panel widths in the current ggplot theme

Sets the `panel.widths` element of the active theme via
[`ggplot2::theme_update()`](https://ggplot2.tidyverse.org/reference/get_theme.html).

## Usage

``` r
update_panel_widths(widths)
```

## Arguments

- widths:

  A [`grid::unit()`](https://rdrr.io/r/grid/unit.html) specifying the
  panel widths (e.g., `grid::unit(8, "cm")`). Use `NULL` to remove a
  previously set width.

## Value

The previous theme, invisibly (see
[`ggplot2::theme_update()`](https://ggplot2.tidyverse.org/reference/get_theme.html)).

## Examples

``` r
if (FALSE) { # \dontrun{
update_panel_widths(grid::unit(8, "cm"))
} # }
```
