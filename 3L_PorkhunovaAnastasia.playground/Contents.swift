import UIKit
/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль. */

enum EnginePosition {
    case start, stop
}

enum WindowsPosition {
    case open, close
}
enum TrankPosition {
    case full, empty
}

struct SportCar {
    let brand: String
    let yearProduction: Int
    var trankVolume: Double {
        willSet {
            if (trankStatus == .empty) && (trankVolume > 0) && (trankVolume != 0) && (newValue < trankVolume) {
                let volume = trankVolume - newValue
                print("Свободное место в багажнике: \(volume)")
            }
        }
    }
    var engine: EnginePosition {
        willSet {
            if newValue == .start {
                print("Двигатель работает")
            } else {
                print("Двигатель не работает")
            }
        }
    }
    var windows: WindowsPosition {
        willSet {
            if newValue == .open {
                print("Окна открыты")
            } else {
                print("Окна закрыты")
            }
        }
    }
    var trankStatus: TrankPosition {
        willSet {
            if newValue == .empty {
                print("Багажник пустой")
            } else {
                print("Багажник полный")
            }
        }
    }
    var transmission: String
    mutating func chamgeTransmission(i: String) {
        switch i {
        case "automat":
            self.transmission = "Автоматическая коробка передач"
        case "manual":
            self.transmission = "Механическая коробка передач"
        default:
            print("Inpur error")
        }
    }
}

var car1 = SportCar(brand: "Jaguar", yearProduction: 2018, trankVolume: 550, engine: EnginePosition.start, windows: WindowsPosition.close, trankStatus: TrankPosition.full, transmission: "automat")
print(car1.brand, car1.yearProduction)
car1.trankStatus = .empty
car1.trankVolume = 150
car1.chamgeTransmission(i: "manual")
car1.engine = .stop
car1.windows = .open
print(car1.transmission)

var car2 = SportCar(brand: "Fiat", yearProduction: 2016, trankVolume: 350, engine: EnginePosition.stop, windows: WindowsPosition.close, trankStatus: TrankPosition.empty, transmission: "manual")
print(car2.brand, car2.yearProduction)
car2.chamgeTransmission(i: "automat")
car2.trankStatus = .full
car2.engine = .start
car2.windows = .open
print(car2.transmission)

struct TrunKCar {
    let brand: String
    let yearProduction: Int
    var trankVolume: Double {
        willSet {
            if (trankStatus == .empty) && (trankVolume > 0) && (trankVolume != 0) && (newValue < trankVolume) {
                let volume = trankVolume - newValue
                print("Свободное место в багажнике: \(volume)")
            }
        }
    }
    var engine: EnginePosition {
        willSet {
            if newValue == .start {
                print("Двигатель работает")
            } else {
                print("Двигатель не работает")
            }
        }
    }
    var windows: WindowsPosition {
        willSet {
            if newValue == .open {
                print("Окна открыты")
            } else {
                print("Окна закрыты")
            }
        }
    }
    var trankStatus: TrankPosition {
        willSet {
            if newValue == .empty {
                print("Багажник пустой")
            } else {
                print("Багажник полный")
            }
        }
    }
    var transmission: String
    mutating func chamgeTransmission(i: String) {
        switch i {
        case "automat":
            self.transmission = "Автоматическая коробка передач"
        case "manual":
            self.transmission = "Механическая коробка передач"
        default:
            print("Inpur error")
        }
    }
}

var car3 = TrunKCar(brand: "Volvo", yearProduction: 2020, trankVolume: 16000, engine: EnginePosition.stop, windows: WindowsPosition.close, trankStatus: TrankPosition.empty, transmission: "automat")
print(car3.brand, car3.yearProduction)
car3.chamgeTransmission(i: "manual")
car3.trankStatus = .full
car3.engine = .start
car3.windows = .open
print(car3.transmission)

var car4 = TrunKCar(brand: "Nissan", yearProduction: 2010, trankVolume: 15000, engine: EnginePosition.start, windows: WindowsPosition.open, trankStatus: TrankPosition.full, transmission: "manual")
print(car4.brand, car4.yearProduction)
car4.chamgeTransmission(i: "manual")
car4.trankStatus = .full
car4.engine = .start
car4.windows = .open
print(car4.transmission)
