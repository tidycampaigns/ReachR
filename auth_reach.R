library(httr)

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
