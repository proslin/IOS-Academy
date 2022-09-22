import UIKit
import Foundation

//Работа 2.
//Написать функцию, которая определяет, четное число или нет.
//Написать функцию, которая определяет, делится ли число без остатка на 3. Создать возрастающий массив из 100 чисел.
//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

struct MathNumbers {
    static var array = Array(1...100)
//    static let filtered = array.filter { number in
//        if isEven(_:number) && checkNumber(number: number, divider: 3) {
//        return number
//        }
//    }
    
    static var filtered = array.filter { checkNumber(number: $0, divider: 3) && isOdd($0) }
    
    static func checkNumber(number a: Int, divider num: Int) -> Bool {
        a % num == 0
    }
    
    static func isOdd(_ num: Int) -> Bool {
        num % 2 != 0
    }
}


//проверяем число на четность
print(MathNumbers.isOdd(5))
//проверяем делится ли число на 3
print(MathNumbers.checkNumber(number: 6, divider: 3))
print("Исходный массив \(MathNumbers.array)")
//распечатываем отфильтрованный массив
print("Отфильтрованный массив \(MathNumbers.filtered)")


//Работа 3.
//Описать несколько структур – любой легковой автомобиль и любой грузовик.
//Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//Вывести значения свойств экземпляров в консоль.

enum CarState {
    case changeEngineState(_ isStarted: Bool)
    case changeWindowState(_ isOpened: Bool)
    case loadTrunk(_ volume: Int), unloadTrunk(_ volume: Int)
}

struct Car {
    let mark: String
    let year: Int
    var trunkVolume: Int
    var loadedTrunkVolume: Int = 0
    var isEngineStarted: Bool = false
    var isWindowOpened: Bool = false
    
    mutating func doAction(_ action: CarState) {
        switch action {
        case .changeEngineState(let isStarted):
            isEngineStarted = isStarted
        case .changeWindowState(let isOpened):
            isWindowOpened = isOpened
        case .loadTrunk(let volume):
            loadedTrunkVolume = volume
        case .unloadTrunk(let volume):
            loadedTrunkVolume = -volume
        }
    }
}

struct Trunk {
    let mark: String
    let year: Int
    var trunkBackVolume: Int
    var loadedTrunkBackVolume: Int = 0
    var isEngineStarted: Bool = false
    var isWindowOpened: Bool = false
    
    mutating func doAction(_ action: CarState) {
        switch action {
        case .changeEngineState(let isStarted):
            isEngineStarted = isStarted
        case .changeWindowState(let isOpened):
            isWindowOpened = isOpened
        case .loadTrunk(let volume):
            loadedTrunkBackVolume = volume
        case .unloadTrunk(let volume):
            loadedTrunkBackVolume = -volume
        }
    }
}

print("       ###### Задача 3 #######")
var car1 = Car(mark: "Ford", year: 2000, trunkVolume: 150)
print(car1)
car1.doAction(.changeWindowState(true))
car1.doAction(.loadTrunk(100))
print(car1)
car1.doAction(.unloadTrunk(20))
print(car1)

var car2 = Car(mark: "Audi", year: 2005, trunkVolume: 200)
print("Машина \(car2)")
car2.doAction(.changeWindowState(true))
car2.doAction(.changeEngineState(true))
print("Машина после преобразований \(car2)")

var trunk1 = Trunk(mark: "Suzuki", year: 1987, trunkBackVolume: 2000)
print("Грузовик \(trunk1)")
trunk1.doAction(.changeEngineState(true))
trunk1.doAction(.loadTrunk(1500))
print("Грузовик после преобразований\(trunk1)")



//Работа 4.
//Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//Описать пару его наследников trunkCar и sportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//Создать несколько объектов каждого класса. Применить к ним различные действия.
//Вывести значения свойств экземпляров в консоль.

enum CarStateClass {
    case changeEngineState(_ isStarted: Bool)
    case changeWindowState(_ isOpened: Bool)
    case loadTrunk(_ volume: Int), unloadTrunk(_ volume: Int)
    case openHatch(_ isOpened: Bool)
    case hangTrailer(_ isTrailerHang: Bool)
    case useNitro(_ isNitroUsed: Bool)
}

class CarClass {
    let mark: String
    let year: Int
    var trunkVolume: Int
    var loadedTrunkVolume: Int = 0
    var isEngineStarted: Bool = false
    var isWindowOpened: Bool = false
    
    init(mark: String, year: Int, trunkVolume: Int) {
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
    }
    
    func doAction(_ action: CarStateClass) {
    
    }
}

class SportCar: CarClass {
    var isNitroUsed = false
    var numberOfSeats: Int
    var isHatchOpened = false
    
    init(mark: String, year: Int, trunkVolume: Int, numberOfSeats: Int) {
        self.numberOfSeats = numberOfSeats
        super.init(mark: mark, year: year, trunkVolume: trunkVolume)
    }
    
    override func doAction(_ action: CarStateClass) {
        switch action {
        case .openHatch(let isOpened):
            isHatchOpened = isOpened
        case .useNitro(let isUsed):
            isNitroUsed = isUsed
        default:
            break
        
    }
}
}

