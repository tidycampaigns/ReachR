#' @title import_tag_status
#'
#' @description Function to retrieve tag import job status from Reach API
#'
#' @param status_url URL for tag import job status
#' @param access_token Access token to interact with a given Reach campaign via API
#'
#' @return A message indicating the import job's status
#'
#'
#' @import httr
#' @import dplyr
#'
#' @export

import_tag_status <- function(
    status_url,
    access_token
) {
    if(is.null(access_token)) {
        access_token <- auth_reach()
    }

    VERB(
        "GET",
        url = status_url,
        add_headers("authorization" = paste0("Bearer ", access_token))
    ) %>% content()
    
}