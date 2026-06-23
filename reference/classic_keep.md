# Classic keep refine

Removes axis ticks on discrete axes and leaves panel gridlines
unchanged.

## Usage

``` r
classic_keep(..., discrete = "none", orientation = NULL)
```

## Arguments

- ...:

  Reserved for future extensions. Placed first so later arguments must
  be named, and to support trailing commas in calls.

- discrete:

  Character scalar describing which axes should be treated as discrete
  for refinement purposes: `"none"`, `"x"`, `"y"`, or `"both"`.

- orientation:

  Character. The primary axis of interest: `"x"` or `"y"`. This affects
  grid modes such as `*_drift()` and `*_flow()`. If `NULL` (default),
  orientation is inferred from `discrete`: `"y"` gives `"y"`, otherwise
  `"x"`.

## Value

A ggplot2 theme object
