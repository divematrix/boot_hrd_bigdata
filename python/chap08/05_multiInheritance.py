# 다중 상속시 주의 사항 - 죽음의 다아아몬드

class A:
    def method(self):
        print("A")

class B(A):
    def method(self):
        print("B")

class C(A):
    def method(self):
        print("C")

class D(B, C): # 다중 상속
    pass

if __name__ == "__main__":
    obj = D()
    obj.method()