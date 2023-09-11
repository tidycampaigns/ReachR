#` @title import_tag
#`
#` @description Function to apply tags from a hosted CSV file into voters in Reach
#`
#` @param tag_id ID of the tag you want to apply
#` @param file_url URL of the hosted CSV file
#`
#` @return A message indicating the import has started
#`
#` @export
#`
#` @import glue
#` @import purrr
#` @import httr
#` @import dplyr
#` @import jsonlite

library(purrr)
library(httr)
library(dplyr)
library(jsonlite)

import_tag <- function(
    tag_id,
    file_url
) {

    auth_reach()

    datareturn <- VERB(
        "POST",
        url = glue("https://api.reach.vote/api/v1/imports/tags/{tag_id}"),
        add_headers("authorization" = paste0("Bearer ", access_token)),
        body = list(
            file_url = file_url
        ),
        encode = "json"
    ) %>% content()

    name <- paste0("status_url_", tag_id)

    status_url <<- glue("https://api.reach.vote/api/v1/imports/tags/{datareturn$id}")

    assign(name, status_url, envir = .GlobalEnv)

    print("Import started. Use get_import_status() to check on the status of the import.")

}