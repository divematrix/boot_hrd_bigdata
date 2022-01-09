import tensorflow as tf
from tensorflow.keras.layers import Input, Dense, LSTM
from tensorflow.keras.models import Model
import numpy as np

# 항상 같은 결과를 갖기 위해 랜덤 시드 설정
tf.random.set_seed(1)
np.random.seed(1)

# === pdf p17 참조. ===
# 아래 코드를 실행하여 LSTM의 출력값(y) 및 상태값(hidden state), 메모리셀(memory cell)값을 출력할 수 있음.
# 입력값의 형태를 지정.
inputs = Input(shape=(1,2))
"""
- RNN 셀의 속성을 지정.
  . 1차원 벡터의 출력값 지정.
  . return_state=True: LSTM 셀의 상태값, 메모리셀을 출력하도록 지정.
"""
lstm_out, hidden_state, cell_state = LSTM(1, return_state=True)(inputs)
model = Model(inputs=inputs, outputs=[lstm_out, hidden_state, cell_state])

data = np.array([
    [ [1,0] ]
])

# 출력값, 상태값, 메모리셀 프린트
lstm_out, hidden_state, cell_state = model.predict(data)
print("lstm_out: ",lstm_out)
print("hidden_state: ",hidden_state)
print("cell_state: ",cell_state)