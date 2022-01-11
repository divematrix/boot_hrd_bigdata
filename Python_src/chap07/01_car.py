class Car:
    def __init__(self):
        self.color = 0xFF0000       # 차량 색상 (빨강색)
        self.wheelSize = 16         # 바퀴의 크기
        self.displacement = 2000    # 엔진 배기량

    def forward(self):      # 전진
        pass

    def backward(self):     # 후진
        pass

    def turnleft(self):     # 좌회전
        pass

    def turnright(self):    # 우회전
        pass

if __name__ == '__main__':
    my_car = Car()  # Car 클래스의 객체 생성 후 my_car에 저장

    print('0x{:02X}'.format(my_car.color))
    # :02X -> 정수를 2자리의 16진수로 출력하되, 2자리 안되면 빈자리 0으로 채워 출력하라는 의미

    print(my_car.wheelSize)
    print(my_car.displacement)
    
    my_car.forward()    # my_car 멤버 메서드 호출
    my_car.backward()
    my_car.turnleft()
    my_car.turnright()