library(tidyverse)
#remove all existing variables
rn(list=ls())


survey <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')


#equal to
survey <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')

survey%>%head()

survey_USD<-survey%>%
  filter(currency=="USD")

#dataset with USD female

survey_USD_female<-survey%>%
  filter(
  currency=="USD" & 
    gender=="Woman"
)


#dataset with AUD or female |

survey_AUD_female<-survey%>%
  filter(
    currency=="AUD" | 
      gender=="Woman"
  )


survey%>%select(timestamp, gender, currency)
