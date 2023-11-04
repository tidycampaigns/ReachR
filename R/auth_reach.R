#` @title auth_reach
#`
#` @description Function to authenticate with the Reach API and create access token for other functions
#`
#` @param user Username for Reach API
#` @param pw Password for Reach API
#`
#` @return An access token for use in other functions
#`
#` @import httr
#` @import dplyr
#` @import purrr
#`
#` @export

auth_reach <- function (

    user = Sys.getenv("REACH_API_USER"),
    pw = Sys.getenv("REACH_API_PASSWORD")

) {

    json_body <- list(

        username = user,
        password = pw

    )

    access_token <<- VERB(

        "POST",
        url = "https://api.reach.vote/oauth/token",
        body = json_body,
        encode = "form"

    ) %>%
    content() %>%
    pluck(., 1)
    
}
