//
//  main.swift
//  2l_Porkhunova Anastasia
//
//  Created by Anastasia AS on 26/11/20.
//

import Foundation

//3.Создать возрастающий массив из 100 чисел.

var array = Array(1...100)
print("Массив: \(array)")


//1.Написать функцию, которая определяет, четное число или нет.

func even (i: Int) -> Bool {
    return i % 2 == 0
}

func odd (i: Int) -> Bool {
    return i % 2 != 0
}
print("Четные числа \(array.filter(even))\nНечетные числа \(array.filter(odd))")


//2.Написать функцию, которая определяет, делится ли число без остатка на 3.

func noResidue(i: Int) -> Bool {
    return i % 3 == 0
}

func withResidue(i: Int) -> Bool {
    return i % 3 != 0
}
print("Числа делятся на 3 без остатка \(array.filter(noResidue))\nЧисла делятся на 3 с остатком \(array.filter(withResidue))")

//4.Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var toDelete = array.filter {$0 % 2 != 0 && $0 % 3 == 0}
print("Результат удаления \(toDelete)")


