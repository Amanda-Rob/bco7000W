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
  geom_point(colour=manufacturer)

#remove all variables from environment
rm(list=ls())

brewing_materials <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewing_materials.csv')
beer_taxed <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/beer_taxed.csv')
brewer_size <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewer_size.csv')
beer_states <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/beer_states.csv')

#install.packages("skimr")
library(skimr)
library(tidyverse)

#what data types
brewing_materials%>%skim()

brewing_materials%>%count(data_type)
brewing_materials%>%count(material_type, sort=TRUE)

#recoding as factor
brewing_materials<-brewing_materials%>%mutate(material_type=as_factor(material_type))

brewing_materials%>%skim()

brewing_materials%>%mutate(type=as_factor(type))

fastfood<-read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-09-04/fastfood_calories.csv")

skim(fastfood)

#data viz

#changing themes for data viz
theme_set(theme_minimal())

brewing_materials%>%
  ggplot(
    aes(x=material_type,y=month_current, fill=type)
    )+
  geom_col()+
  coord_flip()


