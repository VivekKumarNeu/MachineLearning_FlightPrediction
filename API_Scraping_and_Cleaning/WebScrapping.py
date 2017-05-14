import json
import urllib2
import requests
import bs4
import numpy as np
import time
from dateutil import parser, rrule
from bs4 import BeautifulSoup,NavigableString, Tag
import pandas as pd
from pandas import DataFrame, read_csv
from datetime import datetime
import os

#Assign the current working directory to the path variable
path = os.getcwd()

url_hit_count = 0

# getting the time in 24 hours
def timeinhours(tim):
    tim = tim.split(' ')
    if (tim[1] == 'PM'):
        if (int(tim[0].split(':')[0]) == 12):
            return 12
        else:
            return 12 + int(tim[0].split(':')[0])
    else:
        if (tim[0].split(':')[0].strip() == '12'):
            return 0
        else:
            return tim[0].split(':')[0].strip()

#Empty dataframe with all the required columns
dframe = pd.DataFrame(
    columns=['Origin','Month','Year','DayofMonth','Hour', 'TimeEET', 'TemperatureF', 'Dew_PointF', 'Humidity', 'Sea_Level_PressureIn',
             'VisibilityMPH', 'Wind_Direction', 'Wind_SpeedMPH', 'Gust_SpeedMPH', 'PrecipitationIn', 'Events',
             'Conditions', 'WindDirDegrees', 'DateUTC'])


#get weather data from 01-Jan-2006 till 31-Dec-2006
start_date = "2005-01-01"  # desired starting date
end_date = "2005-12-31"  # desired ending date
start = parser.parse(start_date)
end = parser.parse(end_date)
dates = list(rrule.rrule(rrule.DAILY, dtstart=start, until=end))  # generating the dates between starting and ending date

for d in dates:

    url = "https://www.wunderground.com/history/airport/{icao}/{y}/{m}/{dd}/DailyHistory.html??format=1&format=1"
    url = url.format(icao="JFK", y=d.year, m=d.month, dd=d.day)
    rr = requests.get(url).text
    soup1 = BeautifulSoup(rr, 'html.parser')

    for br in soup1.findAll('br'):
        next = br.nextSibling
        if not (next and isinstance(next, NavigableString)):
            continue
        next2 = next.nextSibling
        if next2 and isinstance(next2, Tag) and next2.name == 'br':
            text = str(next).strip()
            if text:
                datee = next.split(',')[0].split(' ')[0].split(':')[0].strip()
                dframe = dframe.append(pd.Series(['JFK',d.month,d.year,d.day,timeinhours(next.split(',')[0]),
                                                  next.split(',')[0].strip(), next.split(',')[1],
                                                  next.split(',')[2], next.split(',')[3], next.split(',')[4],
                                                  next.split(',')[5], next.split(',')[6], next.split(',')[7],
                                                  next.split(',')[8], next.split(',')[9],
                                                  next.split(',')[10], next.split(',')[11], next.split(',')[12],
                                                  next.split(',')[13]],
                                                 index=['Origin','Month','Year','DayofMonth','Hour', 'TimeEET', 'TemperatureF',
                                                        'Dew_PointF', 'Humidity', 'Sea_Level_PressureIn',
                                                        'VisibilityMPH', 'Wind_Direction', 'Wind_SpeedMPH',
                                                        'Gust_SpeedMPH', 'PrecipitationIn', 'Events', 'Conditions',
                                                        'WindDirDegrees', 'DateUTC']),ignore_index=True)

dframe['TemperatureF'] = dframe['TemperatureF'].replace([''],np.nan)
dframe['Conditions'].astype(basestring)
dframe['Gust_SpeedMPH'] = dframe['Gust_SpeedMPH'].replace(['-'], '0')
dframe['Humidity'] = dframe['Humidity'].replace([''],'0')
dframe['PrecipitationIn'] = dframe['PrecipitationIn'].replace(['', 'N/A'], 'N/A')
dframe.to_csv(os.path.join(path, '2005data.csv'), index=False)