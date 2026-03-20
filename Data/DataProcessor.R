#### simple script to find and get data sets from world bank data360 api

## find data sets
reqIndicators <- function(search, skip = 0, top = 25) {
  data360 <- 'https://data360api.worldbank.org/data360/searchv2'
  resp <- data360 |> 
    httr2::request() |> 
    httr2::req_method('POST') |> 
    httr2::req_headers(
      accept = "*/*",
      `content-type` = "application/json"
    ) |>
    httr2::req_body_json(list(
      count = "true",
      skip = skip,
      select = "series_description/idno, series_description/name, series_description/database_id, series_description/definition_long, series_description/csv_link",
      search = search,
      top = top
    )) |> 
    httr2::req_perform() |> 
    httr2::resp_body_json(simplifyVector = TRUE)
  
  return(resp$value)
}

## get data set
getData <- function(dataset_id, idno, skip = 0) {
  data360 <- "https://data360api.worldbank.org/data360/data?"
  resp <- data360 |> 
    httr2::request() |> 
    httr2::req_method('GET') |> 
    httr2::req_headers(accept = 'application/json') |> 
    httr2::req_url_query(
      DATABASE_ID = dataset_id,
      INDICATOR = idno,
      REF_AREA = 'JPN',
      skip = skip
    ) |> 
    httr2::req_perform() |> 
    httr2::resp_body_json(simplifyVector = TRUE)
  
  return(resp$value)
}
