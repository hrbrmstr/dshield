#' Autonomous system info
#'
#' @md
#' @param as autonomous system number
#' @param n_rec number of records to be returned (max is 2,000; default is 100)
#' @export
# as_info <- function(asn, n_rec=100) {
#
#   asn <- asn[1]
#
#   if ((n_rec < 1) | (n_rec > 2000)) n_rec <- 100
#
#   httr::GET(
#     url = sprintf("https://isc.sans.edu/api/asnum/%s/%s?json", n_rec, asn)
#   ) -> res
#
#   httr::stop_for_status(res)
#
#   out <- httr::content(res, as="text")
#   out <- jsonlite::fromJSON(out)
#
#   out$ip
#
# }

