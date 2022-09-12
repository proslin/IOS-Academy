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

func checkWord(word: String) -> [String] {
    for character in word {
        res = alphabet.filter{$0 != String(character)}
        alphabet = res
    }
    if res.count == 0 {res = alphabet}
    return res
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
let result = checkWord(word: word)

print(result)
print(separator)
 
 
//Работа 10
//Напишите программу, которая читает комбинацию букв и цифр и печатает первую цифру в ней. Гарантируется, что в комбинации есть хотя бы одна цифра.
var message10 = "   #######    Работа 10 Введите комбинацию букв и цифр  #######"
 
func findNumber(_ word: String) -> Bool{
    for character in word {
        if let intValue = character.wholeNumberValue {
            print("Первая встретившаяся цифра \(intValue)")
            return true
        }
    }
    return false
}
 
if !findNumber(readInput(message: message10)) { print("Цифр нет")}

print(separator)
 
 
// Работа 11
// Напишите программу, которая читает букву и печатает все предшествующие буквы английского алфавита.
let message11 = "   #######    Работа 11 Введите букву английского алфавита  #######"
var alphabet11 =  ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m","n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
 
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
 
let letter = readInput(message: message11)
print(printLetters(letter))
print(separator)
 
// Работа 12
//Напишите программу, которая читает слово и печатает количество символов, встречающихся в нем только один раз.
 
let message12 = "   #######    Работа 12 Введите слово  #######"
 
var word12 = readInput(message: message12).filter {$0 != " "}.map {String($0)}
var letters12 = [String: Int]()
for character in word12 {
   
    if (letters12.contains { $0.key == character}) {
        letters12[character]! += 1
        
    } else {
        letters12[character] = 1
    }
    
}

print("Количество символов, встречающихся 1 раз = \(letters12.filter {$0.value == 1}.count)")
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
        let filteredInput = input.filter { $0 != " "}
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

var xArray = [Int]()
var yArray = [Int]()

for elem in inputArray13 {
    xArray.append(elem.x)
    yArray.append(elem.y)
}

var arX = [1, 2, 3, 4, 5]
var arY = [1, 2, 3, 4, 5]
print("Свободные строки")
print(arX.filter{ !xArray.contains($0)}.map { String($0) }.joined(separator: " "))
print("Свободные столбцы")
print(arY.filter{ !yArray.contains($0)}.map { String($0) }.joined(separator: " "))
print(separator)

//Работа 14.
//Пароль трудно взломать, если он содержит не менее A прописных букв, не менее B строчных букв, не менее C цифр и содержит ровно N символов. Также пароль не может содержать два или более одинаковых символа, идущих друг за другом. Для заданных чисел A, B, C, N необходимо вывести пароль, соответствующий этим требованиям.
//Гарантируется, что A, B, C и N неотрицательные целые числа и A + B + C <= N. Имейте в виду, что любой параметр может быть равен нулю. Это означает, что ничего страшного, если пароль не содержит символов такого типа.

var inputArray14: [Int]
var stringArray14: [String]
var finalPasword: String
var numbers = [Int]()
var firstThreeSum = Int()

func getNumbers(input: [String]) -> [Int]?{
    var numbers =  [Int]()
    for element in input {
        guard let number = Int(element), number > 0 else {
            print("Не верный ввод")
            return nil
                
                }
        numbers.append(number)
    }
    return numbers
}

repeat {
    let message14 = "   #######    Работа 14 Введите A, B, C, N через пробел. A, B, C, N неотрицательные целые числа и A+B+C<=N    #######"
    let inputString14 = readInput(message: message14)
    stringArray14 = inputString14.components(separatedBy: " ")
    guard let number = getNumbers(input: stringArray14) else {
        continue
    }
   numbers = number
    if numbers.count == 4 {
    firstThreeSum = numbers.enumerated()
        .filter { $0.0 < 3 }
        .map{ $0.1 }
        .reduce(0, +)
        if firstThreeSum <= numbers[3] {
            break
        }
    }
} while true


let a = numbers[0]
let b = numbers[1]
let c = numbers[2]
let n = numbers[3]
let passwordCharsLower = "abcdefghijklmnopqrstuvwxyz"
let passwordCharsUpper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let passwordCharsNumber = "1234567890"
let passwordCharsAdditional = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
var charsMeetConditions = ""
let passwodrUpper = String((0..<a).compactMap { _ in passwordCharsUpper.randomElement()})
let passwodrLower = String((0..<b).compactMap { _ in passwordCharsLower.randomElement()})
let passwodrNumber = String((0..<c).compactMap { _ in passwordCharsNumber.randomElement()})
let possibleFinalChars = passwodrUpper + passwodrLower + passwodrNumber
if possibleFinalChars.count < n {
    let additionalChar = String((0..<(n - possibleFinalChars.count)).compactMap { _ in passwordCharsAdditional.randomElement()})
    finalPasword = possibleFinalChars + additionalChar
} else {
    finalPasword = possibleFinalChars
}
let finalShuffledPassword = String(finalPasword.shuffled())
print(finalShuffledPassword)
print(separator)



//Работа 15.
//Вы хотите взломать сайт и получить все доступные параметры. Выведите их « ключ : значение ». Если параметр не имеет значения, выведите « not found ».
//Если вы найдете пароль (параметр pass ), вы должны еще раз вывести его значение после всех параметров, но уже с ключом password . Если URL-адрес не содержит параметра pass , ничего не печатайте после параметров. Но если присутствует параметр pass , его значение не может быть пустым



var inputURL : String
var password : String = ""

func checkInputURL() -> String {
    var isCorrect: Bool = false
    var inputURL = String()
    repeat{
        print("   #######    Работа 15 Введите адрес сайта #######")
       // inputURL = "https://target.com/index.html?pass=12345&port=8080&cookie=&host=localhost"
        //inputURL = "https://target.com/index.html?port=8080&cookie=&host=localhost"
        inputURL = readInput(message: "")
        if inputURL.contains("https://") && inputURL.contains("?") && inputURL.contains("=") { isCorrect = true}
    } while !isCorrect
    return inputURL
}

func getURLParams(input: String) -> [String: String] {
    var arrayParam = [String]()
    var paramDict = [String: String]()
    guard let indexOpt = input.firstIndex(of: "?") else {
        print("Не корректный ввод")
        return [:]
    }
    let index = input.index(after: indexOpt)
    let paramString = String(input[index..<input.endIndex])
    arrayParam = paramString.components(separatedBy: "&")
    for elem in arrayParam {
        let parseElem = elem.components(separatedBy: "=")
        if let key = parseElem.first {
            if parseElem.last != "" {
                paramDict[key] = parseElem.last
            } else {
                paramDict[key] = "not found"
                
            }
    }
   
}
    //print(paramDict)
    return paramDict
}

func printURLParams(parameters: [String: String]) {
    var isPassword = false
    if parameters["pass"] != nil && parameters["pass"] != "" {
        print("pass: \(parameters["pass"] ?? "")")
        isPassword = true
    }
    print("port: \(parameters["port"] ?? "not found")")
    print("cookie: \(parameters["cookie"] ?? "not found")")
    print("host: \(parameters["host"] ?? "not found")")
    if isPassword { print("password: \(parameters["pass"] ?? "")")}
    
}

inputURL = checkInputURL()
let params = getURLParams(input: inputURL)
    printURLParams(parameters: params)
print(separator)



//Работа 16.
//Все буквы английского алфавита делятся на гласные и согласные.
//Гласные: а, e, i, o, u, y.
//Остальные буквы согласные.
//Слово считается благозвучным, если в нем нет трех и более гласных или согласных подряд. В противном случае он считается несогласованным. Ваша задача состоит в том, чтобы из неблагозвучных слов составить благозвучные. В слово можно вставлять любые буквы. Выведите минимальное количество символов, необходимое для составления благозвучного слова из заданного слова.
//Например, слово «schedule» считается неблагозвучным, потому что в нем три согласных подряд: «sch». Чтобы создать благозвучное слово, вам нужно добавить любую гласную между «s» и «c» или между «c» и «h».


//ошибки ввода- цифры не английские буквы пробелы
let vowels = "aeiouy"
let consonants = "bcdfghjklmnpqrstvwxz"
var string16 : String = ""//readInput()
var helpingArray : String = ""

func containsOnlyLetters(input: String) -> Bool {
    for elem in input {
        if (!(elem >= "a" && elem <= "z") && !(elem >= "A" && elem <= "Z")) {
            return false
        }
    }
    return true
}

repeat{
    let message16 = "   #######    Работа 16 Введите слово на английском языке (проверяем на благозвучность) #######"
    string16 = readInput(message: message16).lowercased()
}
while !containsOnlyLetters(input: string16.lowercased())
    
func letterCountIn(input: String) -> String {
   var currentLetter: Character?
   var returnValue = ""
   var letterCounter = 0
   for letter in input {
      if letter == currentLetter {
         letterCounter += 1
      } else {
         if let current = currentLetter {
            returnValue.append("\(current)\(letterCounter)")
}
          currentLetter = letter
                   letterCounter = 1
                }
          }
             if let current = currentLetter {
                returnValue.append("\(current)\(letterCounter)")
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
    guard let number = Int(String(elem)) else { continue }
    if number  % 2 == 0 && number > 3{
        minCharCount = minCharCount + (Int(floor(Double(number / 2))) - 1)
    } else if number % 2 != 0 && number >= 3 {
        minCharCount = minCharCount + Int(floor(Double(number / 2)))
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

//word17 = arrayInput[0]
//number17 = (arrayInput[1] as NSString).integerValue
if number17 > word17.count {
    print(word17)
} else {
print(String(word17.dropFirst(number17) + word17.prefix(number17)))
}

print(separator)

//Работа 18.
//Напишите программу, которая читает строку, а затем выводит строку без среднего символа, если длина нечетная, и без двух средних символов, если длина четная.
let message18 = "   #######    Работа 18 Введите слово  #######"

var input18 = readInput(message: message18)
//вычисляем середину слова
let ind = Int(floor(Double(input18.count / 2)))
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

let string19 = readInput(message: message19)
let substring19 = readInput(message: "")
let arrayString19 = string19.components(separatedBy: " ")
var count = 0
for str in arrayString19 {
    if str.contains(substring19) {
       count += 1
    }
}
print("Подстрока \(substring19) входит в данную строку \(count) раза")
print(separator)

//Работа 20.
//Напишите программу, которая читает строку и выводит true только тогда, когда буквы этой строки образуют подстроку упорядоченного английского алфавита, например, «abc», «xy», «pqrst».
//В противном случае он должен распечатать false.
//Примечание: строка может состоять из одного символа. Предположим, что пустая строка является подстрокой алфавита.

let message20 = "   #######    Работа 20 Введите строку. Программа выводит true только тогда, когда буквы этой строки образуют подстроку упорядоченного английского алфавита, например, «abc», «xy», «pqrst». #######"

let alphabet20 = "abcdefghijklmnopqrstuvwxyz"
let inputString20 = readInput(message: message20)
var flag : Bool

if alphabet20.contains(inputString20) {flag = true} else { flag = false }
print(flag)
print(separator)


//Работа 21.
//Дано число N с четным количеством цифр. Если сумма первой половины цифр равна сумме второй половины цифр, то это число считается счастливым. Для заданного числа выведите «YES», если это число удачное, иначе выведите «NO».


var inputString21 = String()
repeat {
    let message21 = "   #######    Работа 21 Введите число N с четным количеством цифр  #######"

     inputString21 = readInput(message: message21)
}
while (inputString21.count % 2 != 0) || inputString21.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil

let digits = inputString21.compactMap{ $0.wholeNumberValue }

let firstSumm = digits.enumerated()
    .filter { $0.0 <= digits.count / 2 - 1 }
    .map { $0.1 }
    .reduce(0, +)

let secondSumm = digits.enumerated()
    .filter { $0.0 > digits.count / 2 - 1 }
    .map { $0.1 }
    .reduce(0, +)

print(firstSumm == secondSumm ? "Yes" : "No")
print(separator)



//Работа 22.
//Напишите программу, которая читает строку и проверяет, является ли она палиндромом, т.е. читает одинаково как слева направо, так и справа налево.
//Программа должна вывести «yes» , если строка является палиндромом, и «no» в противном случае.

let message22 = "   #######    Работа 22 Введите слово для проверки является ли оно палиндромом  #######"
let inputString22 = readInput(message: message22)
let lowercased = inputString22.lowercased()
String(lowercased.reversed()) == lowercased ? print("Yes") : print("No")

//Работа 23.
//Павел любит ездить на общественном транспорте и после получения билета сразу же проверяет, попался ли ему счастливчик. Билет считается счастливым, если сумма первых трех чисел в этом билете совпадает с суммой трех последних чисел в том же билете.
//Однако Павел плохо считает в своей голове. Поэтому он просит вас написать программу, которая будет проверять равенство сумм и выводить «Счастливо», если суммы совпадают, и «Обычно», если суммы различаются.
//В качестве входных данных для программы предоставляется строка из шести цифр.
//Вам нужно распечатать только слово «Lucky» или «Regular» с большой буквы (без кавычек).

var inputString23 = String()
repeat {
    let message23 = "   #######    Работа 23 Введите число, состоящее из 6 цифр  #######"

     inputString23 = readInput(message: message23)
}
while (inputString23.count != 6) || inputString23.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil

let digitsInput = inputString23.compactMap{ $0.wholeNumberValue }

let firstPart = digitsInput.enumerated()
    .filter { $0.0 <= digits.count / 2 - 1 }
    .map { $0.1 }
    .reduce(0, +)

let secondPart = digitsInput.enumerated()
    .filter { $0.0 > digits.count / 2 - 1 }
    .map { $0.1 }
    .reduce(0, +)

print(firstPart == secondPart ? "Lucky" : "Regular")




