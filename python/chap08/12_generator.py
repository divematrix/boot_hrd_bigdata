def generator():
    yield 0
    yield 1
    yield 2
    yield 3

######################
# 위와 동일 기능 정의
def YourRange(start, end):
    current = start

    while current < end:
        yield current
        current += 1

if __name__ == "__main__":
    iterator = generator()
    print(iterator.__next__())
    print(iterator.__next__())
    print(iterator.__next__())
    print(iterator.__next__())
    # print(iterator.__next__())
    print()

    for i in YourRange(0, 4):
        print(i)
