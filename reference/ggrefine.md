# Initialize a plot object with theme-aware default aesthetics

`ggrefine()` initializes a plot object using a specified plotting
function (defaults to
[`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html))
and pre-populates default identity `fill` and `colour` aesthetic
mappings derived from the active theme's `geom` defaults (falling back
to `"grey35"` and `"black"` respectively).

These default aesthetics act as lightweight fallbacks and are cleanly
overridden when explicit mappings are added in subsequent layers via
[`ggplot2::aes()`](https://ggplot2.tidyverse.org/reference/aes.html).

## Usage

``` r
ggrefine(data = NULL, initialise = ggplot2::ggplot)
```

## Arguments

- data:

  Default data frame or graph object to use for plot. If not specified,
  must be supplied in individual layers.

- initialise:

  Function or lambda used to initialize the plot object (e.g.,
  [ggplot2::ggplot](https://ggplot2.tidyverse.org/reference/ggplot.html),
  `\(x) ggplot2::ggplot(x)`, or
  `\(x) ggraph::ggraph(x, layout = "kk")`). Defaults to
  [`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html).

## Value

A plot object initialized with default aesthetic mappings.

## Examples

``` r
library(ggplot2)
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union

set_theme(ggrefine::theme_lights())

mpg |>
  count(class) |>
  ggrefine() +
  aes(x = class, y = n, fill = class) +
  geom_col() +
  scale_fill_blend_discrete()
#> Error in scale_fill_blend_discrete(): could not find function "scale_fill_blend_discrete"
```
