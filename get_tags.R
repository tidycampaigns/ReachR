library(dplyr)
library(httr)

get_tags <- function() {

    auth_reach()

    tags <<- VERB(
        "GET",
        url = "https://api.reach.vote/api/v1/tags",
        add_headers(
            "authorization" = paste0("Bearer ", access_token)
        )
    ) %>%
    content() %>%
    list() %>%
    pluck(1, 1) %>%
    bind_rows() %>%
    as.data.frame()

}