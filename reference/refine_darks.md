# refine_darks (internal, not exported)

Builds the colour-only, incomplete
[`theme()`](https://ggplot2.tidyverse.org/reference/theme.html) elements
used by [`update_darks()`](update_darks.md). Not exported (no `@export`
tag); documented with `@keywords internal` so that
`@inheritParams refine_lights` resolves on the public `update_*()`
functions.

## Usage

``` r
refine_darks(
  ...,
  text_colour = "#CECDC3",
  title_colour = NULL,
  subtitle_colour = NULL,
  caption_colour = NULL,
  axis_line_colour = NULL,
  axis_ticks_colour = NULL,
  legend_axis_line_colour = NULL,
  legend_background_fill = NULL,
  legend_key_fill = NULL,
  legend_ticks_colour = NULL,
  panel_background_fill = "#282726",
  panel_grid_colour = "#100F0F",
  plot_background_fill = "#100F0F"
)
```

## Arguments

- ...:

  Require named arguments (and support trailing commas).

- text_colour:

  The base colour of the text theme element.

- title_colour:

  The colour of the `plot.title` theme element. Defaults to
  `text_colour`.

- subtitle_colour:

  The colour of the `plot.subtitle` theme element. Defaults to
  `text_colour`.

- caption_colour:

  The colour of the `plot.caption` theme element. Defaults to
  `text_colour`.

- axis_line_colour:

  The colour of the axis.line theme element. Defaults to `text_colour`.

- axis_ticks_colour:

  The colour of the axis.ticks theme element. Defaults to
  `axis_line_colour`.

- legend_axis_line_colour:

  The colour of the legend.axis.line theme element. Defaults to
  `plot_background_fill`.

- legend_background_fill:

  The fill (and colour) of the `legend.background` theme element.
  Defaults to `plot_background_fill`.

- legend_key_fill:

  The fill (and colour) of the legend.key theme element. Defaults to
  `plot_background_fill`.

- legend_ticks_colour:

  The colour of the legend.ticks theme element. Defaults to
  `legend_axis_line_colour`.

- panel_background_fill:

  The fill (and colour) of the panel.background theme element.

- panel_grid_colour:

  The colour of the panel.grid theme element.

- plot_background_fill:

  The fill (and colour) of the plot.background theme element.

## Value

An incomplete ggplot theme, intended to be added to an existing theme.
