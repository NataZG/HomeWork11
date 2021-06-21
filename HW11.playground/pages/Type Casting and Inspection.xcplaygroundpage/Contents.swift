/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
let array: [Any] = [0.1, 0.534789, 2, 48, "Ocean", "Mountain", true, false]

print(array)

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */

for item in array {
    switch item {
    case is Double:
        print("Double value is \(item)")
    case is Int:
        print("Integer value is \(item)")
    case is String:
        print("String value is \(item)")
    case is Bool:
        print("Bool value is \(item)")
    default:
        break
    }
}
/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
 */
let dictionary: [String: Any] = ["Double": 1.2, "Integer": 3, "String": "Ocean", "Bool true": true, "Bool false": false]

for (key, value) in dictionary {
    switch value {
    case is Double:
        print("\(key): \(value)")
    case is Int:
        print("\(key): \(value)")
    case is String:
        print("\(key): \(value)")
    case is Bool:
        print("\(key): \(value)")
    default:
        break
    }
}



/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
/*
var total = 0

for value in dictionary {
    if value is Int {
        total += value
    }
}
print ("\(total)")
 */
// таким образом у меня почему-то не считает :/


var values: [Any] = [1.2, 3, "Ocean", true, false]


func getTotalOfValues(values: [Any]) -> Double {

    var total: Double = 0

    for value in values {
        if let valueWithNumber = value as? Double {
            total += valueWithNumber
        }
        if let valueWithNumber = value as? Int {
            total += Double(valueWithNumber)
        }
        if let valueWithNumber = value as? String {
            total += Double(1)
        }
        if let valueWithNumber = value as? Bool, value as! Bool {
            total += Double(2)
        }
        if let valueWithNumber = value as? Bool, value as! Bool {
            total -= Double(3) // подозреваю, что условность значения Bool достигается не так, но работает же :D если ставлю == true - крешится и выдается ошибка
        }
    }

    return total
}

getTotalOfValues(values: values)
print(getTotalOfValues(values: values))
/*:
 Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
var values2: [Any] = [1.2, 3, "22", true, false]

func getTotalOfValues2(values: [Any]) -> Double {

    var total: Double = 0


    for value in values2 {
        switch value {
        case is Int:
            total += Double((value) as! Int)
        case is Double:
            total += value as! Double
      //  case is String:
        //    let newValue = Int(value) {
        //    total += Double(newValue)!
       //     } не работает :( не могу разобраться с этим
        default:
            break
        }
    }
        return total
    }
        
getTotalOfValues2(values: values)
print(getTotalOfValues2(values: values))

