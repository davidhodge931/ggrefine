
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggrefine <a href="https://davidhodge931.github.io/ggrefine/"><img src="man/figures/logo.png" align="right" height="139" alt="ggrefine website" /></a>

<!-- badges: start -->

<!-- badges: end -->

The objective of ggrefine is to …

## Installation

Install from CRAN, or development version from
[GitHub](https://github.com/).

``` r
install.packages("ggrefine") 
pak::pak("davidhodge931/ggrefine")
```

## Example

ggrefine provides a set of complete ggplot2 themes and theme polish
functions. Themes control the overall look, while polish functions let
you selectively remove gridlines, axis lines, and ticks based on the
focus and type of each axis.

``` r
library(ggplot2)
library(ggrefine)
library(patchwork)

p <- mpg |>
  ggplot() +
  geom_histogram(aes(x = hwy),
                 fill = jumble::slate,
                 colour = paletteblend::multiply(jumble::slate)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05)))

p1 <- p + theme_lighter() + polish_modern()
p2 <- p + theme_greyer() + polish_modern()
p3 <- p + theme_beiger() + polish_modern()
p4 <- p + theme_darker() + polish_modern()

p1 + p2 + p3 + p4
```

<img src="man/figures/README-example-1.png" alt="" width="100%" />
