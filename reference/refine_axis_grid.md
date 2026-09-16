# Refine plot axes and panel grid

A single entry point over the `axis_mode` x `grid_mode` combinations
previously exposed as sixteen separate `refine_*_*()` functions. Those
functions still exist internally (e.g. `.refine_modern_drift()`) and do
the actual work; this function just dispatches to the right one.

## Usage

``` r
refine_axis_grid(
  discrete,
  orientation = NULL,
  axis_mode = "modern",
  grid_mode = "drift"
)
```

## Arguments

- discrete:

  Character. Which axes should be treated as discrete for refinement
  purposes: `"none"`, `"x"`, `"y"`, or `"both"`. Required.

- orientation:

  Character. The primary axis of interest: `"x"` or `"y"`. Affects
  `grid_mode` values `"drift"` and `"flow"`. If `NULL` (default), it is
  inferred from `discrete`: `"y"` gives `"y"`, otherwise `"x"`.

- axis_mode:

  Character. One of `"classic"`, `"modern"`, `"minimal"`, `"void"`.
  Default `"modern"`.

- grid_mode:

  Character. One of `"keep"`, `"drift"`, `"flow"`, `"drop"`. Default
  `"drift"`.

## Value

A ggplot2 theme object.

## Details

`axis_mode` controls what happens to axis lines, ticks, text, and
titles:

- classic:

  Removes ticks on discrete axes only.

- modern:

  Like `classic`, plus removes the axis line and ticks on the
  non-orientation axis.

- minimal:

  Removes all axis lines and ticks, regardless of orientation or
  discreteness.

- void:

  Like `minimal`, plus removes all axis text and titles.

`grid_mode` controls what happens to panel gridlines:

- keep:

  Leaves panel gridlines unchanged.

- drift:

  Removes gridlines on the orientation axis, but only when at least one
  axis is discrete.

- flow:

  Removes gridlines on the orientation axis unconditionally.

- drop:

  Removes all panel gridlines.
