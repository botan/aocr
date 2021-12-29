curr_day <- function() as.integer(format(Sys.Date(), "%d"))
curr_month <- function() as.integer(format(Sys.Date(), "%m"))
curr_year <- function() as.integer(format(Sys.Date(), "%Y"))

valid_days <- function() seq_len(25)
valid_years <- function() {
  if (curr_month() == 12) {
    seq(2015, curr_year())
  } else {
    seq(2015, curr_year() - 1)
  }
}
