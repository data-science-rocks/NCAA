

cbb <- cbb

library(ggplot2)
library(tidyr)

# Remove rows with missing data in TEAM and CONF columns
cbb <- drop_na(cbb, TEAM, CONF)

# Create a data frame with counts of teams in each conference
conf_counts <- cbb %>% 
  count(CONF, sort = TRUE)


# Define a color palette to range from blue to red
colors <- colorRampPalette(c("blue", "red"))(length(unique(conf_counts$n)))

# Create the bar plot
ggplot(conf_counts, aes(x = reorder(CONF, -n), y = n, fill = n)) +
  geom_bar(stat = "identity") +
  scale_fill_gradient(low = colors[length(colors)], high = colors[1]) +
  xlab("Conference") +
  ylab("Average Number of Teams Sent per Year") +
  ggtitle("Distribution of Teams by Conference") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


