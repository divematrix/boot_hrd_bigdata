import sys
sys.path.append("C:\\workspace\\class_bigdata_python")

# sys.path 경로 아래에 있는 패키지는 import 가능
from chap06.calc.luv_song import module02 as mod02

if __name__ == '__main__':
    print("== main ==")
    mod02.test()