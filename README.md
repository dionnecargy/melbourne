# How to install the package: 
Run: 
```{r}
devtools::install_github("dionnecargy/melbourne")
```

# Loading the packages

```{r}
library(melbourne)

# Load other packages for plotting purposes
library(tidyverse)
```

# Plotting 

```{r}
# Run a plot! 
iris %>% 
  ggplot(aes(Sepal.Length, Sepal.Width, colour = Species)) + 
  geom_point() + 
  scale_color_manual(values = melb_trams(n = 3)) 

# Run a plot specifying the trams you want! 
iris %>% 
  ggplot(aes(Sepal.Length, Sepal.Width, colour = Species)) + 
  geom_point() + 
  scale_color_manual(values = melb_trams(n = 3, name = c("the59", "the109", "the35"))) 
```

Colours were obtained using the [Melbourne Tram Network Map 2017](https://www.ptv.vic.gov.au/assets/PTV-default-site/Maps-and-Timetables-PDFs/Maps/Network-maps/DTP0899-A-Yarra-Tram-Network-Map_July-2024_A4L_v1_FA.pdf).

# Colour Options for the `melb_trams` palette:
![](images/melb_trams.png)
