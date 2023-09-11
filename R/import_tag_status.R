#` @title import_tag_status
#`
#` @description Function to retrieve tag import job status from Reach API
#`
#` @param status_url URL for tag import job status
#`
#` @return A message indicating the import job's status
#`
#` @export
#`
#` @import httr
#` @import dplyr

import_tag_status <- function(
    status_url
) {

    auth_reach()

    VERB(
        "GET",
        url = status_url,
        add_headers("authorization" = paste0("Bearer ", access_token))
    ) %>% content()
    
}