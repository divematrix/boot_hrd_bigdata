#file = open('test.txt', 'w')
with open('test.txt', 'w+t') as file: # with 로 파일을 열면 범위가 끝난뒤 알아서 닫아줌
    file.write('hello ')

with open('test.txt', 'a+t') as file:
    file.write('python ')

with open('test.txt', 'r+t') as file:
    str = file.read()
    print(str)


'''
# 텍스트 파일 읽기 / 쓰기
  1. 문자열을 담은 리스트를 파일에 쓰는 writelines() 메서드
'''
'''
# ex1)
lines = ["we'll find a way we always have - Interstellar\n",
         "I'll find you and I'll kill you - Taken\n",
         "I'll be back - Terminator 2\n"]

with open('movie_quotes.txt', 'w') as file:
    for line in lines:
        file.write(line)
'''
'''
# ex2)
lines = ["we'll find a way we always have - Interstellar\n",
         "I'll find you and I'll kill you - Taken\n",
         "I'll be back - Terminator 2\n"]

with open('movie_quotes.txt', 'w') as file:
    file.writelines(lines)
'''
'''
# 텍스트 파일 읽기 / 쓰기
  2. 줄 단위로 텍스트를 읽는 readline() & readlines() 메서드
'''
'''
# ex1)
with open('movie_quotes.txt', 'r') as file:
    line = file.readline()

    while line != '':
        print(line, end='')
        line = file.readline()
'''
# ex2)
with open('movie_quotes.txt', 'r') as file:
    lines = file.readlines()
    line = ''
    for line in lines:
        print(line, end='')
