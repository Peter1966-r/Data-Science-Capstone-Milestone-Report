##Sample the data and create the corpus

subdataBlogs <- sample(dataBlogs, size = 1000)
subdataNews <- sample(dataNews, size = 1000)
subdataTwitter <- sample(dataTwitter, size = 1000)
sampledData <- c(subdataBlogs, subdataNews, subdataTwitter)
corpus <- VCorpus(VectorSource(sampledData))

##Remove stopwords, punctuation, whitespaces, numbers etc. from the corpuses

toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
corpus <- tm_map(corpus, toSpace, "/|@|//|$|:|:)|*|&|!|?|_|-|#|")
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords())
corpus <- tm_map(corpus, stemDocument)
corpus <- tm_map(corpus, stripWhitespace)

##Create the DocumentTermMatrizes

dtm1 <- TermDocumentMatrix(corpus)
bigram <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
dtm2 <- TermDocumentMatrix(corpus, control = list(tokenize = bigram))
trigram <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
dtm3 <- TermDocumentMatrix(corpus, control = list(tokenize = trigram))
