import sys

print(sys.builtin_module_names)

for path in sys.path:
    print(path)

"""
c:\workspace\class_bigdata_Python\chap06\calc
C:\DevEnv\Anaconda3\envs\bigdata\python38.zip
C:\DevEnv\Anaconda3\envs\bigdata\DLLs
C:\DevEnv\Anaconda3\envs\bigdata\lib
C:\DevEnv\Anaconda3\envs\bigdata
C:\DevEnv\Anaconda3\envs\bigdata\lib\site-packages
C:\DevEnv\Anaconda3\envs\bigdata\lib\site-packages\win32
C:\DevEnv\Anaconda3\envs\bigdata\lib\site-packages\win32\lib
C:\DevEnv\Anaconda3\envs\bigdata\lib\site-packages\Pythonwin
"""