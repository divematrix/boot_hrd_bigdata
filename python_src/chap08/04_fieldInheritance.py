# 데이터 속성(field) 상속(명시적으로 표현해 주어야 함)
# super():부모클래스의 객체 역할을 하는 프록시(Proxy)를 반환하는 내장함수.

class A:
    def __init__(self):
        print("A.__init__()")
        self.message = "Hello"

class B(A):
    def __init__(self):
        # A.__init__(self) # 명시적으로 표현.
        super().__init__() # 명시적으로 표현.
        print("B.__init__()")

if __name__ == "__main__":
    obj = B()

    print(obj.message)
    # error 이유:message는 A의 __init__() 안에서 생성되는데,
    # B의 인스턴스를 생성하면서 B.__init__()만 호출하고,
    # A.__init__()를 호출하지 않았기 때문.