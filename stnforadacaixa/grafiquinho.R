library(tidyverse)
library(gganimate)

df <- data.frame(
  label = c("Comunicação", "Dados etc.", "Transparência"),
  cores = c(rgb(255/255,99/255,79/255), rgb(255/255, 227/255, 76/255), rgb(183/255,177/255,165/255)),
  t1    = c(5,  15, 10),
  t2    = c(10,  5, 15),
  t3    = c(15, 10,  5),
  t4    = c(5,   5, 10)
)

df <- df %>%
  gather(starts_with("t"), key = "estados", value = "valores")

plot1 <- ggplot(df, aes(y = valores, x = label, fill = cores)) + 
  geom_col(color = NA, width = 0.7) +
  scale_fill_identity() + 
  theme_minimal() +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        panel.grid = element_blank()) +
  transition_states(estados, transition_length = 1, state_length = 1) +
  ease_aes('sine-in-out')

# plot2 <- ggplot(df, aes(y = valores, x = label, color = cores)) + 
#   geom_point(size = 6) +
#   scale_color_identity() + 
#   theme_minimal() +
#   theme(axis.title = element_blank(),
#         axis.text = element_blank(),
#         panel.grid = element_blank()) +
#   transition_states(estados, transition_length = 1, state_length = 1) +
#   shadow_wake(wake_length = .1) 

animate(plot1, type = "cairo", nframes = 60, renderer = gifski_renderer(),
        bg = "transparent") 

anim_save("grafiquinho.gif", animation = last_animation())

# animate(plot2, type = "cairo", nframes = 30, renderer = gifski_renderer(),
#         bg = "transparent") 


# outra ideia -------------------------------------------------------------

df2 <- data.frame(
  label = c("Comunicação", "Dados etc.", "Transparência"),
  cores = c(rgb(255/255,99/255,79/255), rgb(255/255, 227/255, 76/255), rgb(183/255,177/255,165/255)),
  t1    = c(1, 2, 3),
  t2    = c(2, 3, 4),
  t3    = c(3, 4, 1)
  t4    = c(4, 1, 2)
)

df2 <- df2 %>%
  gather(starts_with("t"), key = "estados", value = "valores")


plot21 <- ggplot(df2, aes(y = 5, x = valores, color = cores, group = label)) + 
  geom_point(size = 6) +
  scale_color_identity() + 
  scale_x_continuous(limits = c(0, 3)) +
  coord_polar() +
  theme_minimal() +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        panel.grid = element_blank()) +
  transition_states(estados, transition_length = 1, state_length = 1) +
  shadow_wake(wake_length = .1)

animate(plot21, type = "cairo", nframes = 30, renderer = gifski_renderer(),
        bg = "transparent") 
