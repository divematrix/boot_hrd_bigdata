# @decorator

class MyDecorator:
    def __init__(self, f): # __init__() 함수의 매개변수를 통해
        # 함수를 받아들이고 데이터 속성에 저장해 둠.
        print("MyDecorator : __init__()")
        self.func = f

    def __call__(self):
        print("Begin:{}".format(self.func.__name__))

        self.func() # __call__(self) 메서드가 호출되면
                    # 생성자에서 저장해둔 함수(데이터 속성)를 호출.

        print("End:{}".format(self.func.__name__))

@MyDecorator
def print_hello():
    print("Hello.")

if __name__ == "__main__":
    print_hello()
