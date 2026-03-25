# Stone theme

A complete theme with a stone grey panel on a white plot background. The
panel grid colour is derived automatically by blending
`panel_background_fill` with itself using
[`blends::multiply()`](https://davidhodge931.github.io/blends/reference/multiply.html),
producing a subtly darker tone that stays harmonious with the panel
colour.

## Usage

``` r
theme_stone(
  ...,
  text_size = 10,
  text_family = "",
  text_colour = flexoki::flexoki$base["black"],
  legend_place = "right",
  legend_axis_line_colour = plot_background_fill,
  legend_axis_line_linewidth = axis_line_linewidth,
  legend_background_fill = plot_background_fill,
  legend_key_fill = plot_background_fill,
  legend_ticks_colour = legend_axis_line_colour,
  legend_ticks_linewidth = legend_axis_line_linewidth,
  legend_ticks_length = grid::unit(c(2.75, 0), "pt"),
  axis_line_colour = flexoki::flexoki$base["base600"],
  axis_line_linewidth = 0.25,
  axis_ticks_colour = axis_line_colour,
  axis_ticks_linewidth = axis_line_linewidth,
  axis_ticks_length = grid::unit(3.66, "pt"),
  panel_background_fill = "#EBEBEBFF",
  panel_grid_colour = blends::multiply(panel_background_fill),
  panel_grid_linetype = 1,
  panel_grid_linewidth = 1,
  panel_grid_minor_linetype = 1,
  panel_grid_minor_linewidth = 0.5,
  plot_background_fill = "white",
  geom_fill = "#357BA2FF",
  geom_colour = geom_fill,
  palette_fill_discrete = jumble::jumble,
  palette_colour_discrete = palette_fill_discrete,
  palette_fill_continuous = viridis::turbo(n = 256),
  palette_colour_continuous = palette_fill_continuous,
  panel_widths = NULL,
  panel_heights = NULL
)
```

## Arguments

- ...:

  Require named arguments (and support trailing commas).

- text_size:

  The base size of the text theme element. Defaults to 10.

- text_family:

  The base family of the text theme element. Defaults to "".

- text_colour:

  The base colour of the text theme element.

- legend_place:

  The place of the legend. Either "right", "top" or "bottom".

- legend_axis_line_colour:

  The colour of the legend.axis.line theme element.

- legend_axis_line_linewidth:

  The linewidth of the legend.axis.line theme element.

- legend_background_fill:

  The fill (and colour) of the legend.background theme element.

- legend_key_fill:

  The fill (and colour) of the legend.key theme element.

- legend_ticks_colour:

  The colour of the legend.ticks theme element.

- legend_ticks_linewidth:

  The linewidth of the legend.ticks theme element.

- legend_ticks_length:

  The legend.ticks.length theme element.

- axis_line_colour:

  The colour of the axis.line theme element.

- axis_line_linewidth:

  The linewidth of the axis.line theme element.

- axis_ticks_colour:

  The colour of the axis.ticks theme element.

- axis_ticks_linewidth:

  The linewidth of the axis.ticks theme element.

- axis_ticks_length:

  The length of the axis.ticks.length theme element.

- panel_background_fill:

  The fill (and colour) of the panel.background theme element.

- panel_grid_colour:

  The colour of the panel.grid theme element.

- panel_grid_linetype:

  The linetype of the panel.grid.major theme element.

- panel_grid_linewidth:

  The linewidth of the panel.grid.major theme element.

- panel_grid_minor_linetype:

  The linetype of the panel.grid.minor theme element.

- panel_grid_minor_linewidth:

  The linewidth of the panel.grid.minor theme element.

- plot_background_fill:

  The fill (and colour) of the plot.background theme element.

- geom_fill:

  The default fill colour of geom elements.

- geom_colour:

  The default border colour of geom elements. Defaults to `geom_fill`.

- palette_fill_discrete:

  The default discrete fill palette. A function or vector of colours.

- palette_colour_discrete:

  The default discrete colour palette. Defaults to
  `palette_fill_discrete`.

- palette_fill_continuous:

  The default continuous fill palette. A vector of colours.

- palette_colour_continuous:

  The default continuous colour palette. Defaults to
  `palette_fill_continuous`.

- panel_widths:

  The panel.widths theme element. A `unit` or unit vector setting the
  width of individual panels, or a single unit for the total panel area
  width. Overrides aspect ratio set by the theme, coord, or facets.
  Defaults to `NULL`.

- panel_heights:

  The panel.heights theme element. A `unit` or unit vector setting the
  height of individual panels, or a single unit for the total panel area
  height. Overrides aspect ratio set by the theme, coord, or facets.
  Defaults to `NULL`.

## Value

A ggplot theme.

## Examples

``` r
library(ggplot2)

p1 <- penguins |>
  ggplot(aes(x = species, y = body_mass, colour = species, fill = species)) +
  geom_jitter(shape = 21) +
  scale_colour_discrete(palette = blends::multiply(scales::pal_hue()))

# Default: flexoki base50 oat panel
p1 + theme_oat()
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_point()`).


# Cool grey panel
p1 + theme_oat(panel_background_fill = "#f2f2f2ff")
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_point()`).

```
