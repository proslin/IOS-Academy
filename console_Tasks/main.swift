//
//  main.swift
//  console_Tasks
//
//  Created by Lina Prosvetova on 01.09.2022.
//

import Foundation
let separator = "                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@              "
//Работа 9.
//Напишите программу, которая читает слово и печатает все буквы алфавита, которые не используются в этом слове. Учитываются только строчные буквы.

var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m","n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

var message9 = "   #######    Работа 9 Введите слово не пустое  #######"

var res = [String]()

///Используюя filter
func checkWord(word: String) -> [String] {
    for character in word {
        res = alphabet.filter{ $0 != String(character) }
        alphabet = res
    }
    return res
}

/// Используя removeAll
func check(word: String) -> [String] {
    alphabet.removeAll(where: { word.contains(String($0)) })
    return alphabet
}

///используя remove(at:)
func checkWithRemove(word: String) -> [String] {
    for character in word {
        if let index = alphabet.firstIndex(where: { String(character) == $0 }) {
            alphabet.remove(at: index)
        }
    }
    return alphabet
}


func readInput(message: String) -> String {
    var inputStr: String
    repeat {
        print(message)
        inputStr = readLine() ?? ""
    } while inputStr.isEmpty
    
    return inputStr
}

let word = readInput(message: message9)
print(checkWithRemove(word: word))
//print(checkWord(word: word))
print(separator)
//print(check(word: word))



//Работа 10
//Напишите программу, которая читает комбинацию букв и цифр и печатает первую цифру в ней. Гарантируется, что в комбинации есть хотя бы одна цифра.
var message10 = "   #######    Работа 10 Введите комбинацию букв и цифр  #######"

func findNumber(_ word: String) -> Bool {
    for character in word {
        if let intValue = character.wholeNumberValue {
            print("Первая встретившаяся цифра \(intValue)")
            return true
        }
    }
    return false
}

/// Использую  first
func findNumberUsingFirst(_ word: String) -> String {
    if let firstNum = word.first(where: { $0.isWholeNumber }) {
        return String(firstNum)
    }
    return "No numbers"
}

//if !findNumber(readInput(message: message10)) { print("Цифр нет") }
//print(findNumberUsingFirst(readInput(message: message10)))
let word10 = readInput(message: message10)
print("Первая встретившаяся цифра \(word10.first(where: { $0.isNumber }) ?? "n")")
print(separator)


// Работа 11
// Напишите программу, которая читает букву и печатает все предшествующие буквы английского алфавита.
let message11 = "   #######    Работа 11 Введите одну букву английского алфавита  #######"
var alphabet11 =  ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m","n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

var alphabetString11 = "abcdefghijklmnopqrstuvwxyz"

var res11 = ""

func printLetters(_ word: String) -> String {
    for number in alphabet11 {
        if number != word {
            res11 += number
        } else {
            return res11
        }
    }
    return res11
}

///использую функцию  removeSubrange
func findSubrange(_ letter: String) -> String {
    if let letterIndex = alphabetString11.firstIndex(where: { String($0) == letter}) {
        let subrange = letterIndex..<alphabetString11.endIndex
        alphabetString11.removeSubrange(subrange)
        return alphabetString11
    }
    print("Вы ввели не подходящий символ")
    return alphabetString11
}

var letter = String()

repeat {
    letter = readInput(message: message11)
} while letter.count > 1

print(findSubrange(letter))
//print(printLetters(letter))
print(separator)

// Работа 12
//Напишите программу, которая читает слово и печатает количество символов, встречающихся в нем только один раз.

let message12 = "   #######    Работа 12 Введите слово  #######"

var word12 = readInput(message: message12)
var allLetters = Set<String>()
var duplicate = Set<String>()
for character in word12 {
    if allLetters.contains(String(character)) {
        duplicate.insert(String(character))
    } else {
        allLetters.insert(String(character))
    }
}

let uniqueLetters = allLetters.subtracting(duplicate)
print("Количество символов, встречающихся 1 раз = \(uniqueLetters.count)")
print(separator)

