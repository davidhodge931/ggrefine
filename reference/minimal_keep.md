# Minimal keep refine

Removes all axis lines, ticks, and minor ticks. Panel gridlines are left
unchanged.

## Usage

``` r
minimal_keep(..., discrete = "none", focus = NULL)
```

## Arguments

- ...:

  Reserved for future extensions. Placed first so later arguments must
  be named, and to support trailing commas in calls.

- discrete:

  Character scalar describing which axes should be treated as discrete
  for refinement purposes: `"none"`, `"x"`, `"y"`, or `"both"`.

- focus:

  Character. The primary axis of interest: `"x"` or `"y"`. This affects
  grid modes such as `*_drift()` and `*_flow()`. If `NULL` (default),
  focus is inferred from `discrete`: `"x"` gives `"x"`, `"y"` gives
  `"y"`, otherwise `"x"`.

## Value

A ggplot2 theme object
