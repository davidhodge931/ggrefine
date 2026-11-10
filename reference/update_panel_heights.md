# Update panel heights in the current ggplot theme

Sets the `panel.heights` element of the active theme via
[`ggplot2::theme_update()`](https://ggplot2.tidyverse.org/reference/get_theme.html).

## Usage

``` r
update_panel_heights(heights)
```

## Arguments

- heights:

  A [`grid::unit()`](https://rdrr.io/r/grid/unit.html) specifying the
  panel heights (e.g., `grid::unit(5, "cm")`). Use `NULL` to remove a
  previously set height.

## Value

The previous theme, invisibly (see
[`ggplot2::theme_update()`](https://ggplot2.tidyverse.org/reference/get_theme.html)).

## Examples

``` r
if (FALSE) { # \dontrun{
update_panel_heights(grid::unit(6, "cm"))
} # }
```
