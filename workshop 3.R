library(tidyverse)
#remove all existing variables
rm(list=ls())


survey <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')


#equal to
survey <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')

survey%>%head()

survey_USD<-survey%>%
  filter(currency=="USD")

#select data with annual salary above or equal to 50k using USD


survey_USD%>%
  filter(
    annual_salary >= 50000  
  )


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

#
survey_USD%>%arrange(annual_salary)


min(survey_USD$annual_salary)
# what is the earliest date for the survey answer
min(survey_USD$timestamp)
max(survey_USD$timestamp)#latest

#select observations within salary greater than 0 and save it under the same name
survey_USD<-survey_USD%>%
  filter(
    annual_salary > 0 
  )
# sort in a decending order
survey_USD%>%arrange(
  desc(annual_salary)
)

# what are industries in the data set
survey_USD%>%distinct(industry)

# how many under each industry
survey_USD%>%count(industry, gender,sort=TRUE)

survey_USD%>%count(gender,industry, sort=TRUE)

#how many responses from each age category and gender
survey_USD%>%
  count(
    how_old_are_you,
    gender,
    sort = TRUE
  )

#group_by

#calculate - average salary for gender in each industry
survey_USD_grouped<-survey_USD%>%
  group_by(gender, industry)%>%
  mutate(
    avr_salary=mean(annual_salary),
    min_salary=min(annual_salary),
    max_salary=max(annual_salary)
  )%>%
  ungroup()

#mutate()- create new variable

survey_USD_avr<-survey_USD%>%
  mutate(
    avr_salary=mean(annual_salary)
  )

#transmute

survey_total<-
  survey_USD%>%
  group_by(industry)%>%
  transmute(
    total_salary=annual_salary+as.numeric(other_monetary_comp),
    min_salary=min(annual_salary),
    max_salary=max(annual_salary),
    total_salary_what=total_salary
  )


#summarise

survey_USD_summars<-survey_USD%>%
  group_by(gender)%>%
  summarise(
    avr_salary=mean(annual_salary),
    min_salary=min(annual_salary),
    max_salary=max(annual_salary)
  )%>%
  ungroup()

#parse_number
#as.numeric
survey_USD%>%
  parse_number(how_old_are_you)

class(survey_USD$how_old_are_you)


#case_when
