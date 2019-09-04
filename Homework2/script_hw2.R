library(RMySQL)
library(dbConnect)


mydb = dbConnect(MySQL(), user='root', password='Biology512', dbname='movie_ratings', host='localhost', port = 3306)

my_query <- paste(readLines('/Users/zdalexander/Desktop/movie_ratings_query.sql'), collapse='\n')
my_query

dbListTables(mydb)
movie_ratings <- dbGetQuery(mydb, my_query)
movie_ratings
dbDisconnect(mydb)