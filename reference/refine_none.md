# No refine

Leaves the theme unchanged.

## Usage

``` r
refine_none(x_type = "continuous", y_type = "continuous", focus = NULL, ...)
```

## Arguments

- x_type:

  Character. Type of x-axis: "continuous", "binned", or "discrete".

- y_type:

  Character. Type of y-axis: "continuous", "binned", or "discrete".

- focus:

  Character. The primary axis of interest: "x" or "y". Gridlines and
  axis elements are removed from the opposite axis. If `NULL` (default),
  focus is inferred from `x_type` and `y_type`: discrete x with
  continuous/binned y gives `"x"`, continuous/binned x with discrete y
  gives `"y"`, otherwise `"x"`.

- ...:

  Additional arguments (currently unused).

## Value

An empty ggplot2 theme object

## Examples

``` r
library(ggplot2)

set_theme(new = theme_stone())

p_continuous <- mpg |>
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(shape = 21, colour = blends::multiply("#357BA2FF"))

p_discrete_x <- mpg |>
  ggplot(aes(x = drv, y = hwy)) +
  geom_jitter(shape = 21, colour = blends::multiply("#357BA2FF"))

p_discrete_y <- mpg |>
  ggplot(aes(x = hwy, y = drv)) +
  geom_jitter(shape = 21, colour = blends::multiply("#357BA2FF"))

patchwork::wrap_plots(
  p_continuous + refine_modern() + labs(title = "refine_modern"),
  p_discrete_x + refine_modern(x_type = "discrete"),
  p_discrete_y + refine_modern(y_type = "discrete"),
  p_continuous + refine_classic() + labs(title = "refine_classic"),
  p_discrete_x + refine_classic(x_type = "discrete"),
  p_discrete_y + refine_classic(y_type = "discrete"),
  p_continuous + refine_fusion() + labs(title = "refine_fusion"),
  p_discrete_x + refine_fusion(x_type = "discrete"),
  p_discrete_y + refine_fusion(y_type = "discrete"),
  p_continuous + refine_void() + labs(title = "refine_void"),
  p_discrete_x + refine_void(x_type = "discrete"),
  p_discrete_y + refine_void(y_type = "discrete"),
  p_continuous + refine_none() + labs(title = "refine_none"),
  p_discrete_x + refine_none(x_type = "discrete"),
  p_discrete_y + refine_none(y_type = "discrete"),
  ncol = 3
)

```
