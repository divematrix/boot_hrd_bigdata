class Car:
    def ride(self):
        print("Run")

class FlyingCar(Car):
    def ride(self):
        super().ride()# super()를 통해 부모 클래스 메서드 호출.
        print("Fly")

if __name__ == "__main__":
    car = Car()
    car.ride()

    myCar = FlyingCar()
    myCar.ride()
