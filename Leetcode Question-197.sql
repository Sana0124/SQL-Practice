197. Rising Temperature

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Q. Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.

Solution : SQL

SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature;

Solution :Pandas

import pandas as pd

def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:
    
    weather.sort_values(by='recordDate',inplace= True)temp_diff = weather.temperature.diff() > 0
    date_diff = weather.recordDate.diff().dt.days == 1
    filtered_weather = weather[temp_diff & date_diff][['id']].rename(columns={'id': 'Id'})
    return filtered_weather

 or we can write like this:
    weather.sort_values('recordDate', inplace=True)
    return weather[((weather.temperature.diff() > 0) & (weather.recordDate.diff() == '1 days'))][['id']]
    
