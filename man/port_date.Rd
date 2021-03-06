% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/port-date.R
\name{port_date}
\alias{port_date}
\title{Port information at a point-in-time}
\usage{
port_date(port, day = Sys.Date())
}
\arguments{
\item{port}{TCP/UDP port}

\item{day}{date to query for (ISO character or \code{Date} object); defaults to today}
}
\value{
data frame (tibble)
}
\description{
Port information at a point-in-time
}
\examples{
port_date(5555, "2018-06-23")
}
