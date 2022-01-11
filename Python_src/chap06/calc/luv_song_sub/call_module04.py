import os
import sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
# 상위 폴더로 가는 상대 경로

from luv_song import module01 as mod

if __name__ == '__main__':
    print("== main ==")
    mod.test()