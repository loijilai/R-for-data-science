library(tidyverse)
library(dplyr)
library(ggthemes)
data <- read_xls("/Users/abner/Downloads/np11.xls")
C <- data$...4[66:77]
C <- as.numeric(C)
fix_cap <- as.numeric(data$...6)
inv <- as.numeric(data$...7)
I <- fix_cap[66:77] + inv[66:77]
G <- data$...5[66:77]
G <- as.numeric(G)
export <- as.numeric(data$...8)
import <- as.numeric(data$...9)
NX <- export[66:77] - import[66:77]
growth_rate <- C+I+G+NX
year <- c(2010:2021)
tidy <- data.frame(year, C, I, G, NX, growth_rate)
new_tidy <- gather(tidy, key = "exp", value = "pct",C:NX) %>% arrange(year)
ggplot(data = new_tidy) +
  geom_bar(aes(x = year, y = pct, fill = exp),stat = "identity") +
  theme_economist() +
  geom_line(mapping = aes(x = year, y = growth_rate), col = "blue")
