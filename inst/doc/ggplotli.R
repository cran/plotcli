## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(plotcli)
library(ggplot2)

# Create a ggplot with points and smooth line
mtcars_ggplot <- ggplot(mtcars, aes(x = mpg, y = wt)) +  
  geom_point() +  
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Mtcars Dataset with Regression Line",  
       x = "Miles per Gallon",  
       y = "Weight")  

# Render in terminal
suppressMessages(ggplotcli(mtcars_ggplot, width = 60, height = 15))

## -----------------------------------------------------------------------------
# Colored by group
p <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  labs(title = "MPG vs Weight by Cylinders",
       color = "Cylinders")

ggplotcli(p, width = 60, height = 14)

## -----------------------------------------------------------------------------
# Iris dataset with species colors
p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Iris: Sepal Dimensions by Species")

ggplotcli(p, width = 60, height = 12)

## -----------------------------------------------------------------------------
p <- ggplot(mtcars, aes(x = mpg, color = factor(cyl))) +
  geom_density() +
  labs(title = "MPG Density by Cylinders")

ggplotcli(p, width = 60, height = 12)

## -----------------------------------------------------------------------------
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue") +
  facet_wrap(~cyl) +
  labs(title = "MPG vs Weight by Cylinders")

ggplotcli(p, width = 70, height = 14)

## -----------------------------------------------------------------------------
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "green") +
  facet_grid(am ~ cyl) +
  labs(title = "MPG: Transmission (rows) x Cylinders (cols)")

ggplotcli(p, width = 70, height = 18)

## -----------------------------------------------------------------------------
# Histogram with density overlay
p <- ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(aes(y = after_stat(density)), bins = 10, fill = "gray") +
  geom_density(color = "red") +
  labs(title = "Histogram with Density Overlay")

ggplotcli(p, width = 60, height = 12)

## -----------------------------------------------------------------------------
p <- ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point(color = "blue")

# High resolution with Braille (default)
ggplotcli(p + labs(title = "Braille Canvas (default)"), 
          width = 50, height = 10, canvas_type = "braille")

# Block characters (medium resolution)
ggplotcli(p + labs(title = "Block Canvas"), 
          width = 50, height = 10, canvas_type = "block")

# ASCII for maximum compatibility
ggplotcli(p + labs(title = "ASCII Canvas"), 
          width = 50, height = 10, canvas_type = "ascii")

## -----------------------------------------------------------------------------
p <- ggplot(mtcars, aes(x = hp, y = qsec)) +
  geom_point(color = "cyan") +
  labs(title = "With Border and Grid")

# Add border and grid
ggplotcli(p, width = 55, height = 10, border = TRUE, grid = "major")

## -----------------------------------------------------------------------------
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "magenta")

# theme_bw adds grid and border
ggplotcli(p + theme_bw() + labs(title = "theme_bw() - Grid + Border"), 
          width = 55, height = 10, border = "auto", grid = "auto")

# theme_classic has border but no grid
ggplotcli(p + theme_classic() + labs(title = "theme_classic() - Border Only"), 
          width = 55, height = 10, border = "auto", grid = "auto")

