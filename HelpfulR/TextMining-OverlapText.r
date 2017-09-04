library(dplyr)

df <- structure(list(date = c("10-01-17", "10-01-17", "11-01-17"
), text = c(" Hi, how are you?", " Hi, how are you? Oh, I'm just fine.", 
            " Hi, how are you? Oh, I'm just fine. The weather is nice today."
)), class = "data.frame", row.names = c(NA, -3L), .Names = c("date", "text"))

df %>% 
  rowwise() %>% 
  filter(sum(grepl(text, .$text, fixed = TRUE) & date == .$date) == 1)
