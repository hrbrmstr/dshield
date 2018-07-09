#' IP info
#'
#' @md
#' @param ip IP address
#' @export
#' @examples
#' ip_info("70.91.145.10")
ip_info <- function(ip) {

  ip <- ip[1]

  if (!iptools::is_valid(ip)) stop("Invalid IP address.", call.=FALSE)

  httr::GET(
    url = sprintf("https://isc.sans.edu/api/ip/%s?json", ip)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text")
  out <- jsonlite::fromJSON(out)

  out$ip

}
