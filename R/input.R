#' Get Advent of Code input
#'
#' By default the `input()` downloads current date
#' \href{https://adventofcode.com/}{Advent of Code} puzzle input.
#' Also can be used for previous puzzles.
#'
#' @param year Contest year. The default value is current day.
#' @param day Day of the puzzle. The default value is current day.
#' @param path File path to save input data.
#'   The default vale is "input\{day\}.txt".
#' @param verbose Logical flag for printing HTTP response.
#'   The default value is `TRUE`.
#' @param open_file Logical flag for open to saved file.
#'   The default value is `FALSE`.
#'
#' @return The file path where input saved.
#' @export
#'
#' @examples
#' \dontrun{
#' input()
#' input(2021, 1)
#' purrr::walk(1:25, ~input(2020, .x))
#' }
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
