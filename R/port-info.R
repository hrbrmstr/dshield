#' Port info
#'
#' @md
#' @param port TCP/UDP port
#' @export
#' @examples
#' port_info(5555)
port_info <- function(port) {

  port <- port[1]

  if ( !((port >= 0) & (port <= 65535)) ) stop("Invalid port.", call.=FALSE)

  httr::GET(
    url = sprintf("https://isc.sans.edu/api/port/%s?json", port)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text")
  out <- jsonlite::fromJSON(out)

  out

}

