class ContactInfo:
    def __init__(self, name, email):
        self.name = name
        self.email = email

    def print_info(self):
        print('{0}:{1}'.format(self.name, self.email))

if __name__ == '__main__':
    hong = ContactInfo('홍길동', 'aaa@aaa.com')
    lee = ContactInfo('이순신', 'bbb@bbb.com')

    hong.print_info()
    lee.print_info()