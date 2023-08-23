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