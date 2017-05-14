#Import all the required packages
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


path = os.getcwd()
dfFrame1=pd.read_csv(os.path.join(path, 'MergedJFK.csv'))
dfFrame2=pd.read_csv(os.path.join(path, 'MergedWeather.csv'))
dfFrame3=pd.read_csv(os.path.join(path, 'FinalPrices.csv'))
dfFrame2 = dfFrame2.drop('TimeEET', 1)
dfFrame2 = dfFrame2.drop('DateUTC', 1)
dfFrame2 = dfFrame2.drop('Wind_Direction', 1)
dfFrame2 = dfFrame2.drop('PrecipitationIn', 1)
dfFrame2 = dfFrame2.drop('Events', 1)
dfFrame2 = dfFrame2.drop('Conditions', 1)
dfFrame2 = dfFrame2.drop('Gust_SpeedMPH', 1)
grouped=dfFrame2.groupby(['Month','Year','DayofMonth','Hour','Quarter'],as_index=False)
df3=grouped.mean()

df = pd.merge(dfFrame1, df3, on=['Month','Year','DayofMonth','Hour','Quarter'], how='left')
DF=pd.merge(df, dfFrame3, on=['Dest','Year','Quarter'], how='left')
DF.to_csv(os.path.join(path, 'FinalDataFile.csv'), index=False)