class InstanceVar:
    def __init__(self):
        self.text_list = []   # 인스턴스 멤버 변수

    def add(self, text):  # 멤버 메서드
        self.text_list.append(text)

    def print_list(self):
        print(self.text_list)

if __name__ == '__main__':
    a = InstanceVar()
    a.add('a')
    a.print_list()

    b = InstanceVar()
    b.add('b')
    b.print_list()