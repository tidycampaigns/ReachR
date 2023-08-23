library(dplyr)
library(httr)

get_external_id_types <- function() {

    auth_reach()

    VERB(

        "GET",
        url = "https://api.reach.vote/api/v1/external-ids",
        add_headers(
            "authorization" = paste0("Bearer ", access_token)
        )

    )
    
}