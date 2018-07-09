
# dshield

Query ‘SANS’ ‘DShield’ ‘API’

## Description

The ‘DShield’ project provides early warning attack data and host/‘IP’
metadata to the information security community. Tools are provided to
query various ‘DShield’ ‘API’ <https://isc.sans.edu/api/> endpoints.

## What’s Inside The Tin

The following functions are implemented:

  - `ip_info`: IP info
  - `port_date`: Port information at a point-in-time
  - `port_history`: Historical activity for a given port
  - `port_info`: Port info

## Installation

``` r
devtools::install_github("hrbrmstr/dshield")
```

## Usage

``` r
library(dshield)

# current verison
packageVersion("dshield")
```

    ## [1] '0.1.0'

``` r
str(ip_info("70.91.145.10"))
```

    ## List of 14
    ##  $ number        : chr "70.91.145.10"
    ##  $ count         : int 1
    ##  $ attacks       : int 1
    ##  $ maxdate       : chr "2018-06-10"
    ##  $ mindate       : chr "2018-06-10"
    ##  $ updated       : chr "2018-06-10 06:15:59"
    ##  $ comment       : NULL
    ##  $ maxrisk       : NULL
    ##  $ asabusecontact: chr "abuse@comcast.net"
    ##  $ as            : int 7922
    ##  $ asname        : chr "COMCAST-7922 - Comcast Cable Communications, LLC,"
    ##  $ ascountry     : chr "US"
    ##  $ assize        : int 66192817
    ##  $ network       : chr "70.88.0.0/14"

``` r
str(port_info(5555))
```

    ## List of 3
    ##  $ number  : int 5555
    ##  $ data    :List of 8
    ##   ..$ date   : chr "2018-07-09"
    ##   ..$ records: int 96165
    ##   ..$ targets: int 5017
    ##   ..$ sources: int 35216
    ##   ..$ tcp    : int 67
    ##   ..$ udp    : int 0
    ##   ..$ datein : chr "2018-07-09"
    ##   ..$ portin : int 5555
    ##  $ services:List of 2
    ##   ..$ udp:List of 2
    ##   .. ..$ service: chr "personal-agent"
    ##   .. ..$ name   : chr "Personal Agent"
    ##   ..$ tcp:List of 2
    ##   .. ..$ service: chr "personal-agent"
    ##   .. ..$ name   : chr "Personal Agent"

``` r
str(port_date(5555, "2018-06-23"))
```

    ## List of 2
    ##  $ number: int 5555
    ##  $ data  :List of 8
    ##   ..$ date   : chr "2018-06-23"
    ##   ..$ records: int 8106
    ##   ..$ targets: int 1423
    ##   ..$ sources: int 4211
    ##   ..$ tcp    : int 49
    ##   ..$ udp    : int 0
    ##   ..$ datein : chr "2018-06-23"
    ##   ..$ portin : int 5555

``` r
str(port_history(5555, "2018-06-01"))
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    39 obs. of  6 variables:
    ##  $ date   : Date, format: "2018-06-01" "2018-06-02" "2018-06-03" "2018-06-04" ...
    ##  $ records: int  10998 11852 9460 11901 13087 12525 14803 15486 23398 14761 ...
    ##  $ targets: int  2158 2149 1965 2056 2061 1841 2267 2392 2649 1260 ...
    ##  $ sources: int  5021 5439 4536 5192 5542 5293 5975 5622 6198 5483 ...
    ##  $ tcp    : int  53 53 55 52 52 56 52 54 64 46 ...
    ##  $ udp    : int  0 0 0 0 0 0 0 0 1 0 ...
