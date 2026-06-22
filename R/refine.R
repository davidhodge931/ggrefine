#' # ------------------------------------------------------------------------------
#' # Internal helpers
#' # ------------------------------------------------------------------------------
#'
#' .infer_focus <- function(x_type, y_type) {
#'   if (x_type == "discrete" && y_type %in% c("continuous", "binned")) {
#'     "x"
#'   } else if (x_type %in% c("continuous", "binned") && y_type == "discrete") {
#'     "y"
#'   } else {
#'     "x"
#'   }
#' }
#'
#' .validate_refine_args <- function(x_type, y_type, focus) {
#'   x_type <- rlang::arg_match(x_type, c("continuous", "binned", "discrete"))
#'   y_type <- rlang::arg_match(y_type, c("continuous", "binned", "discrete"))
#'
#'   if (is.null(focus)) {
#'     focus <- .infer_focus(x_type, y_type)
#'   }
#'
#'   focus <- rlang::arg_match(focus, c("x", "y"))
#'
#'   list(
#'     x_type = x_type,
#'     y_type = y_type,
#'     focus = focus
#'   )
#' }
#'
#' .is_continuousish <- function(axis_type) {
#'   axis_type %in% c("continuous", "binned")
#' }
#'
#' # ------------------------------------------------------------------------------
#' # Theme fragments
#' # ------------------------------------------------------------------------------
#'
#' .remove_x_grid <- function() {
#'   ggplot2::theme(
#'     panel.grid.major.x = ggplot2::element_line(linetype = 0),
#'     panel.grid.minor.x = ggplot2::element_line(linetype = 0)
#'   )
#' }
#'
#' .remove_y_grid <- function() {
#'   ggplot2::theme(
#'     panel.grid.major.y = ggplot2::element_line(linetype = 0),
#'     panel.grid.minor.y = ggplot2::element_line(linetype = 0)
#'   )
#' }
#'
#' .remove_all_grids <- function() {
#'   ggplot2::theme(
#'     panel.grid.major.x = ggplot2::element_line(linetype = 0),
#'     panel.grid.minor.x = ggplot2::element_line(linetype = 0),
#'     panel.grid.major.y = ggplot2::element_line(linetype = 0),
#'     panel.grid.minor.y = ggplot2::element_line(linetype = 0)
#'   )
#' }
#'
#' .remove_x_ticks <- function() {
#'   ggplot2::theme(
#'     axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
#'     axis.ticks.x.top = ggplot2::element_line(linetype = 0)
#'   )
#' }
#'
#' .remove_y_ticks <- function() {
#'   ggplot2::theme(
#'     axis.ticks.y.left = ggplot2::element_line(linetype = 0),
#'     axis.ticks.y.right = ggplot2::element_line(linetype = 0)
#'   )
#' }
#'
#' .remove_x_axis <- function() {
#'   ggplot2::theme(
#'     axis.line.x.bottom = ggplot2::element_line(linetype = 0),
#'     axis.line.x.top = ggplot2::element_line(linetype = 0),
#'     axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
#'     axis.ticks.x.top = ggplot2::element_line(linetype = 0),
#'     axis.minor.ticks.x.bottom = ggplot2::element_line(linetype = 0),
#'     axis.minor.ticks.x.top = ggplot2::element_line(linetype = 0)
#'   )
#' }
#'
#' .remove_y_axis <- function() {
#'   ggplot2::theme(
#'     axis.line.y.left = ggplot2::element_line(linetype = 0),
#'     axis.line.y.right = ggplot2::element_line(linetype = 0),
#'     axis.ticks.y.left = ggplot2::element_line(linetype = 0),
#'     axis.ticks.y.right = ggplot2::element_line(linetype = 0),
#'     axis.minor.ticks.y.left = ggplot2::element_line(linetype = 0),
#'     axis.minor.ticks.y.right = ggplot2::element_line(linetype = 0)
#'   )
#' }
#'
#' .remove_all_axes <- function() {
#'   ggplot2::theme(
#'     axis.line.x.bottom = ggplot2::element_line(linetype = 0),
#'     axis.line.x.top = ggplot2::element_line(linetype = 0),
#'     axis.line.y.left = ggplot2::element_line(linetype = 0),
#'     axis.line.y.right = ggplot2::element_line(linetype = 0),
#'     axis.ticks.x.bottom = ggplot2::element_line(linetype = 0),
#'     axis.ticks.x.top = ggplot2::element_line(linetype = 0),
#'     axis.ticks.y.left = ggplot2::element_line(linetype = 0),
#'     axis.ticks.y.right = ggplot2::element_line(linetype = 0),
#'     axis.minor.ticks.x.bottom = ggplot2::element_line(linetype = 0),
#'     axis.minor.ticks.x.top = ggplot2::element_line(linetype = 0),
#'     axis.minor.ticks.y.left = ggplot2::element_line(linetype = 0),
#'     axis.minor.ticks.y.right = ggplot2::element_line(linetype = 0)
#'   )
#' }
#'
#' .remove_axis_text_titles <- function() {
#'   ggplot2::theme(
#'     axis.text.x.top = ggplot2::element_blank(),
#'     axis.text.x.bottom = ggplot2::element_blank(),
#'     axis.text.y.left = ggplot2::element_blank(),
#'     axis.text.y.right = ggplot2::element_blank(),
#'     axis.title.x.top = ggplot2::element_blank(),
#'     axis.title.x.bottom = ggplot2::element_blank(),
#'     axis.title.y.left = ggplot2::element_blank(),
#'     axis.title.y.right = ggplot2::element_blank()
#'   )
#' }
#'
#' # ------------------------------------------------------------------------------
#' # Axis policies (prefixes)
#' # ------------------------------------------------------------------------------
#'
#' .apply_axis_policy <- function(theme, axis_mode, x_type, y_type, focus) {
#'   axis_mode <- rlang::arg_match(axis_mode, c("classic", "modern", "minimal", "void"))
#'
#'   if (axis_mode == "classic") {
#'     if (x_type == "discrete") {
#'       theme <- theme + .remove_x_ticks()
#'     }
#'
#'     if (y_type == "discrete") {
#'       theme <- theme + .remove_y_ticks()
#'     }
#'
#'     return(theme)
#'   }
#'
#'   if (axis_mode == "modern") {
#'     if (focus == "x") {
#'       theme <- theme + .remove_y_axis()
#'     }
#'
#'     if (focus == "y") {
#'       theme <- theme + .remove_x_axis()
#'     }
#'
#'     if (x_type == "discrete") {
#'       theme <- theme + .remove_x_ticks()
#'     }
#'
#'     if (y_type == "discrete") {
#'       theme <- theme + .remove_y_ticks()
#'     }
#'
#'     return(theme)
#'   }
#'
#'   if (axis_mode == "minimal") {
#'     theme <- theme + .remove_all_axes()
#'     return(theme)
#'   }
#'
#'   if (axis_mode == "void") {
#'     theme <- theme +
#'       .remove_all_axes() +
#'       .remove_axis_text_titles()
#'
#'     return(theme)
#'   }
#'
#'   theme
#' }
#'
#' # ------------------------------------------------------------------------------
#' # Grid policies (suffixes)
#' # ------------------------------------------------------------------------------
#'
#' .apply_grid_policy <- function(theme, grid_mode, x_type, y_type, focus) {
#'   grid_mode <- rlang::arg_match(grid_mode, c("keep", "drift", "flow", "still"))
#'
#'   both_continuous <- .is_continuousish(x_type) && .is_continuousish(y_type)
#'
#'   if (grid_mode == "keep") {
#'     return(theme)
#'   }
#'
#'   if (grid_mode == "drift") {
#'     if (!both_continuous) {
#'       if (focus == "x") {
#'         theme <- theme + .remove_x_grid()
#'       }
#'
#'       if (focus == "y") {
#'         theme <- theme + .remove_y_grid()
#'       }
#'     }
#'
#'     return(theme)
#'   }
#'
#'   if (grid_mode == "flow") {
#'     if (focus == "x") {
#'       theme <- theme + .remove_x_grid()
#'     }
#'
#'     if (focus == "y") {
#'       theme <- theme + .remove_y_grid()
#'     }
#'
#'     return(theme)
#'   }
#'
#'   if (grid_mode == "still") {
#'     theme <- theme + .remove_all_grids()
#'     return(theme)
#'   }
#'
#'   theme
#' }
#'
#' # ------------------------------------------------------------------------------
#' # Composition helper
#' # ------------------------------------------------------------------------------
#'
#' .compose_refine <- function(axis_mode, grid_mode, x_type, y_type, focus) {
#'   args <- .validate_refine_args(x_type, y_type, focus)
#'
#'   x_type <- args$x_type
#'   y_type <- args$y_type
#'   focus <- args$focus
#'
#'   theme <- ggplot2::theme()
#'
#'   theme <- .apply_axis_policy(
#'     theme = theme,
#'     axis_mode = axis_mode,
#'     x_type = x_type,
#'     y_type = y_type,
#'     focus = focus
#'   )
#'
#'   theme <- .apply_grid_policy(
#'     theme = theme,
#'     grid_mode = grid_mode,
#'     x_type = x_type,
#'     y_type = y_type,
#'     focus = focus
#'   )
#'
#'   theme
#' }
#'
#' # ------------------------------------------------------------------------------
#' # Classic family
#' # ------------------------------------------------------------------------------
#'
#' #' Classic keep refine
#' #'
#' #' Removes axis ticks on discrete axes and leaves gridlines unchanged.
#' #'
#' #' If `x_type` is `"discrete"`, x-axis ticks are removed.
#' #' If `y_type` is `"discrete"`, y-axis ticks are removed.
#' #'
#' #' @param ... Reserved for future extensions.
#' #' @param x_type Character. Type of x-axis: `"continuous"`, `"binned"`,
#' #'   or `"discrete"`.
#' #' @param y_type Character. Type of y-axis: `"continuous"`, `"binned"`,
#' #'   or `"discrete"`.
#' #' @param focus Character. The primary axis of interest: `"x"` or `"y"`.
#' #'   This affects grid modes such as `*_drift()` and `*_flow()`. If `NULL`
#' #'   (default), focus is inferred from `x_type` and `y_type`: discrete x with
#' #'   continuous/binned y gives `"x"`, continuous/binned x with discrete y
#' #'   gives `"y"`, otherwise `"x"`.
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' classic_keep <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("classic", "keep", x_type, y_type, focus)
#' }
#'
#' #' Classic drift refine
#' #'
#' #' Removes axis ticks on discrete axes. Removes gridlines on the focused axis
#' #' only when both axes are not continuous/binned.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' classic_drift <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("classic", "drift", x_type, y_type, focus)
#' }
#'
#' #' Classic flow refine
#' #'
#' #' Removes axis ticks on discrete axes and removes gridlines on the focused
#' #' axis.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' classic_flow <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("classic", "flow", x_type, y_type, focus)
#' }
#'
#' #' Classic still refine
#' #'
#' #' Removes axis ticks on discrete axes and removes all panel gridlines.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' classic_still <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("classic", "still", x_type, y_type, focus)
#' }
#'
#' # ------------------------------------------------------------------------------
#' # Modern family
#' # ------------------------------------------------------------------------------
#'
#' #' Modern keep refine
#' #'
#' #' Removes axis lines, ticks, and minor ticks from the non-focused axis.
#' #' Axis ticks on discrete axes are removed. Gridlines are left unchanged.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' modern_keep <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("modern", "keep", x_type, y_type, focus)
#' }
#'
#' #' Modern drift refine
#' #'
#' #' Removes axis lines, ticks, and minor ticks from the non-focused axis.
#' #' Axis ticks on discrete axes are removed. Removes gridlines on the focused
#' #' axis only when both axes are not continuous/binned.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' modern_drift <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("modern", "drift", x_type, y_type, focus)
#' }
#'
#' #' Modern flow refine
#' #'
#' #' Removes axis lines, ticks, and minor ticks from the non-focused axis.
#' #' Axis ticks on discrete axes are removed. Removes gridlines on the focused
#' #' axis.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' modern_flow <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("modern", "flow", x_type, y_type, focus)
#' }
#'
#' #' Modern still refine
#' #'
#' #' Removes axis lines, ticks, and minor ticks from the non-focused axis.
#' #' Axis ticks on discrete axes are removed. Removes all panel gridlines.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' modern_still <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("modern", "still", x_type, y_type, focus)
#' }
#'
#' # ------------------------------------------------------------------------------
#' # Minimal family
#' # ------------------------------------------------------------------------------
#'
#' #' Minimal keep refine
#' #'
#' #' Removes all axis lines, ticks, and minor ticks. Gridlines are left
#' #' unchanged.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' minimal_keep <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("minimal", "keep", x_type, y_type, focus)
#' }
#'
#' #' Minimal drift refine
#' #'
#' #' Removes all axis lines, ticks, and minor ticks. Removes gridlines on the
#' #' focused axis only when both axes are not continuous/binned.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' minimal_drift <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("minimal", "drift", x_type, y_type, focus)
#' }
#'
#' #' Minimal flow refine
#' #'
#' #' Removes all axis lines, ticks, and minor ticks. Removes gridlines on the
#' #' focused axis.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' minimal_flow <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("minimal", "flow", x_type, y_type, focus)
#' }
#'
#' #' Minimal still refine
#' #'
#' #' Removes all axis lines, ticks, and minor ticks. Removes all panel
#' #' gridlines.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' minimal_still <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("minimal", "still", x_type, y_type, focus)
#' }
#'
#' # ------------------------------------------------------------------------------
#' # Void family
#' # ------------------------------------------------------------------------------
#'
#' #' Void keep refine
#' #'
#' #' Removes all axis lines, ticks, and minor ticks, and removes all axis text
#' #' and axis titles. Gridlines are left unchanged.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' void_keep <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("void", "keep", x_type, y_type, focus)
#' }
#'
#' #' Void drift refine
#' #'
#' #' Removes all axis lines, ticks, and minor ticks, and removes all axis text
#' #' and axis titles. Removes gridlines on the focused axis only when both axes
#' #' are not continuous/binned.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' void_drift <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("void", "drift", x_type, y_type, focus)
#' }
#'
#' #' Void flow refine
#' #'
#' #' Removes all axis lines, ticks, and minor ticks, and removes all axis text
#' #' and axis titles. Removes gridlines on the focused axis.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' void_flow <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("void", "flow", x_type, y_type, focus)
#' }
#'
#' #' Void still refine
#' #'
#' #' Removes all axis lines, ticks, and minor ticks, and removes all axis text
#' #' and axis titles. Removes all panel gridlines.
#' #'
#' #' @inheritParams classic_keep
#' #'
#' #' @return A ggplot2 theme object
#' #' @export
#' void_still <- function(
#'     ...,
#'     x_type = "continuous",
#'     y_type = "continuous",
#'     focus = NULL,
#' ) {
#'   .compose_refine("void", "still", x_type, y_type, focus)
#' }
