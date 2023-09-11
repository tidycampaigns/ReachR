#` @title get_tags
#`
#` @description Function to retrieve tags from Reach API
#`
#` @return A dataframe of all tags in the Reach campaign you are authenticated for
#`
#` @export
#`
#` @import dplyr
#` @import httr

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