library(tidyverse)

data(mpg)

mpg%>% #data layer
  ggplot(
    mapping=aes( #aesthetics layer
      x=displ, 
      y=hwy,
      colour=manufacturer
    ) 
    
  )+
  geom_point()
