//
//  main.swift
//  1l_PorkhunovaAnastasia
//
//  Created by Anastasia AS on 25/11/20.
//

import Foundation

//1.Решить квадратное уравнение ax^2+bx+c=0

let a:Double = 2
let b:Double = 9
let c:Double = 3
var d:Double
var x1:Double
var x2:Double

d = pow(b,2) - 4 * a * c
print("Дискриминант = \(d)")

if d >= 0 {
    x1 = (-b + sqrt(d)) / (2*a)
    x2 = (-b - sqrt(d)) / (2*a)
    print("x1= \(x1)", "x2= \(x2)")
} else {
    print("Корней нет")
}

//2.Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let aTriangle:Double = 10
let bTriangle:Double = 20
var cTriangle:Double //Гипотенуза треугольника
var pTriangle:Double //Периметр треугольника
var sTriangle:Double //Площадь треугольника
cTriangle = sqrt(pow(aTriangle,2) + pow(bTriangle,2))
pTriangle = aTriangle + bTriangle + cTriangle
sTriangle = (aTriangle * bTriangle) / 2
print("Гипотенуза треугольника равна \(cTriangle)")
print("Периметр треугольника равен \(pTriangle)")
print("Площадь треугольника равна \(sTriangle)")

//3.Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через                             5 лет.


var depositAmount:Double = 1000
var annualParcentage:Double = 10
annualParcentage = annualParcentage / 100
for number in 1...5 {
    depositAmount = depositAmount + (depositAmount * annualParcentage)
    print("Размер вклада за \(number) год равен \(depositAmount)")
}