//Работа 13.
//Есть игра, в которой игрокам нужно выставлять корабли на поле боя. Давайте создадим программу, чтобы выяснить, где можно разместить корабли.
//У нас есть поле с 5 строками ( X ) и 5 ​​столбцами ( Y ), всего 25 ячеек. Напишите программу, которая считывает координаты ( X , Y ) трех кораблей размером с одну ячейку и печатает все доступные строки ( X ) и столбцы ( Y ) для новых кораблей.
//Новые корабли можно размещать только в свободных строках и столбцах, поэтому вам необходимо вывести номера строк и столбцов, в которых нет кораблей.
//Выведите строки ( X ) и столбцы ( Y ) в двух разных строках (список пустых строк в первой строке и список пустых столбцов в следующей строке). Все выходные координаты должны быть разделены пробелом . Не добавляйте лишние пробелы в конце строк вывода.
var inputArray13: [(x: Int, y: Int)] = []

var ship1 : (Int, Int)
var ship2 : (Int, Int)
var ship3 : (Int, Int)


func getCoordinateFrom(input: String) -> (x: Int, y: Int)? {
    //let filteredInput = input.filter { $0 != " " }
    let filteredInput = input.replacingOccurrences(of: " ", with: "")
    guard let charX = filteredInput.first, let x = Int(String(charX)), x <= 5,
          let charY = filteredInput.last, let y = Int(String(charY)), y <= 5
    else {
        return nil
    }
    return (x: x, y: y)
    
}

func readTripleInput() -> [(Int , Int)]? {
    print(" #######    Работа 13 Введите на каждой строке координаты корабля через пробел (числа от 1 до 5). Корабли можно размещать только на свободных местах. Дублировать координаты нельзя  #######")
    
    guard let ship1 = getCoordinateFrom(input: readInput(message: "")), ship1.x != 0, ship1.y != 0 else {
        return nil
    }
    guard let ship2 = getCoordinateFrom(input: readInput(message: "")), ship2.x != 0, ship2.y != 0 else {
        return nil
    }
    guard let ship3 = getCoordinateFrom(input: readInput(message: "")), ship3.x != 0, ship3.y != 0 else {
        return nil
    }
    
    if ship1 == ship2 || ship1 == ship3 || ship2 == ship3 { return nil }
    return [ship1, ship2, ship3]
}

repeat {
    guard let inputArray = readTripleInput() else { continue }
    inputArray13 = inputArray
} while inputArray13.count < 3

var occupiedRows = Set<Int>()
var occupiedColumns = Set<Int>()

for elem in inputArray13 {
    occupiedRows.insert(elem.x)
    occupiedColumns.insert(elem.y)
}

var allRows: Set = [1, 2, 3, 4, 5]
var allColumns: Set = [1, 2, 3, 4, 5]
print("Свободные строки")
print(allRows.subtracting(occupiedRows))
print("Свободные столбцы")
print(allColumns.subtracting(occupiedColumns))
print(separator)

//Работа 14.
//Пароль трудно взломать, если он содержит не менее A прописных букв, не менее B строчных букв, не менее C цифр и содержит ровно N символов. Также пароль не может содержать два или более одинаковых символа, идущих друг за другом. Для заданных чисел A, B, C, N необходимо вывести пароль, соответствующий этим требованиям.
//Гарантируется, что A, B, C и N неотрицательные целые числа и A + B + C <= N. Имейте в виду, что любой параметр может быть равен нулю. Это означает, что ничего страшного, если пароль не содержит символов такого типа.

var inputArray14: [Int]
var stringArray14: [String]
var numbers = [Int]()


func getNumbers(input: [String]) -> [Int]? {
    var numbers =  [Int]()
    for element in input {
        guard let number = Int(element), number >= 0 else {
            print("Не верный ввод")
            return nil
            
        }
        numbers.append(number)
    }
    return numbers
}

func isPasswordChecked(pas: String) -> Bool {
    let array = pas.map { String($0) }
    for item in 0 ..< array.count - 1 {
        if array[item] == array[item + 1] {
            return false
        }
    }
    return true
}

