import UIKit

struct MathTask {
    
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
            print("Дискриминант равен 0.  У уравнения есть один корень x1 = \(x1)")
        default:
            x1 = (-b + sqrt(d)) / (2 * a)
            x2 = (-b - sqrt(d)) / (2 * a)
            print("Дискриминант больше 0.  У уравнения есть два корня x1 = \(x1), x2 = \(x2)")
            
        }
    }
    
    //  функция считает площадь треугольника, периметр и гипотенузу
    static func triangle(a: Double, b: Double) {
        let s = 1/2 * a * b
        print("Площадь треугольника равна \(s)")
        let c = sqrt(pow(a, 2) + pow(b, 2))
        print("Гипотенуза треугольника равна \(c)")
        let p = a + b + c
        print("Периметр треугольника равен \(p)")
    }
    
    static func percentAmount(summa: Double, percent: Double) -> Double{
        return (summa * percent) / 100
    }
    
    static func depositAmount(amount: Double, percent: Double) {
        var sum = amount
        for i in 1...5 {
            sum =  percentAmount(summa: sum, percent: percent) + sum
            print(" В год \(i) сумма вклада составила \(sum)")
        }
        print("Сумма вклада по истечении 5 лет составила \(String(format:"%.2f", sum))")
    }
}


MathTask.quadEquation(a: 2, b: 6, c: 3)
MathTask.triangle(a: 2, b: 3)
MathTask.depositAmount(amount: 2000, percent: 7)
