library(dplyr)
library(httr)

get_external_id_types <- function() {

    auth_reach()

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