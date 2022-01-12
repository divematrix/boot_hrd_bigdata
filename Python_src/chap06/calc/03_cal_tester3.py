# 라이브러리 import 방법 3
# import한 함수(변수)의 불명확성, 가독성이 떨어짐. 비권장

from my_package.calculator import *

print(plus(10,5))
print(minus(10,5))
print(multiply(10,5))
print(divide(10,5))