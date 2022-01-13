import sys
sys.path.append('C:/workspace/boot_hrd_bigdata/Python_src/chap06/calc')
# 상위 폴더로 가는 절대 경로

from luv_song import module01 as mod

if __name__ == '__main__':
    print("== main ==")
    mod.test()