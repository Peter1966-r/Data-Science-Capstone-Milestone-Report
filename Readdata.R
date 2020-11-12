dataBlogs <- readLines("./data/en_US/en_US.blogs.txt", encoding = "UTF-8", skipNul = TRUE)
dataNews <- readLines("./data/en_US/en_US.news.txt", encoding = "UTF-8", skipNul = TRUE)

## Warning in readLines("./data/en_US/en_US.news.txt", encoding = "UTF-8", :
## unvollstÃ¤ndige letzte Zeile in './data/en_US/en_US.news.txt' gefunden

dataTwitter <- readLines("./data/en_US/en_US.twitter.txt", encoding = "UTF-8", skipNul = TRUE)
