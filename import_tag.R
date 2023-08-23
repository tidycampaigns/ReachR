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

    status_url <<- glue("https://api.reach.vote/api/v1/imports/tags/{datareturn$id}")

    print("Import started. Use get_import_status() to check on the status of the import.")

}