import sys
sys.path.append("C:\\workspace\\boot_hrd_bigdata\\Python_src")

# sys.path 경로 아래에 있는 패키지는 import 가능
from chap06.calc.luv_song import module02 as mod02

if __name__ == '__main__':
    print("== main ==")
    mod02.test()

# 서브모듈의 __name__이 메인모듈 임포트문의 경로.모듈명으로 나타남 (별칭은 안나타남)