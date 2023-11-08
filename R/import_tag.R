#' @title import_tag
#'
#' @description Function to apply tags from a hosted CSV file into voters in Reach
#'
#' @param tag_id ID of the tag you want to apply
#' @param file_url URL of the hosted CSV file
#'
#' @return A message indicating the import has started
#'
#' @import glue
#' @import purrr
#' @import httr
#' @import dplyr
#'
#' @export

import_tag <- function(
    tag_id,
    file_url
) {
### Comments
# maybe an optional parameter for a webhook?
# not sure if this is needed w/ import_tag_status -- but maybe some users like to monitor all their data flows in one place
​
    auth_reach()
    ### Comments
    # is it best practice to authenticate within the function? prevents users from authenticating w/ methods other than Sys.getenv
    # when managing keys for multiple campaigns, may want to be able to loop through a list of credentials
    # maybe an optional parameter for access_token, then run auth_reach() if not found?

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

    status_url <<- glue("https://api.reach.vote/api/v1/imports/tags/{datareturn$data$id}")
    ### Comments
    # changed {datareturn$id} to {datareturn$data$id} 
    # {datareturn$id} returns empty item
    
    # using superassignment operator means that status_url appears in environment in addition to intended item status_url_{tag_id}
    # is superassignment needed here? extra status_url item may be confusing for user

    assign(name, status_url, envir = .GlobalEnv)

    print(paste0("Import started. Use import_tag_status() with input ", name," .")) 
    ### Comments
    # changed get_import_status() to import_tag_status() to match published function

}
