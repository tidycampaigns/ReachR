#' @title get_external_id_types
#'
#' @description Function to retrieve external ID types for Reach API
#' 
#' @param access_token Access token to interact with a given Reach campaign via API
#'
#' @return A dataframe of external ID types
#'
#' @import dplyr
#' @import httr
#' @import purrr
#'
#' @export
get_external_id_types <- function(
    access_token
) {
    if(is.null(access_token)) {
        access_token <- auth_reach()
    }

    external_id_types <<- VERB(
        "GET",
        url = "https://api.reach.vote/api/v1/external-ids",
        add_headers("authorization" = paste0("Bearer ", access_token))
    ) %>% content() %>% list() %>%
    pluck(1, 1) %>%
    unlist() %>%
    as.data.frame(.) %>%
    rename(.,
        external_id_type = `.`,
    )

    print("External ID Types Retrieved in dataframe 'external_id_types'")
    
}