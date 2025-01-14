
# LNCD data club ggplot presentation

library(ggplot2)
library(ggExtra)


# Basic scatter plot 
## Add points using geom_point
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()


# Customization
## Size and color
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) + # changing the size of the points
  labs(title = "Scatter Plot with Cylinders",  # add a subtitle
       subtitle = "Colored by Number of Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal() +
  scale_color_manual(values = c("red", "blue", "green")) + # changing colors using colors you choose 
  xlim(c(0, 7)) + ylim(c(0, 50)) # changing the x and y limits

# Change point shape 
ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl))) +
  geom_point(size = 3) + # changing the size of the points
  labs(title = "Scatter Plot with Cylinders",  # add a subtitle
       subtitle = "Colored by Number of Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal() +
  scale_color_manual(values = c("red", "blue", "green")) + # changing colors using colors you choose 
  xlim(c(0, 7)) + ylim(c(0, 50)) # changing the x and y limits


## Color with a preset palette
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) + # changing the size of the points
  labs(title = "Scatter Plot with Cylinders",
       subtitle = "Colored by Number of Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal() +
  scale_colour_brewer(palette = "Set2") + # changing colors using a preset palette 
  xlim(c(0, 7)) + ylim(c(0, 50)) # changing the x and y limits


## Change X and Y axis ticks
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) + # changing the size of the points
  labs(title = "Scatter Plot with Cylinders",
       subtitle = "Colored by Number of Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal() +
  scale_x_continuous(breaks=seq(1, 9, 2)) # 1 to 9, by 2s


## Reverse the x axis
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) + # changing the size of the points
  labs(title = "Scatter Plot with Cylinders",
       subtitle = "Colored by Number of Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal() +
  scale_x_reverse()


## Change location of legend
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) + # changing the size of the points
  labs(title = "Scatter Plot with Cylinders",
       subtitle = "Colored by Number of Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal() +
  theme(legend.position = "top") # can be top, bottom, left, right, or none


## change the size and font of the labels
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) + # changing the size of the points
  labs(title = "Scatter Plot with Cylinders",
       subtitle = "Colored by Number of Cylinders",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Cylinders") +
  theme_minimal() +
  theme(legend.position = "top", 
        axis.text = element_text(size = 6, family = "Arial", color = c("black")),
        axis.title.x = element_text(size = 7, family ="Arial", color = c("black")),
        axis.title.y = element_text(size = 7, family ="Arial", color = c("black")),
        axis.line = element_line(linewidth = .2), 
        axis.ticks = element_line(linewidth = .2))


## Adding text to a plot (like ***)
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(aes(group = 1), method="lm", alpha=0.4, linewidth=2) + 
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal() +
  geom_text(aes(y = 7, x = 5.6, label = "***"), size = 15, color="plum4")
  

# Spaghetti Plot using geom_line
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  geom_line(aes(group=cyl), alpha = 0.2)
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()

# Spaghetti, no points
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = factor(cyl))) +
    geom_line(aes(group=cyl), alpha =1) + # this is how we add the lines for the same subject 
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
    theme_minimal()

## Add a line of best fit using geom_smooth
### Linear fit 
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(aes(group = 1), method="lm", alpha=0.4, linewidth=2) + 
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()


#### Different lines of fit for different groups
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color=factor(cyl))) +
  geom_point() +
  geom_smooth(aes(group = cyl), method="lm", alpha=0.4, linewidth=2) + 
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()


#### Facet wrap
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color=factor(cyl))) +
  geom_point() +
  geom_smooth(aes(group = cyl), method="lm", alpha=0.4, linewidth=2) + 
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal() +
  facet_wrap(~cyl)


### Gam fit 
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(aes(group = 1), method=mgcv::"gam", formula = y ~ s(x, k = 3, fx = T), alpha=0.4, linewidth=2) + 
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()


ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(aes(group = 1), method="gam", alpha=0.4, linewidth=2) + 
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()


### Loess fit 
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(aes(group = 1), method="loess", alpha=0.4, linewidth=2) + 
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()


# Bar plot
ggplot(data = mtcars, mapping = aes(x = cyl)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Number of Cylinders",
       x = "Cylinders",
       y = "Count") +
  theme_light()


# Histogram 
ggplot(data = mtcars, mapping = aes(x = mpg)) +
  geom_histogram() +
  labs(title = "MPG",
       x = "MPG",
       y = "Count") +
  theme_light()


# Box plot
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  theme_minimal()


# Line plot
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_line(color = "red", size = 1.2) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Line plot",
       x = "Horsepower",
       y = "MPG") +
  theme_classic()


# Stacked Bar Chart
ggplot(data = mtcars, aes(x = "", y=mpg, fill=factor(cyl))) +
  geom_bar(width = 1, stat="identity") +
  labs(title = "MPG",
       x = "MPG",
       y = "Count") +
  theme_light()


# Pie chart circle
ggplot(data = mtcars, aes(x = "", y=mpg, fill=factor(cyl))) +
  geom_bar(width = 1, stat="identity") +
  labs(title = "MPG",
       x = "MPG",
       y = "Count") +
  theme_light() + 
  coord_polar(theta = "y", start=0)


# Marginal Plot
g <- ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_count() +
  theme_minimal()

ggMarginal(g, type = "histogram", fill="transparent")


# Diverging Barcharts
mtcars$`car name` <- rownames(mtcars)
# compute normalized mpg
mtcars$mpg_z <- round((mtcars$mpg - mean(mtcars$mpg))/sd(mtcars$mpg), 2)
# above / below avg flag
mtcars$mpg_type <- ifelse(mtcars$mpg_z < 0, "below", "above")
# sort
mtcars <- mtcars[order(mtcars$mpg_z), ]
mtcars$`car name` <- factor(mtcars$`car name`, levels = mtcars$`car name`)

ggplot(mtcars, aes(x=`car name`, y=mpg_z, label=mpg_z)) +
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5) +
  scale_fill_manual(name="Mileage",
                    labels = c("Above Average", "Below Average"),
                    values = c("above"="#00ba38", "below"="#f8766d")) +
  labs(subtitle="Normalised mileage from 'mtcars'",
       title= "Diverging Bars") +
  coord_flip()


# Adding a vertical line
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal() +
  geom_vline(xintercept=3)


# Adding a horizonal line
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
  geom_point() +
  labs(title = "Scatter Plot of Weight vs MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal() +
  geom_hline(yintercept=20)


# Two y axes
ggplot(mtcars, aes(x = wt)) +
  # Line for mpg (primary y-axis)
  geom_line(aes(y = mpg, color = "Miles per Gallon (mpg)"), size = 1) +
  # Line for hp, scaled to match the primary axis
  geom_line(aes(y = hp / 10, color = "Horsepower (hp / 10)"), size = 1, linetype = "dashed") +
  # Define primary and secondary y-axes
  scale_y_continuous(
    name = "Miles per Gallon (mpg)", # Primary axis label
    sec.axis = sec_axis(~ . * 10, name = "Horsepower (hp)") # Secondary axis transformation
  ) +
  # Custom color legend
  scale_color_manual(
    name = "Legend",
    values = c("Miles per Gallon (mpg)" = "blue", "Horsepower (hp / 10)" = "red")
  )

