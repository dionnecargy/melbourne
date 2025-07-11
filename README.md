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

Colours were obtained using the [Melbourne Tram Network Map 2017](https://www.ptv.vic.gov.au/assets/PDFs/Maps/Network-maps/417bb4810a/PTV_Tram-Network-Map_2017.pdf).