func generatePassword(numbers: [Int]) -> String {
    var finalPasword: String
    let a = numbers[0]
    let b = numbers[1]
    let c = numbers[2]
    let n = numbers[3]
    let passwordCharsLower = "abcdefghijklmnopqrstuvwxyz"
    let passwordCharsUpper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let passwordCharsNumber = "1234567890"
    let passwordCharsAdditional = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    let passwodrUpper = String((0..<a).compactMap { _ in passwordCharsUpper.randomElement() })
    let passwodrLower = String((0..<b).compactMap { _ in passwordCharsLower.randomElement() })
    let passwodrNumber = String((0..<c).compactMap { _ in passwordCharsNumber.randomElement() })
    let possibleFinalChars = passwodrUpper + passwodrLower + passwodrNumber
    if possibleFinalChars.count < n {
        let additionalChar = String((0..<(n - possibleFinalChars.count)).compactMap { _ in passwordCharsAdditional.randomElement() })
        finalPasword = possibleFinalChars + additionalChar
    } else {
        finalPasword = possibleFinalChars
    }
    //print("проверка пароля \(isPasswordChecked(pas: "r6yy3M5qs3BDU"))")
    return finalPasword
}

func getCheckedPassword() -> String {
    var finalPassword = generatePassword(numbers: numbers)
    var step = 0
    
    repeat {
        step += 1
        finalPassword = String(finalPassword.shuffled())
        if step == 10 {
            finalPassword = generatePassword(numbers: numbers)
        }
    } while !isPasswordChecked(pas: finalPassword)
    return finalPassword
}

repeat {
    var firstThreeSum = 0
    let message14 = "   #######    Работа 14 Введите A, B, C, N через пробел. A, B, C, N неотрицательные целые числа и A+B+C<=N    #######"
    let inputString14 = readInput(message: message14)
    stringArray14 = inputString14.components(separatedBy: " ")
    guard let number = getNumbers(input: stringArray14) else {
        continue
    }
    numbers = number
    if numbers.count == 4 {
        for idx in 0..<numbers.count - 1 {
           firstThreeSum += numbers[idx]
        }
        if firstThreeSum <= numbers[3] {
            break
        }
    }
} while true

print(getCheckedPassword())
print(separator)



//Работа 15.
//Вы хотите взломать сайт и получить все доступные параметры. Выведите их « ключ : значение ». Если параметр не имеет значения, выведите « not found ».
//Если вы найдете пароль (параметр pass ), вы должны еще раз вывести его значение после всех параметров, но уже с ключом password . Если URL-адрес не содержит параметра pass , ничего не печатайте после параметров. Но если присутствует параметр pass , его значение не может быть пустым

func getParamsFromURL() {
    repeat {
        print("   #######    Работа 15 Введите адрес сайта #######")
        //var input = "https://target.com/index.html?pass=12345&port=8080&cookie=&host=localhost"
        //var input = "https://target.com/index.html?port=8080&cookie=&host=localhost"
        let input = readInput(message: "")
        guard let urlComponents = URLComponents(string: input) else {
            print("Не корректный ввод")
            continue
        }
        guard let queryItems = urlComponents.queryItems else { break }
        var isPassword = false
        var password: String = ""
        for elem in queryItems {
            if elem.name == "pass" {
                isPassword = true
                password = elem.value ?? ""
            }
            if elem.value == "" {
                print("\(elem.name): \("not found")")
            } else {
                print("\(elem.name): \(elem.value ?? "not found")")
            }
        }
        if isPassword { print("password: \(password)") }
        break
    } while true
}

getParamsFromURL()
print(separator)



//Работа 16.
//Все буквы английского алфавита делятся на гласные и согласные.
//Гласные: а, e, i, o, u, y.
//Остальные буквы согласные.
//Слово считается благозвучным, если в нем нет трех и более гласных или согласных подряд. В противном случае он считается несогласованным. Ваша задача состоит в том, чтобы из неблагозвучных слов составить благозвучные. В слово можно вставлять любые буквы. Выведите минимальное количество символов, необходимое для составления благозвучного слова из заданного слова.
//Например, слово «schedule» считается неблагозвучным, потому что в нем три согласных подряд: «sch». Чтобы создать благозвучное слово, вам нужно добавить любую гласную между «s» и «c» или между «c» и «h».


let vowels = "aeiouy"
let consonants = "bcdfghjklmnpqrstvwxz"
var string16 : String = ""
var helpingArray : String = ""

