# 🏃 Fitness Tracker Behavioral Analysis

## About This Project
Ever wondered what separates someone who hits 10,000 steps daily from someone 
who barely moves? I analyzed Fitbit data from 35 real users over 31 days to 
find out. Using Python, PostgreSQL, and Power BI, I explored how people actually 
move, sleep, and burn calories — and the findings were eye-opening.

## Questions I Set Out to Answer
- Are users actually meeting basic fitness goals?
- Which users are most and least active — and why?
- Does sleeping more make you more active the next day?
- When during the day do people move the most?
- How much of the day do people spend completely sedentary?

## What I Found
The most striking finding? Nearly half the users (40%) are sedentary, 
averaging just 2,500 steps a day — far below the recommended 10,000. 
Meanwhile, the most active users burn 37% more calories daily and exercise 
25x more minutes than sedentary ones. The gap is huge.

People are most active between 6pm and 7pm — clearly exercising after work 
or school. There's also a lunchtime spike at 12pm worth noting for anyone 
designing fitness apps or workplace wellness programs.

Interestingly, sleep alone doesn't predict how active someone is 
(correlation: -0.34). This suggests lifestyle and routine matter far more 
than rest alone.

## Tools I Used
- Python (pandas, matplotlib, seaborn) for data cleaning and exploration
- PostgreSQL for storing data and answering business questions with SQL
- Power BI for building the interactive dashboard
- Jupyter Notebook as my analysis environment

## Project Files
- notebooks/load_data.ipynb — Loading and storing data in PostgreSQL
- notebooks/eda.ipynb — Full exploratory analysis with visualizations
- sql/queries.sql — 5 business questions answered in SQL
- dashboard/Fitness_Tracker_Analysis.pbix — Power BI dashboard

## Dataset
Source: [Fitbit Fitness Tracker Data on Kaggle](https://www.kaggle.com/datasets/arashnic/fitbit)
35 users | 31 days | March–May 2016

## Recommendations
If I were advising a fitness app product team based on this data, I would 
suggest targeting sedentary users with push notifications around 6pm when 
people are most likely to be active. A lunchtime step challenge could also 
tap into the natural midday activity spike. Sleep-based nudges alone are 
unlikely to drive behavior change given the weak correlation found.
