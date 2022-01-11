'''
# 예외처리 구문1
    try:
        # 문제가 없을 경우 실행 할 코드
    except:
        # 문제가 생겼을 때 실행 할 코드
'''

try:
    print(1/0)
except:
    print("예외가 발생했습니다.")

print("예외처리 끝.")


'''
# 파이썬의 예외 처리 구문2

    try:
        # 문제가 없을 경우 실행 할 코드

    except 예외형식1:
        # 문제가 생겼을 때 실행 할 코드

    except 예외형식2:
        # 문제가 생겼을 때 실행 할 코드

'''

my_list = [1, 2, 3]

try:
    print("첨자를 입력하세요:")
    index = int(input())
    print(my_list[index] / 0)
except ZeroDivisionError:
    print("0으로 나눌 수 없습니다.")
except IndexError:
    print("잘못된 첨자입니다.")

'''
# 파이썬의 예외 처리 구문3

    try:
        # 문제가 없을 경우 실행 할 코드

    except 예외형식1 as e:
        # 문제가 생겼을 때 실행 할 코드

    except 예외형식2 as e:
        # 문제가 생겼을 때 실행 할 코드

'''

my_list = [1, 2, 3]

try:
    print("첨자를 입력하세요:")
    index = int(input())
    print(my_list[index] / 0)
except ZeroDivisionError as e:
    print("0으로 나눌 수 없습니다. ({0})".format(e))
except IndexError as e:
    print("잘못된 첨자입니다. ({0})".format(e))


my_list = [1, 2, 3]

try:
    print("첨자를 입력하세요:")
    index = int(input())
    print(my_list[index] / 0)
except ZeroDivisionError as e:
    print("0으로 나눌 수 없습니다. ({0})".format(e))
except:
    print("예외가 발생했습니다.")

'''
# try절을 무사히 실행하면 만날 수 있는 else

    try:
        # 실행할 코드 블록

    except:
        # 예외 처리 코드 블록

    else:
        # except절을 만나지 않았을 경우 실행하는 코드 블록

'''

my_list = [1, 2, 3]

try:
    print("첨자를 입력하세요:")
    index = int(input())
    print("my_list[{0}]: {1}".format(index, my_list[index]))
except Exception as err:
    print("예외가 발생했습니다 ({0})".format(err))
else:
    print("리스트의 요소 출력에 성공했습니다.")

'''
# 반드시 실행되는 finally

    try:
        # 코드 블록

    except:
        # 코드 블록

    else:
        # 코드 블록

    finally:
        # 코드 블록

'''

my_list = [1, 2, 3]

try:
    print("첨자를 입력하세요:")
    index = int(input())
    print("my_list[{0}]: {1}".format(index, my_list[index]))
except Exception as err:
    print("예외가 발생했습니다 ({0})".format(err))
finally:
    print("어떤 일이 있어도 마무리합니다.")

my_list = [1, 2, 3]

try:
    print("첨자를 입력하세요:")
    index = int(input())
    print("my_list[{0}]: {1}".format(index, my_list[index]))
except Exception as err:
    print("예외가 발생했습니다 ({0})".format(err))
else:
    print("리스트의 요소 출력에 성공했습니다.")
finally:
    print("어떤 일이 있어도 마무리합니다.")

'''
# Exception 클래스

    BaseException
        SystemExit
        Keyboardinterrupt
        GeneratorExit
        Exception
            ...
            ArithmeticError
                ZeroDivsionError
                ...

            LookupError
                IndexError
                ...
            ...


'''

my_list = [1, 2, 3]

try:
    print("첨자를 입력하세요:")
    index = int(input())
    print(my_list[index] / 0)
except Exception as err:
    print("1) 예외가 발생했습니다. ({0})".format(err))
except ZeroDivisionError as err:
    print("2) 0으로 나눌 수 없습니다. ({0})".format(err))
except IndexError as err:
    print("3) 잘못된 첨자입니다. ({0})".format(err))

# 우리도 예외 좀 일으켜보자
# ex1)
text = input()
if text.isdigit() == False:
    raise Exception("입력 받은 문자열이 숫자로 구성되어 있지 않습니다.")

# ex2) 무조건 예외 발생
# raise Exception("예외를 일으킵니다.")


# ex3)
try:
    raise Exception("예외를 일으킵니다.")
except Exception as e:
    print("예외가 발생하였습니다. :{0}".format(e))


# ex4)
def some_function():
    print("1~10 사이의 수를 입력하세요:")
    num = int(input())
    if num < 1 or num > 10:
        raise Exception("유효하지 않은 숫자입니다.: {0}".format(num))
    else:
        print("입력한 수는 {0}입니다.".format(num))


try:
    some_function()
except Exception as err:
    print("예외가 발생했습니다. {0}".format(err))

'''

try:
    # 예외 발생

except:
    raise

'''


def some_function():
    print("1~10 사이의 수를 입력하세요:")
    num = int(input())
    if num < 1 or num > 10:
        raise Exception("유효하지 않은 숫자입니다.: {0}".format(num))
    else:
        print("입력한 수는 {0}입니다.".format(num))


def some_function_caller():
    try:
        some_function()
    except Exception as err:
        print("1) 예외가 발생했습니다. {0}".format(err))
        raise


try:
    some_function_caller()
except Exception as err:
    print("2) 예외가 발생했습니다. {0}".format(err))

'''
# 사용자 정의 예외 형식

class MyException(Exception):
    def __init__(self):
        super().__init__("MyException이 발생했습니다.")

if everything_is_fine == False:
    raise MyException()

'''


class InvalidIntException(Exception):
    def __init__(self, arg):
        super().__init__('정수가 아닙니다.: {0}'.format(arg))


def convert_to_integer(text):
    if text.isdigit():  # 부호(+, -) 처리 못함.
        return int(text)
    else:
        raise InvalidIntException(text)


if __name__ == '__main__':
    try:
        print('숫자를 입력하세요:')
        text = input()
        number = convert_to_integer(text)
    except InvalidIntException as err:
        print('예외가 발생했습니다 ({0})'.format(err))
    else:
        print('정수 형식으로 변환되었습니다 : {0}({1}'.format(number, type(number)))