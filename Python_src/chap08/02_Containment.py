# 자바의 복합관계 개념(has a ~)

class A:
    def methodA(self):
        print("methodA() 호출")

class B:
    def __init__(self):
        self.instance_of_A = A()

    def call_methodA(self):
        self.instance_of_A.methodA()

if __name__ == "__main__":
    a = A()
    a.methodA()

    b = B()
    b.call_methodA()