class TrunkCar: CarClass {
    var numberOfAxis: Int
    var isTrailerHang: Bool = false
    
    init(mark: String, year: Int, trunkVolume: Int, numberOfAxis: Int) {
        self.numberOfAxis = numberOfAxis
        super.init(mark: mark, year: year, trunkVolume: trunkVolume)
    }
    
    override func doAction(_ action: CarStateClass) {
        switch action {
        case .hangTrailer(let isHang):
            isTrailerHang = isHang
        default:
            break
        }
    }
}


var sportcar1 = SportCar(mark: "Mustang", year: 1960, trunkVolume: 100, numberOfSeats: 2)
print("Спорткар \(sportcar1.isNitroUsed)")
print("Спорткар \(sportcar1.isHatchOpened)")
sportcar1.doAction(.useNitro(true))
print("Спорткар isNitroUsed \(sportcar1.isNitroUsed)")
sportcar1.doAction(.openHatch(true))
print("Спорткар isHatchOpened \(sportcar1.isHatchOpened)")

var trunkcar1 = TrunkCar(mark: "Suzuki", year: 2000, trunkVolume: 2000, numberOfAxis: 6)
print("Грузовик isTrailerHang \(trunkcar1.isTrailerHang)")
trunkcar1.doAction(.hangTrailer(true))
print("Грузовик isTrailerHang \(trunkcar1.isTrailerHang)")



//MARK: - Работа 5.
//Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить /заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//Создать два класса, имплементирующих протокол «Car»: trunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
//Создать несколько объектов каждого класса. Применить к ним различные действия.
//Вывести сами объекты в консоль.

protocol CarProtocol {
    var mark: String { get }
    var year: Int { get }
    var trunkVolume: Int { get }
    var loadedTrunkVolume: Int { get set }
    var isEngineStarted: Bool  { get set }
    var isWindowOpened: Bool  { get set }
    
    func doAction(_ action: CarStateClass)
}

extension CarProtocol {
    mutating func windowAction(_ isOpened: Bool) {
        isWindowOpened = isOpened
    }
    
    mutating func engineAction(_ isStarted: Bool) {
        isEngineStarted = isStarted
    }
    
    mutating func loadTrunk(_ volume: Int) {
        loadedTrunkVolume = volume
    }
}

class SportCarProtocol: CarProtocol {
    var mark: String
    var year: Int
    var trunkVolume: Int
    var loadedTrunkVolume: Int = 0
    var isEngineStarted: Bool = false
    var isWindowOpened: Bool = false
    var isNitroUsed = false
    var numberOfSeats: Int
    var isHatchOpened = false
    
    
    init(mark: String, year: Int, trunkVolume: Int, numberOfSeats: Int) {
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        self.numberOfSeats = numberOfSeats
    }
    
    
    func doAction(_ action: CarStateClass) {
        switch action {
        case .openHatch(let isOpened):
            isHatchOpened = isOpened
        case .useNitro(let isUsed):
            isNitroUsed = isUsed
        default:
            break
        }
    }
    
}

extension SportCarProtocol: CustomStringConvertible {
    var description: String {
        return "\(mark) год выпуска \(year) объем багажника \(trunkVolume) количество мест \(numberOfSeats) \(isNitroUsed ? "nitro use" : "nitro do not use") \(isHatchOpened ? "люк открыт" : "люк закрыт") "
    }
}


class TrunkCarProtocol: CarProtocol {
    var mark: String
    var year: Int
    var trunkVolume: Int
    var loadedTrunkVolume: Int = 0
    var isEngineStarted: Bool = false
    var isWindowOpened: Bool = false
    var numberOfAxis: Int
    var isTrailerHang: Bool = false
    
    init(mark: String, year: Int, trunkVolume: Int, numberOfAxis: Int) {
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        self.numberOfAxis = numberOfAxis
        
    }
    
    func doAction(_ action: CarStateClass) {
        switch action {
        case .hangTrailer(let isHang):
            isTrailerHang = isHang
        default:
            break
        }
    }
}
    extension TrunkCarProtocol: CustomStringConvertible {
        var description: String {
            return "\(mark) год выпуска \(year) объем багажника \(trunkVolume) количество осей \(numberOfAxis) \(isTrailerHang ? "прицеп присоединен" : "прицеп не присоединен") "
        }
    }


print("       ###### Задача 5 #######")

var sportCarProtocol1 = SportCarProtocol(mark: "Lamborgini", year: 2020, trunkVolume: 200, numberOfSeats: 2)
print(sportCarProtocol1)
sportCarProtocol1.doAction(.useNitro(true))
sportCarProtocol1.doAction(.openHatch(true))
print(sportCarProtocol1)

var trankCarProtocol1 = TrunkCarProtocol(mark: "Suzuki", year: 2010, trunkVolume: 2000, numberOfAxis: 6)
print(trankCarProtocol1)
trankCarProtocol1 .doAction(.hangTrailer(true))
print(trankCarProtocol1 )




