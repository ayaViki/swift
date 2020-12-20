//
//  main.swift
//  7l_Porkhunova
//
//  Created by Anastasia AS on 17/12/20.
//
/* 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch. */

// Суточная норма сухого корма для собак в питомнике

import Foundation


class NurseryFeeding {
    var dogs = [
        "Немецкая овчарка": 700,
        "Лабрадор": 400,
        "Лайка": 500
    ]
    
    func food(breed: String) -> Int? {
        return dogs[breed]
    }
    
    func averageFeedIntake() -> Int {
        guard dogs.count > 0 else {
            return 0
        }
        var foods = 0
        for dog in dogs {
            foods += dog.value
        }
        return foods / dogs.count
    }
}

let dog1 = NurseryFeeding()
print(dog1.dogs)
print(dog1.food(breed: "Немецкая овчарка")!)
print(dog1.averageFeedIntake())


struct Machine {
    var water: Int
    var coffeeDosi: Int
    var milk: Int
    var price: Int
    let coffeeTip: CoffeeTip
    
}

enum CoffeeMachineError: Error {
    case notEnoughWater
    case notEnoughCoffee
    case notEnoughMilk
    case notEnoughTip
    case notEnoughMoney(coinsNeeded: Int)
        
}
struct CoffeeTip {
    let name: String
}

class CoffeeMachine {
    var coffeeT = [
        "Capuchino": Machine(water: 300, coffeeDosi: 23, milk: 100, price: 50, coffeeTip: CoffeeTip(name: "Capuchino")),
        "Americano": Machine(water: 200, coffeeDosi: 20, milk: 0, price: 30, coffeeTip: CoffeeTip(name: "Americano")),
        "Coffee with milk": Machine(water: 100, coffeeDosi: 0, milk: 100, price: 40, coffeeTip: CoffeeTip(name: "Coffee with milk"))
    ]
    var coinsDeposited = 40
    
    func makeCoffee(name: String) throws {
        guard let myCoffee = coffeeT[name] else {
            throw CoffeeMachineError.notEnoughTip
        }
        guard myCoffee.water >= 100 else {
            throw CoffeeMachineError.notEnoughWater
        }
        guard myCoffee.coffeeDosi > 0 else {
            throw CoffeeMachineError.notEnoughCoffee
        }
        guard myCoffee.milk >= 50 else {
            throw CoffeeMachineError.notEnoughMilk
        }
        guard myCoffee.price <= coinsDeposited else {
            throw CoffeeMachineError.notEnoughMoney(coinsNeeded: myCoffee.price - coinsDeposited)
        }
        coinsDeposited -= myCoffee.price
        var newMyCoffee = myCoffee
        newMyCoffee.coffeeDosi -= 1
        newMyCoffee.milk -= 50
        newMyCoffee.water -= 100
        coffeeT[name] = newMyCoffee
        print(name)
    }
}
let coffeeMachine = CoffeeMachine()
do {
    try coffeeMachine.makeCoffee(name: "Capuchino")
} catch CoffeeMachineError.notEnoughCoffee {
    print("Недостаточно кофе")
} catch CoffeeMachineError.notEnoughMilk {
    print("Недостаточно молока")
} catch CoffeeMachineError.notEnoughWater {
    print("Недостаточно воды")
} catch CoffeeMachineError.notEnoughMoney( _) {
    print("Недостаточно средств")
} catch CoffeeMachineError.notEnoughTip {
    print("Ошибка выбора")
} catch {
    print("Неожиданная ошибка: \(error)")
}
