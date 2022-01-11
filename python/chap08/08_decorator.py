# 데코레이터(Decorator)

class Callable:
    def __call__(self):
        print("I am called.")

if __name__ == "__main__":
    obj = Callable()
    obj() # 인스턴스 뒤에 괄호()를 붙여 호출하면,
          # 내부적으로는 __call__(self) 메서드가 호출.