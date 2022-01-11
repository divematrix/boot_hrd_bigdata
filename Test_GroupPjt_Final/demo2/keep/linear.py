import pandas as pd

import matplotlib.pyplot as plt

from sklearn.linear_model import LinearRegression #선형회귀분석

import os
import warnings
warnings.filterwarnings("ignore")

#gasData = pd.read_csv('/data/한국가스공사_월간 시도별 도시가스 판매현황_20201231.csv',encoding='cp949')
#print(gasData.head(10))

#날씨 데이터 출력.
weatherData = pd.read_csv('data/2000-01~2021-11_월평균날씨.csv', encoding='cp949')
#print(weatherData.head(10))

#년도 분리
def extract_year(row):
    return row.split('-')[0]
def extract_month(row):
    return row.split('-')[1]
weatherData['년도'] = weatherData['일시'].apply(extract_year)
weatherData['월'] = weatherData['일시'].apply(extract_month)
weatherData = weatherData.loc[:,['일시','년도','월','평균기온(°C)','평균최고기온(°C)','평균최저기온(°C)']]

weatherData = weatherData.astype({'년도':'int'})
weatherData = weatherData.astype({'월':'int'})


train_year = (weatherData['년도'] <= 2018) # 2000~2018년도
test_year = (weatherData['년도'] == 2019)

iterval = 3

def make_data(data):
    x=[]
    y=[]
    temps = list(data['평균기온(°C)'])
    for i in range(len(temps)):
        if i <= iterval:continue
        y.append(temps[i])
        xa = []
        for p in range (iterval):
            d = i + p - iterval
            xa.append(temps[d])
        x.append(xa)
    return(x,y)

train_x, train_y = make_data(weatherData[train_year])
test_x, test_y = make_data(weatherData[test_year])

#학습하기
lr = LinearRegression(normalize=True)
lr.fit(train_x,train_y) #학습
pre_y = lr.predict(test_x) #예측하기

#결과 그래프로 그리기
plt.figure(figsize=(10,6),dpi=100)
plt.plot(test_y,c='r')
plt.plot(pre_y,c='b')
plt.xlabel('date')
plt.ylabel('mean temperature')
plt.legend
plt.show()