//
//  main.swift
//  6l_Porkhunova
//
//  Created by Anastasia AS on 12/12/20.
//

import Foundation
/*
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
3. *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.*/

struct Client {
    var nameClient: String
    var orderPrice: Double
    
    
}
extension Client: CustomStringConvertible {
    var description: String {
        return "Клиент: \(nameClient), сумма заказа: \(orderPrice)"
    }
}

struct Queue<T> {
    var elements: [T] = []
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    var head: T? {
        return elements.first
    }
    var tail: T? {
        return elements.last
    }
   
    func filter(element: (T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if element(i) {
                result.append(i)
            }
        }
        return result
    }
}
var list1 = Queue<Client>()
list1.enqueue(element: .init(nameClient: "Anna", orderPrice: 1000.00))
list1.enqueue(element: .init(nameClient: "Kate", orderPrice: 230.00))
list1.enqueue(element: .init(nameClient: "Lena", orderPrice: 1500.00))
list1.enqueue(element: .init(nameClient: "Alex", orderPrice: 320.00))
print(list1.elements.description)
var lis = list1.filter(element: {$0.orderPrice >= 1000.00})
print(lis.description)

