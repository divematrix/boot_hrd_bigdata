class ClassVar:
    text_list = []        # 클래스 멤버

    def add(self, text):  # 멤버 메서드
        self.text_list.append(text)

    def print_list(self):
        print(self.text_list)

if __name__ == '__main__':
    a = ClassVar()
    a.add('a')
    a.print_list()

    b = ClassVar()
    b.add('b')
    b.print_list()