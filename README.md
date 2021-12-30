
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aocr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

aocr is fast and convenient way to download your [Advent of
Code](https://adventofcode.com/2021/auth/login) puzzle input. Inspired
by libraries like [aocd]() and [adventdrob]().

## Installation

You can install the development version of aocr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("botan/aocr")
```

## Usage

Puzzle inputs vary by user. You must set your AOC_SESSION in .Renvrion
file. Here’s a step by step guide to get your session cookie:

1.  Log in to [Advent of Code](https://adventofcode.com/2021/auth/login)
    on your preferred web browser.

2.  Right-click on the webpage and click “Inspect” to open the developer
    console.

3.  Go the Network tab and reload to page.

4.  Click the “adventofcode.com” request.

5.  Go the Cookie tab under the Request Headers.

6.  You will find your Cookie as `session=<copy here>`.

7.  Copy that session ID and save inside your .Renviron as
    `AOC_SESSION=<paste here>`. If you have any trouble with finding
    your .Renviron file, you can use `usethis::edit_r_environ()`.

8.  Restart R session.

This is a basic example which shows you how to get your input:

``` r
library(aocr)
library(fs)

dir_ls()
#> DESCRIPTION LICENSE     LICENSE.md  NAMESPACE   R           README.Rmd  
#> README.md   aocr.Rproj  man

Sys.Date()
#> [1] "2021-12-30"

input()
#> Error in `input()`:
#> ! No puzzle on day 30.
#> ℹ Please enter a valid day in between 1 and 25.

input(2021, 1)
#> <httr2_response>
#> GET https://adventofcode.com/2021/day/1/input
#> Status: 200 OK
#> Content-Type: text/plain
#> Body: On disk 'body'

dir_ls()
#> DESCRIPTION LICENSE     LICENSE.md  NAMESPACE   R           README.Rmd  
#> README.md   aocr.Rproj  input01.txt man

input <- scan("input01.txt")
head(input)
#> [1] 169 150 158 163 167 151
```
