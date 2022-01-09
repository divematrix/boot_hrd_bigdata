# RNN 텐서플로우 코드 구현
# - numpy=1.19 재설치

import tensorflow as tf
from tensorflow.keras.layers import Input, Dense, SimpleRNN
from tensorflow.keras.models import Model
import numpy as np

# 항상 같은 결과를 갖기 위해 랜덤 시드 설정
tf.random.set_seed(1)
np.random.seed(1)

# 입력값의 형태를 지정합니다.
inputs = Input(shape=(1,2))

"""
* RNN 셀의 속성을 지정.
  - 3: 3차원 벡터의 출력값 지정.
  - return_state=True: RNN 셀의 상태값(state)를 출력하도록 지정.
"""
output, state = SimpleRNN(3, return_state=True)(inputs)
model = Model(inputs=inputs, outputs=[output, state])

# 테스트 입력값
data = np.array([[ [1,2] ]])

# 출력값, 상태값 프린트
output, state = model.predict(data)
print("output: ",output)
print("state: ",state)

#위 코드의 출력값을 통해, 텐서플로우 RNN이 우리가 이론으로 다룬 RNN과 같은 것을 확인할 수 있다.
# - RNN 셀이 한개일 경우 그 출력값과 상태값이 동일.

# 입력값에 대한 가중치 행렬의 값을 확인.
print(model.layers[1].weights[0]) # 입력값이 1x2 행렬이므로 입력값에 대한 가중치 행렬은 2x3 행렬.

# 이전 상태값에 대한 가중치 행렬의 값을 확인.
print(model.layers[1].weights[1]) # 상태값이 1x3 행렬이므로, 상태값에 대한 가중치 행렬은 3x3 행렬.

# 편향값 행렬의 값을 확인.
print(model.layers[1].weights[2]) # 상태값이 3차원 벡터이므로, 3개의 편향값이 존재.


# 텐서플로우로 단어 품사 구분하기 예제 구현하기
# I      [1,0,0,0]
# work   [0,1,0,0]
# at     [0,0,1,0]
# google [0,0,0,1]
#
# I work at google =  [ [1,0,0,0], [0,1,0,0], [0,0,1,0], [0,0,0,1] ]
# I google at work =  [ [1,0,0,0], [0,0,0,1], [0,0,1,0], [0,1,0,0] ]

data = np.array([
    [ [1,0,0,0], [0,1,0,0], [0,0,1,0], [0,0,0,1] ],
    [ [1,0,0,0], [0,0,0,1], [0,0,1,0], [0,1,0,0] ]
])

# 입력값의 형태를 지정.
inputs = Input(shape=(4, 4))
"""
RNN 셀의 속성을 지정.
3: 3차원 벡터의 출력값 지정.
return_state=True: RNN 셀의 상태값(state)를 출력하도록 지정.
"""
output, state = SimpleRNN(3, return_state=True, return_sequences=True)(inputs)
model = Model(inputs=inputs, outputs=[output, state])

# 출력값, 상태값 프린트
# 1. 두 문장의 첫단어 출력값이 동일. 이는 첫단어에는 이전 상태값이 존재하지 않기 때문.
# 2. 두번째 단어부터의 출력값은 두 문장이 다르게 나타남. 이는 이전 상태값이 현재 출력값에 영향을 주기 때문.
output, state = model.predict(data)
print("I work at google: ",output[0])
print("I google at work: ",output[1])

# 3. 상태값은 항상 마지막 단어의 출력값과 동일
print("I work at google: state: ",state[0])
print("I google at work: state: ",state[1])
