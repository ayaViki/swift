//
//  main.swift
//  5l_Porkhunova
//
//  Created by Anastasia AS on 11/12/20.
//

import Foundation
/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль. */
enum EnginePosition: String {
    case start = "Двигатель работает"
    case stop = "Двигатель не работает"
}
enum WindowsPosition: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}
enum Roof: String {
    case open = "Крыша автомобиля открыта"
    case close = "Крыша автомобиля закрыта"
}
enum CargoDoor: String {
    case open = "Грузовые двери открыты"
    case close = "Грузовые двери закрыты"
}
protocol Car {
    var brand: String { get }
    var yearProduction: Int { get }
    var enginePosition: EnginePosition { get set }
    var windowsPosition: WindowsPosition { get set }
}
extension Car {
    mutating func changeEnginePosition(enginePosition: EnginePosition){
        self.enginePosition = enginePosition
    }
    mutating func changeWindowsPosition(windowsPosition: WindowsPosition){
        self.windowsPosition = windowsPosition
    }
}
class SportCar: Car {
    var brand: String
    var yearProduction: Int
    var roof: Roof = .close
    var enginePosition: EnginePosition = .stop
    var windowsPosition: WindowsPosition = .close
    init(brand: String, yearProduction: Int) {
        self.brand = brand
        self.yearProduction = yearProduction
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        "\(brand), \(yearProduction) года выпуска, положение двигателя: \(enginePosition), положение окон: \(windowsPosition), положение крыши: \(roof)."
    }
}

class TrunkCar: Car {
    var brand: String
    var yearProduction: Int
    var cargoDoor: CargoDoor = .close
    var enginePosition: EnginePosition = .stop
    var windowsPosition: WindowsPosition = .close
    init(brand: String, yearProduction: Int) {
        self.brand = brand
        self.yearProduction = yearProduction
    }
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        "\(brand), \(yearProduction) года выпуска, положение двигателя: \(enginePosition.rawValue), положение окон: \(windowsPosition.rawValue), положение грузовых дверей: \(cargoDoor.rawValue)."
    }
}

var car1 = SportCar(brand: "Porsche", yearProduction: 2020)
car1.changeEnginePosition(enginePosition: .start)
car1.changeWindowsPosition(windowsPosition: .open)
car1.roof = .open
print(car1.description)
var car2 = TrunkCar(brand: "Volvo", yearProduction: 2010)
car2.changeEnginePosition(enginePosition: .start)
car2.changeWindowsPosition(windowsPosition: .open)
car2.cargoDoor = .open
print(car2.description)
