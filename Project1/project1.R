library(stringr)

chess_data <- paste(readLines("https://raw.githubusercontent.com/zachalexander/data607_cunysps/master/Project1/chess_ratings.txt"), collapse = '\n')

player_names <- unlist(str_extract_all(chess_data, '([:upper:]+\\s[:upper:]+(\\s[:upper:]+)?(\\s[:upper:]+)?)'))
player_names <- player_names[player_names != "USCF ID"]
player_names <- str_to_title(player_names)


location <- unlist(str_extract_all(chess_data, '(\n)\\s\\s\\s[:upper:]+'))
location <- unlist(str_replace_all(location, '^\\s+|\\s+$', ""))

pre_rating <- unlist(str_extract_all(chess_data, '(R:)\\s{1,}\\d+'))
pre_rating <- unlist(str_replace_all(pre_rating, '(R:)\\s', ""))

post_rating <- unlist(str_extract_all(chess_data, '(->)(\\s{1,})?\\d+'))
post_rating <- unlist(str_replace_all(post_rating, '(->)(\\s)?', ""))

total_points <- unlist(str_extract_all(chess_data, '(\\d\\.\\d)'))

results <- unlist(str_extract_all(chess_data, '(\\d\\.\\d\\s{2}(\\|[:upper:]\\s{2}(\\s)?(\\s)?(\\d+)?){1,})'))
results <- unlist(str_replace(results, '\\d\\.\\d\\s{2}\\|', ''))

opponents <- unlist(str_replace_all(results, '[:upper:]\\s+', ''))
opponents <- unlist(str_replace_all(opponents, '\\|', '\\,'))
opponents <- unlist(str_replace_all(opponents, '\\,{2,}', '\\,'))
opponents <- unlist(str_replace_all(opponents, '(\\,$)', ''))
opponents <- unlist(str_replace_all(opponents, '^\\,', ''))

column_headers <- c('game1', 'game2', 'game3', 'game4', 'game5')

# test <- function(){
#   for(i in column_headers){
#     column_headers[i] <- unlist(str_extract(opponents, '\\d+'))
#     opponents <- unlist(str_replace(opponents, '\\d+\\|', ''))
#   }
# }
# test()
# game1 <- unlist(str_extract(opponents, '(\\d+)'))
# opponents <- unlist(str_replace(opponents, '\\d+\\|', ''))



chess_ratings_df <- data.frame(player_name = player_names, 
                               location = location,
                               total_points = total_points,
                               pre_rating = pre_rating, 
                               post_rating = post_rating)

chess_ratings_df$pre_rating <- as.numeric(as.character(chess_ratings_df$pre_rating))
chess_ratings_df$post_rating <- as.numeric(as.character(chess_ratings_df$post_rating))
chess_ratings_df$total_points <- as.numeric(as.character(chess_ratings_df$total_points))









