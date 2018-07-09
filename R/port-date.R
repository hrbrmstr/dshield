#' Port information at a point-in-time
#'
#' @md
#' @param port TCP/UDP port
#' @param day date to query for (ISO character or `Date` object); defaults to today
#' @return data frame (tibble)
#' @export
#' @examples
#' port_date(5555, "2018-06-23")
port_date <- function(port, day = Sys.Date()) {

  port <- port[1]
  day <- as.Date(day)

  if ( !((port >= 0) & (port <= 65535)) ) stop("Invalid port.", call.=FALSE)

  httr::GET(
    url = sprintf("https://isc.sans.edu/api/portdate/%s/%s?json", port, as.character(day))
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text")
  out <- jsonlite::fromJSON(out)

  out

}
