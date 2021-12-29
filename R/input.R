input <- function(year = curr_year(),
                  day = curr_day(),
                  path = paste0("input", day, ".txt"),
                  verbose = TRUE,
                  open_file = FALSE) {
  session <- Sys.getenv("AOC_SESSION")
  if (session == "") {
    rlang::abort(c(
      "AOC_SESSION not found in .Renviron file.",
      "i" = "Please follow the instructions on the link below:",
      "https://github.com/botan/aocr"
    ))
  }
  cookie <- paste0("session=", session)

  if (!year %in% valid_years()) {
    rlang::abort(c(
      paste0("No Advent of Code in ", year, "."),
      "i" = paste0("Please enter a valid year in between 2015 and ",
                   max(valid_years()), ".")
    ))
  }

  if (!day %in% valid_days()) {
    rlang::abort(c(
      paste0("No puzzle on day ", day, "."),
      "i" = "Please enter a valid day in between 1 and 25."
    ))
  }

  url <- paste0(
    "https://adventofcode.com/",
    year,
    "/day/",
    day,
    "/input"
  )

  if (nchar(day) == 1) day <- paste0(0, day)

  req <- httr2::request(url)
  req <- httr2::req_headers(req, Cookie = cookie)
  resp <- httr2::req_perform(req, path = path)

  if (verbose == TRUE) print(resp)

  if (open_file == TRUE) utils::file.edit(path)

  invisible(path)
}