func containsOnlyLetters(input: String) -> Bool {
    for elem in input {
        if (!(elem >= "a" && elem <= "z") && !(elem >= "A" && elem <= "Z")) {
            return false
        }
    }
    return true
}

repeat {
    let message16 = "   #######    Работа 16 Введите слово на английском языке (проверяем на благозвучность) #######"
    string16 = readInput(message: message16).lowercased()
} while !containsOnlyLetters(input: string16.lowercased())
        
func letterCountIn(input: String) -> [Int] {
    var prevLetter: Character?
    var returnValue = [Int]()
    var letterCounter = 0
    for currentLetter in input {
        if currentLetter == prevLetter {
            letterCounter += 1
        } else {
            if prevLetter != nil {
                returnValue.append(letterCounter)
            }
            prevLetter = currentLetter
            letterCounter = 1
        }
    }
        if prevLetter != nil {
            returnValue.append(letterCounter)
        
    }
    return returnValue
}


//заменяем гласные на "v" а согласные на "c"
for elem in string16.lowercased() {
    if vowels.contains(elem) {
        helpingArray.append("v")
    } else if consonants.contains(elem) {
        helpingArray.append("c") }
}

let arrayWithLetterCount = letterCountIn(input: String(helpingArray))
var minCharCount : Int = 0

for elem in arrayWithLetterCount {
    if elem % 3 > 1 && elem > 3 {
        minCharCount += elem / 3 + 1
    } else {
        minCharCount += elem / 3
    }
}
print(minCharCount)
print(separator)

//Работа 17.
//Напишите программу, которая читает строку s и целое число n , а затем перемещает первые n символов s в конец строки. Программа должна вывести измененную строку. Если n больше длины строки, он должен вывести строку без изменений.
//Формат входных данных
//Единственная входная строка содержит s и n , разделенные пробелом.

let message17 = "   #######    Работа 17 Введите слово и через пробел целое число на одной строке #######"

var number17 = Int()
var word17 = String()
var arrayInput: [String]
repeat {
    let input = readInput(message: message17)
    arrayInput = input.components(separatedBy: " ")
    word17 = arrayInput[0]
    guard let number = Int(arrayInput[1]) else { continue }
    number17 = number
} while arrayInput.count < 2

if number17 > word17.count {
    print(word17)
} else {
    print(String(word17.dropFirst(number17) + word17.prefix(number17)))
}

print(separator)

//Работа 18.
//Напишите программу, которая читает строку, а затем выводит строку без среднего символа, если длина нечетная, и без двух средних символов, если длина четная.
let message18 = "   #######    Работа 18 Введите слово не пустое  #######"

var input18 = readInput(message: message18)
//вычисляем середину слова
let ind = input18.count / 2
if input18.count % 2 == 0 {
    let index = input18.index(input18.startIndex, offsetBy: ind - 1)
    let range = index..<input18.index(index, offsetBy: 2)
    input18.removeSubrange(range)
    print(input18)
} else {
    let index = input18.index(input18.startIndex, offsetBy: ind)
    input18.remove(at: index)
    print(input18)
}
print(separator)


//Работа 19.
//Напишите программу, которая находит частоту вхождения подстроки в заданную строку. Формат входных данных
//Первая строка ввода содержит строку, вторая — подстроку.


let message19 = "   #######    Работа 19 Введите строку в первой строке ввода, подстроку во второй строке ввода  #######"

var string19 = readInput(message: message19)
var substring19 = readInput(message: "")
var count = 0
var elem: String


let additionalArr = string19.components(separatedBy: substring19)
print("Подстрока \(substring19) входит в данную строку \(additionalArr.count - 1) раза")

///вариант с удалением подстроки из строки
while string19.contains(substring19) {
    
    guard let range = string19.range(of: substring19) else {
        print("Строка не содержит данную подстроку \(substring19)")
        break }
    count += 1
    string19.removeSubrange(range)
}

//let arrayString19 = string19.components(separatedBy: " ")
//
//for str in arrayString19 {
//    if str.contains(substring19) {
//        count += 1
//    }
//}
print("Подстрока \(substring19) входит в данную строку \(count) раза")


