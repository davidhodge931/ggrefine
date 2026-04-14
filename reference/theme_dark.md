# Darker theme

A complete theme for a dark panel background.

## Usage

``` r
theme_dark(
  ...,
  text_size = 10,
  text_family = "",
  text_colour = flexoki::flexoki$base["base200"],
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
  panel_background_fill = flexoki::flexoki$base["base950"],
  panel_grid_colour = "black",
  panel_grid_linetype = 1,
  panel_grid_linewidth = 1,
  panel_grid_minor_linetype = 1,
  panel_grid_minor_linewidth = 0.5,
  plot_background_fill = "black",
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

p_base_light <- mpg |>
  ggplot(aes(x = hwy)) +
  geom_histogram(
    stat = "bin", shape = 21,
    colour = blends::multiply("#357BA2FF")
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05)))
#> Warning: Ignoring unknown parameters: `shape`

p_base_dark <- mpg |>
  ggplot(aes(x = hwy)) +
  geom_histogram(
    stat = "bin", shape = 21,
    colour = blends::screen("#357BA2FF")
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05)))
#> Warning: Ignoring unknown parameters: `shape`

p_light  <- p_base_light + ggrefine::theme_light() + labs(title = "ggrefine::theme_light")
p_dark  <- p_base_dark  + ggrefine::theme_dark() + labs(title = "ggrefine::theme_dark")
p_grey <- p_base_light + ggrefine::theme_grey() + labs(title = "ggrefine::theme_grey")

patchwork::wrap_plots(
  p_light,
  p_dark,
  p_grey
)
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.

```
