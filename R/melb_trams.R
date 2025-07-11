#' Melbourne Trams Colour Palette
#'
#' Although the trams can be unreliable and the bane of our existence, the
#' aesthetically pleasing colour palette makes it all worth it.
#'
#' @param n Number of colours that you desire in your palette.
#' @param name Name of any specific colours or tram numbers that you want in your palette (optional).
#' @return Beautiful colour palette for any visualisation purposes.
#' @importFrom magrittr %>%
#' @importFrom grDevices col2rgb
#' @importFrom stats spline
#' @export
#' @author Dionne Argyropoulos
#'
melb_trams <- function(n,
                       name = NULL) {
  tram_colors <- c(
    the1 = "#b0bf30", # East Coburg to South Melbourne Beach
    the3 = "#8bcae1", # Melbourne University to East Malvern
    the5 = "#cf3f3a", # Melbourne University to Malvern
    the6 = "#175369", # Moreland to Glen Iris
    the11 = "#80bc97", # West Preston to Victora Harbour Docklands
    the12 = "#007d85", # Victoria Gardens to St Kilda (Fitzroy Street)
    the16 = "#fcd668", # Melbourne University to Kew
    the19 = "#814569", # North Coburg to Flinders Street Station
    the30 = "#464387", # St Vincent's Plaza to Marvel Stadium Docklands
    the35 = "#603625", # City Circle
    the48 = "#494948", # North Balwyn to Victoria Harbour Docklands
    the57 = "#41b5bb", # West Maribyrnong to Flinders Street Station
    the58 = "#787e7f", # West Coburg to Toorak
    the59 = "#487954", # Airport West to Flinders Street Station
    the64 = "#009f68", # Melbourne University to East Brighton
    the67 = "#9e725c", # Melbourne University to Carnegie
    the70 = "#e684ab", # Wattle Park to Waterfront City Docklands
    the72 = "#98ae9a", # Melbourne University to Camberwell
    the75 = "#0095c7", # Vermont South to Marvel Stadium Docklands
    the78 = "#7f73a7", # North Richmond to Balaclava
    the82 = "#b8d140", # Moonee Ponds to Footscray
    the86 = "#f3b429", # Bundoora RMIT to Waterfront City Docklands
    the96 = "#d23778", # East Brunswick to St Kilda Beach
    the109 = "#e6772d" # Box Hill to Port Melbourne
  )

  # Use all colors if none selected
  if (is.null(name)) {
    orig_hex <- tram_colors
  } else {
    # Check validity
    if (!all(name %in% names(tram_colors))) {
      stop("Some names not found in tram color list.")
    }
    orig_hex <- tram_colors[name]
  }


  # If n == length(orig), return them directly
  if (n == length(orig_hex)) {
    return(unname(orig_hex))
  }

  # Convert hex to RGB matrix
  rgb <- t(col2rgb(orig_hex))  # matrix with rows = colors, cols = R G B

  # Interpolation setup
  temp <- matrix(NA, ncol = 3, nrow = n)
  x  <- seq(0, 1, length.out = nrow(rgb))
  xg <- seq(0, 1, length.out = n)

  for (k in 1:3) {
    hold <- spline(x, rgb[, k], xout = xg)$y
    hold <- pmin(pmax(hold, 0), 255) # Clamp between 0 and 255
    temp[, k] <- round(hold)
  }

  # Output hex
  palette <- rgb(temp[, 1], temp[, 2], temp[, 3], maxColorValue = 255)
  return(palette)
}
