library(tidyverse)
library(ggthemes)
library(readxl)
data <- read_xls("np11.xls")
C <- data$...4[66:77]
C <- as.numeric(C)
fix_cap <- as.numeric(data$...6[66:77])
inv <- as.numeric(data$...7[66:77])
I <- fix_cap + inv
G <- data$...5[66:77]
G <- as.numeric(G)
export <- as.numeric(data$...8[66:77])
import <- as.numeric(data$...9[66:77])
NX <- export - import
growth_rate <- as.numeric(data$...3[66:77])
year <- c(2010:2021)
tidy <- data.frame(year, C, I, G, NX, growth_rate)
new_tidy <- gather(tidy, key = "exp", value = "pct",C:NX) %>% arrange(year)
ggplot(data = new_tidy) +
  geom_col(aes(x = year, y = pct, fill = exp))+
  theme_economist()+
  geom_line(mapping = aes(x = year, y = growth_rate), col = "blue", lwd=1.3)+
  geom_text(aes(x = year, y = growth_rate, label=growth_rate, vjust=-1))+
  labs(x='', y='',title = "Taiwan GDP : Contribution to Economic Growth, % points")+
  theme(legend.title = element_blank())+
  scale_fill_discrete(labels=c('Consumption', 'Government Spending', 
                               'Investment', 'Net Export'))+
  scale_x_continuous(breaks = c(2010:2021))+
  scale_y_continuous(breaks=seq(0, 9, 3))
  
  
  
  
  
