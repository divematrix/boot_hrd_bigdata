# Overriding

class A:
    def method(self):
        print("A")

class B(A):
    def method(self):
        print("B")

class C(A):
    def method(self):
        print("C")

if __name__ == "__main__":
    A().method() # A
    B().method() # B
    C().method() # C