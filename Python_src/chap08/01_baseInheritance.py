class Base:
    def __init__(self):
        print(self)
        self.message = "Hello, World."

    def print_message(self):
        print(self.message)

class Derived(Base):# Derived 클래스가 스스로 구현한 메서드는
    pass            # 없지만, Base로부터 물려 받은 print_message()
                    # 는 갖고 있음.

if __name__ == '__main__':
    base = Base()
    base.print_message()

    derived = Derived()
    derived.print_message()
