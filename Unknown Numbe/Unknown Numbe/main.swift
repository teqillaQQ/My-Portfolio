//  Created by Александр Савков on 19.01.22.

import Foundation

protocol CoordinatesProtocol {
    var x: Double { get }
    var y: Double { get }
    var z: Double { get }
}

struct Coordinates: CoordinatesProtocol {
    var x: Double
    var y: Double
    var z: Double
    
    init (x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}

var coodrdinatesArray = [Coordinates]()

func imputCoordinates ()  {
    while coodrdinatesArray.count < 3 {
        
        print("Введите координаты \(coodrdinatesArray.count + 1) точки (X, Y, Z)")
        print("X = ")
        guard let coordinateX = Double(readLine() ?? "") else {
            print("Вы ввели некорректное число. Попробуйте снова")
            continue }
        print("Y = ")
        guard let coordinateY = Double(readLine() ?? "") else {
            print("Вы ввели некорректное число. Попробуйте снова")
            continue }
        print("Z = ")
        guard let coordinateZ = Double(readLine() ?? "") else {
            print("Вы ввели некорректное число. Попробуйте снова")
            continue }
        coodrdinatesArray.append(Coordinates(x: coordinateX, y: coordinateY, z: coordinateZ))
    }
}

func distance(pointA: Coordinates, pointB: Coordinates) -> Double {
    let range: Double = sqrt( pow((pointB.x - pointA.x), 2) + pow((pointB.y - pointA.y), 2) + pow((pointB.z - pointA.z), 2))
    return range
}

imputCoordinates()

print("Рассмояние между первой и второй точкой \(String(format: "%.2F", distance(pointA: coodrdinatesArray[0], pointB: coodrdinatesArray[1])))")
print("Рассмояние между первой и второй точкой \(String(format: "%.2F", distance(pointA: coodrdinatesArray[1], pointB: coodrdinatesArray[2])))")