//Работа 20.
//Напишите программу, которая читает строку и выводит true только тогда, когда буквы этой строки образуют подстроку упорядоченного английского алфавита, например, «abc», «xy», «pqrst».
//В противном случае он должен распечатать false.
//Примечание: строка может состоять из одного символа. Предположим, что пустая строка является подстрокой алфавита.

let message20 = "   #######    Работа 20 Введите строку. Программа выводит true только тогда, когда буквы этой строки образуют подстроку упорядоченного английского алфавита, например, «abc», «xy», «pqrst». #######"

print(message20)
let inputString20 = readLine() ?? ""

let alphabet20 = "abcdefghijklmnopqrstuvwxyz"

alphabet20.contains(inputString20) || inputString20 == "" ? print(true) : print(false)
print(separator)


//Работа 21.
//Дано число N с четным количеством цифр. Если сумма первой половины цифр равна сумме второй половины цифр, то это число считается счастливым. Для заданного числа выведите «YES», если это число удачное, иначе выведите «NO».


var inputString21 = String()
repeat {
    let message21 = "   #######    Работа 21 Введите число N с четным количеством цифр  #######"
    
    inputString21 = readInput(message: message21)
} while (inputString21.count % 2 != 0) || inputString21.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil
        
let digits = inputString21.compactMap{ $0.wholeNumberValue }
var firstSumm: Int = 0
var secondSumm: Int = 0

//let firstSumm = digits.enumerated()
//    .filter { $0.0 <= digits.count / 2 - 1 }
//    .map { $0.1 }
//    .reduce(0, +)
//
//let secondSumm = digits.enumerated()
//    .filter { $0.0 > digits.count / 2 - 1 }
//    .map { $0.1 }
//    .reduce(0, +)

for idx in 0..<digits.count / 2 {
    firstSumm += digits[idx]
    secondSumm += digits[digits.count - 1 - idx]
}

print(firstSumm == secondSumm ? "Yes" : "No")
print(separator)



//Работа 22.
//Напишите программу, которая читает строку и проверяет, является ли она палиндромом, т.е. читает одинаково как слева направо, так и справа налево.
//Программа должна вывести «yes» , если строка является палиндромом, и «no» в противном случае.

let message22 = "   #######    Работа 22 Введите слово для проверки является ли оно палиндромом  #######"
let inputString22 = readInput(message: message22)
let lowerСasedInputStr = inputString22.lowercased()
String(lowerСasedInputStr.reversed()) == lowerСasedInputStr ? print("Yes") : print("No")

//Работа 23.
//Павел любит ездить на общественном транспорте и после получения билета сразу же проверяет, попался ли ему счастливчик. Билет считается счастливым, если сумма первых трех чисел в этом билете совпадает с суммой трех последних чисел в том же билете.
//Однако Павел плохо считает в своей голове. Поэтому он просит вас написать программу, которая будет проверять равенство сумм и выводить «Счастливо», если суммы совпадают, и «Обычно», если суммы различаются.
//В качестве входных данных для программы предоставляется строка из шести цифр.
//Вам нужно распечатать только слово «Lucky» или «Regular» с большой буквы (без кавычек).

var inputString23 = String()
repeat {
    let message23 = "   #######    Работа 23 Введите число, состоящее из 6 цифр  #######"
    
    inputString23 = readInput(message: message23)
} while (inputString23.count != 6) || inputString23.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil
        
let digitsInput = inputString23.compactMap{ $0.wholeNumberValue }

var firstPart: Int = 0
var secondPart: Int = 0

//let firstPart = digitsInput.enumerated()
//    .filter { $0.0 <= digits.count / 2 - 1 }
//    .map { $0.1 }
//    .reduce(0, +)
//
//let secondPart = digitsInput.enumerated()
//    .filter { $0.0 > digits.count / 2 - 1 }
//    .map { $0.1 }
//    .reduce(0, +)

for idx in 0..<digits.count / 2 {
    firstPart += digits[idx]
    secondPart += digits[digits.count - 1 - idx]
}
print(firstPart)
print(secondPart)
print(firstPart == secondPart ? "Lucky" : "Regular")




