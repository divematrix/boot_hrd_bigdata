import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import os
import warnings
warnings.filterwarnings("ignore")
plt.style.use('ggplot')


weather = pd.read_csv('./data/2000-01~2021-11m.csv', encoding='cp949') #불러오기
'''print(weather.head())
print(weather.dtypes)'''

wc = weather.copy() #카피
#print(wc.head())
#print(wc.dtypes)


wc['date'] = pd.to_datetime(wc['일시'], format='%Y-%m')
wc['year'] = wc['date'].dt.year
wc['month'] = wc['date'].dt.month

wc = wc.loc[:,['일시','평균기온(°C)','평균최고기온(°C)','평균최저기온(°C)','month','year']]

'''print(wc.head())
print(wc.dtypes)'''

train_year = wc.loc[(wc['year'] <= 2021)]
test_year = wc.loc[(wc['year'] >= 2020)]

print(train_year.head(10))

#train 데이터로 확인

train_year["trainDate"] = pd.to_datetime(train_year["일시"], format='%Y-%m')
train_year["MeanTemp"] = train_year['평균기온(°C)']
train_year["MaxTemp"] = train_year['평균최고기온(°C)']
train_year["MinTemp"] = train_year['평균최저기온(°C)']

'''
test_year["trainDate"] = pd.to_datetime(test_year["일시"], format='%b-%y')
test_year["MeanTemp"] = test_year['평균기온(°C)']
test_year["MaxTemp"] = test_year['평균최고기온(°C)']
test_year["MinTemp"] = test_year['평균최저기온(°C)']
'''

'''plt.figure(figsize=(22, 8), dpi=100)
plt.plot(train_year.trainDate, train_year.MeanTemp)
plt.title("Train Mean Temperature")
plt.xlabel("Date")
plt.ylabel("MeanTemp")
plt.show()'''

timeSeries = train_year.loc[:,["trainDate","MeanTemp"]]
timeSeries.index = timeSeries.trainDate
ts = timeSeries.drop("trainDate",axis=1)


'''print(ts)'''

from statsmodels.tsa.seasonal import seasonal_decompose
result = seasonal_decompose(ts['MeanTemp'], model='additive', period=12, extrapolate_trend='freq')

#fig = plt.figure()
fig = result.plot()
fig.set_size_inches(20, 15)
plt.plot((1,2,3))
plt.show()


import statsmodels.api as sm
fig = plt.figure(figsize=(20,8))
ax1 = fig.add_subplot(211)
fig = sm.graphics.tsa.plot_acf(ts, lags=20, ax=ax1)
plt.plot((1,2,3))
plt.show()


from statsmodels.tsa.stattools import adfuller
result = adfuller(ts)
print('ADF Statistic: %f' % result[0])
print('p-value: %f' % result[1])
print('Critical Values:')
for key, value in result[4].items():
    print('\t%s: %.3f' % (key, value))


ts_diff = ts - ts.shift()

import statsmodels.api as sm

fig = plt.figure(figsize=(20,8))
ax1 = fig.add_subplot(211)
fig = sm.graphics.tsa.plot_acf(ts_diff[1:], lags=20, ax=ax1) # ax2 = fig.add_subplot(212)
ax2 = fig.add_subplot(212)
fig = sm.graphics.tsa.plot_pacf(ts_diff[1:], lags=20, ax=ax2) # lags =40
plt.plot((1,2,3))
plt.show()

from statsmodels.tsa.arima_model import ARIMA
from pandas import datetime

model = ARIMA(ts, order=(1,0,1))
model_fit = model.fit(disp=0)



start_index = datetime(2000, 1, 1)
end_index = datetime(2020, 12, 1)

forecast = model_fit.predict(start=start_index, end=end_index, typ='levels')

plt.figure(figsize=(22,8))
plt.plot(train_year.trainDate,train_year.MeanTemp, label = "original")
plt.plot(forecast,label = "predicted")
plt.title("Time Series Forecast")
plt.xlabel("Date")
plt.ylabel("Mean Temperature")
plt.legend()
plt.show()


#잔차분석

#print('trainDate-------------------------')
#print(train_year.trainDate)

'''
resi = np.array(train_year[train_year.trainDate >= start_index].MeanTemp) - np.array(forecast)
plt.figure(figsize=(22,8))
plt.plot(train_year.trainDate[train_year.trainDate>=start_index],resi)
plt.xlabel("Date")
plt.ylabel("Residual")
plt.legend
plt.show()

#ACF그래프 및 ADF 검정을 통해 정상성 판단.

fig = plt.figure(figsize=(20,10))
ax1 = fig.add_subplot(211)
fig = sm.graphics.tsa.plot_acf(resi,lags=20, ax=ax1)
plt.plot((1,2,3))
plt.show()

result = adfuller(resi)
print('ADF Statistic : %f' %result[0])
print('p_value:%f' %result[1])
print('Critical Values:')
for key, value in result[4].items():
    print('\t%s: %.3f' %(key,value))
'''