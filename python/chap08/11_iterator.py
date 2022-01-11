# Iterator와 순회 가능한 객체

'''
for i in range(5):
    print(i)

iterator = range(3).__iter__()
print(iterator.__next__())
print(iterator.__next__())
print(iterator.__next__())
#print(iterator.__next__())
'''

#####################################

class MyRange: # range() 함수와 같은 일을 하는 클래스 정의.
    def __init__(self, start, end):
        self.current = start
        self.end = end

    def __iter__(self):
        print('iter')
        return self

    def __next__(self):
        print('next')
        if self.current < self.end:
            current = self.current
            self.current += 1
            return current
        else:
            raise StopIteration()

if __name__ == "__main__":
    for i in MyRange(0, 5):
        print(i)