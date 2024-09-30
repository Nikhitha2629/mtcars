install.packages("tidyverse")
install.packages("ggridges")
install.packages("gss")

library(tidyverse)
library(ggplot2)
library(ggridges)
library(gss)

data("mtcars")
data("mpg")
data("gss_cat")

View(gss_cat)
View(mpg)

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()
ggsave(filename = "mpg01.png")

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) + 
  geom_point() +
  geom_smooth(aes(linetype = drv))
ggsave(filename = "mpg02.png")

ggplot(mpg, aes(x = hwy, y = drv, fill = drv, color = drv)) +
  geom_density_ridges(alpha = 0.5, show.legend = FALSE)
ggsave(filename = "mpg03.png")

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_wrap(~cyl)
ggsave(filename = "mpg04.png")

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(drv ~ cyl)
ggsave(filename = "mpg05.png")

relig_summary <- gss_cat |>
  group_by(relig) |>
  summarize(
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )
ggplot(relig_summary, aes(x = tvhours, y = fct_reorder(relig, tvhours))) +
  geom_point()

relig_summary |>
  mutate(
    relig = fct_reorder(relig, tvhours)
  ) |>
  ggplot(aes(x = tvhours, y = relig)) +
  geom_point()
class("partyid")
