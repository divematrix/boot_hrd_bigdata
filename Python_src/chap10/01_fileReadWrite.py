# file에 write 하기.

file = open('test.txt', 'w')
file.write('hello')
file.close()

# file에서 데이터 읽어오기
file = open('test.txt', 'r')
str = file.read()
print(str)
file.close()