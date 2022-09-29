import UIKit


enum PercentCapitalizaion {
    case capital
    case noCapital
}

struct MathTask {
    
    static func roundedToPlaces(input: Double, toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (input * divisor).rounded() / divisor
    }
    
    // функция решает квадратное уравнение
    static func quadEquation(a: Double, b: Double, c: Double) {
        guard a != 0 else {
            print(" Коэффициент а не должен быть равен 0")
            return
        }
        
        var x1 : Double
        var x2 : Double
        let d : Double
        d = b * b - 4 * a * c
        switch d {
        case  ..<0:
            print("Дискриминант меньше 0. Действительных корней нет.")
        case 0:
            x1 = -b / 2 * a
            x1 = (x1 == -0.0) ? -x1 : x1
            print("Дискриминант равен 0.  У уравнения есть один корень x1 = \(x1)")
        default:
            x1 = (-b + sqrt(d)) / (2 * a)
            let roundedX1 = roundedToPlaces(input: x1, toPlaces: 5)
            x2 = (-b - sqrt(d)) / (2 * a)
            let roundedX2 = roundedToPlaces(input: x2, toPlaces: 5)
            
            print("Дискриминант больше 0.  У уравнения есть два корня x1 = \(roundedX1) \(x1), x2 = \(roundedX2)")
            
        }
    }
    
    //  функция считает площадь треугольника, периметр и гипотенузу
    static func triangle(a: Double, b: Double) {
        guard a > 0 && b > 0 else {
            print("Катеты треугольника должны быть больше 0")
            return
        }
        let s = 1/2 * a * b
        print("Площадь треугольника равна \(s)")
        let c = sqrt(pow(a, 2) + pow(b, 2))
        print("Гипотенуза треугольника равна \(c)")
        let p = a + b + c
        print("Периметр треугольника равен \(p)")
    }
    
    static func percentAmount(summa: NSDecimalNumber, percent: NSDecimalNumber) -> NSDecimalNumber {
        return summa.multiplying(by: percent).dividing(by: 100)
    }
    
    static func depositAmount(amount: Double, percent: Double, capitalization: PercentCapitalizaion) {
        guard amount > 0 && percent > 0 else {
            print("Размер вклада и процент должны быть больше 0")
            return
        }
        //var sum = NSDecimalNumber(string: String(amount))
        var sum = NSDecimalNumber(value: amount)
//        print(sum)
//        print("из стринга \(sum)")
        let prcnt = NSDecimalNumber(string: String(percent))
        var accumulatedInterest = NSDecimalNumber.zero
        let behavior = NSDecimalNumberHandler(roundingMode: .down, scale: 4, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        //NSDecimalNumberHandler(roundingMode: .down, scale: 4)
        for i in 1...5 {
            switch capitalization {
            case .capital:
                sum = sum.adding(percentAmount(summa: sum, percent: prcnt))
                let roundedSum = sum.rounding(accordingToBehavior: behavior)
                print(" В год \(i) сумма вклада составила \(roundedSum)")
            case .noCapital:
                accumulatedInterest = accumulatedInterest.adding(percentAmount(summa: sum, percent: prcnt))
                print(" В год \(i) сумма вклада составила \(sum) размер процентов  \(accumulatedInterest)")
            }
        }
        let roundedSum = sum.adding(accumulatedInterest).rounding(accordingToBehavior: behavior)
        print("Сумма вклада по истечении 5 лет составила \(roundedSum)")
    }
}


MathTask.quadEquation(a: 8, b: 0, c: 0)
MathTask.quadEquation(a: 8, b: -11, c: -15)
MathTask.triangle(a: -22, b: 3)
MathTask.depositAmount(amount: 2000, percent: 7, capitalization: .noCapital)
MathTask.depositAmount(amount: 2000, percent: 7, capitalization: .capital)
