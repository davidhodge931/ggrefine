
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggrefine <a href="https://davidhodge931.github.io/ggrefine/"><img src="man/figures/logo.png" align="right" height="139" alt="ggrefine website" /></a>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/ggrefine)](https://CRAN.R-project.org/package=ggrefine)
<!-- badges: end -->

The objective of ggrefine is to provide some pretty ggplot2 complete
themes, and refine functions to tweak these easily based on the
particulars of a plot.

## Installation

Install from CRAN, or development version from
[GitHub](https://github.com/).

``` r
install.packages("ggrefine") 
pak::pak("davidhodge931/ggrefine")
```

## Theme

The themes are built to work with the refine functions - and can be
customised easily. The `theme_greyer` function differs from the other
two in that the `panel_grid_colour` by default is derived by applying a
multiply blend on the `panel_background_fill`.

``` r
library(ggplot2)
library(ggrefine)

p_light <- mpg |>
  ggplot(aes(x = hwy)) +
  geom_histogram(
    stat = "bin", shape = 21,
    colour = blends::multiply("#357BA2FF")
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05)))

p_dark <- mpg |>
  ggplot(aes(x = hwy)) +
  geom_histogram(
    stat = "bin", shape = 21,
    colour = blends::screen("#357BA2FF")
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05)))

p_light  <- p_light + theme_lighter() + labs(title = "theme_lighter")
p_dark  <- p_dark  + theme_darker() + labs(title = "theme_darker")
p_grey <- p_light + theme_greyer() + labs(title = 'theme_greyer')
p_oat <- p_light + theme_greyer(
  panel_background_fill = flexoki::flexoki$base["base50"],)  +
  labs(subtitle = "panel_background_fill = flexoki::flexoki$base['base50'],")

patchwork::wrap_plots(
  p_light,
  p_dark,
  p_grey,
  p_oat
)
```

<img src="man/figures/README-example-1.png" alt="" width="100%" />

## Refine

The `refine_*` functions adjust gridlines and axis elements based on
axis types (`x_type` and `y_type`), which default to `"continuous"`.

``` r
set_theme(new = theme_greyer())

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

<img src="man/figures/README-unnamed-chunk-2-1.png" alt="" width="100%" />
