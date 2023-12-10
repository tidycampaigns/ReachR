#' @title get_tags
#'
#' @description Function to retrieve tags from Reach API
#' 
#' @param access_token Access token to interact with a given Reach campaign via API
#'
#' @return A dataframe of all tags in the Reach campaign for which you are authenticated
#'
#' @import dplyr
#' @import httr
#'
#' @export

get_tags <- function(
    access_token
) {
    if(is.null(access_token)) {
        access_token <- auth_reach()
    }

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