library(tidyverse)
library(dplyr)
library(ggthemes)
data <- read_xls("/Users/abner/Downloads/np11.xls")
Consumption <- data$...4[66:77]
Consumption <- as.numeric(C)
fix_cap <- as.numeric(data$...6)
inv <- as.numeric(data$...7)
Investment <- fix_cap[66:77] + inv[66:77]
Government_Spending <- data$...5[66:77]
Government_Spending <- as.numeric(G)
export <- as.numeric(data$...8)
import <- as.numeric(data$...9)
Net_Export <- export[66:77] - import[66:77]
growth_rate <- Consumption+Investment+Government_Spending+Net_Export
year <- c(2010:2021)
tidy <- data.frame(year, Consumption, Investment, Government_Spending, Net_Export, growth_rate)
new_tidy <- gather(tidy, key = "exp", value = "pct",Consumption:Net_Export) %>% arrange(year)
ggplot(data = new_tidy) +
  geom_bar(aes(x = year, y = pct, fill = exp),stat = "identity") +
  labs(x = "", y = "", title = "Taiwan GDP : Contribution to Economic Growth, % points") +
  theme_economist() +
  geom_line(mapping = aes(x = year, y = growth_rate), col = "blue") 
