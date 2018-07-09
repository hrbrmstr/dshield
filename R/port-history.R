#' Historical activity for a given port
#'
#' @md
#' @param port TCP/UDP port
#' @param start,end date range to query within (ISO character or `Date` object).
#'        `end` defaults to today.
#' @export
#' @examples
#' port_history(5555, "2018-06-01")
port_history <- function(port, start, end = Sys.Date()) {

  port <- port[1]
  start <- as.Date(start)
  end <- as.Date(end)

  if ( !((port >= 0) & (port <= 65535)) ) stop("Invalid port.", call.=FALSE)

  httr::GET(
    url = sprintf(
      "https://isc.sans.edu/api/porthistory/%s/%s/%s?json",
      port,
      as.character(start),
      as.character(end)
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text")
  out <- jsonlite::fromJSON(out)

  gone <- c("startdate", "enddate", "port")

  out <- out[setdiff(names(out), gone)]
  out <- do.call(rbind.data.frame, out)
  out$date <- as.Date(as.character(out$date))
  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
