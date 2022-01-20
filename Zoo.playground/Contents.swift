import UIKit

//При помощи объектно-ориентированного подхода создать свой маленький кусочек дикой природы. В нём должны присутствовать, как минимум, 4 утки, 7 колибри, 3 медведя, 5 волков, павлин и 2 бобра. Все обитатели должны уметь делать базовые вещи такие как ходить, летать, есть (если это могут делать их прототипы из реальной жизни, например, очевидно, что медведь не умеет летать, а колибри ходить). Также необходимо придумать и реализовать механизм контроля текущего занятия животного (т.е. того, чем оно сейчас занимается: ест, спит, перемещается, охотится и т.п.).


class Animal {
    
    var name = "Animal"
    var age = 0
    var numberOfPaws = 4
    var weightKg = 0.0
    var currentState = ""
    
    var landAttack = false
    var landMovement = false
   
    var seaAttack = false
    var seaMovement = false
   
    var airAttack = false
    var airMovement = false
       
        init() {
        name = "Animal"
        age = 0
        numberOfPaws = 0
        weightKg = 0.0
            
        landAttack = false
        landMovement = false
       
        airAttack = false
        airMovement = false
       
        seaAttack = false
        seaMovement = false
    }
   
    func canLandAttack() -> Bool { return landAttack }
    func canLandMove() -> Bool { return landMovement }
   
    func canAirAttack() -> Bool { return airAttack }
    func canAirMove() -> Bool { return airMovement }
    
    func canSeaAttack() -> Bool { return seaAttack }
    func canSeaMovement() -> Bool { return seaMovement }
    
    final func doEat() { print("\(name) eating food") }
    
    func doLandAttack() {}
    func doLandMovement() {}
   
    func doSeaAttack() {}
    func doSeaMovement() {}
   
    func doAirAttack() {}
    func doAirMovement() {}
}

class AirAnimal: Animal {
    
    override init() {
        super.init()
        numberOfPaws = 2
        airMovement = true
    }
    override func doAirMovement() { print("\(name) fly") }
}

class LandAnimal: Animal {
    
    override init() {
        super.init()
        numberOfPaws = 4
        landMovement = true
    }
    override func doLandMovement() { print("\(name) walk") }
}

class Duck: AirAnimal {
    
    override init() {
        super.init()
        landMovement = true
        seaAttack = true
        seaMovement = true
    }
    override func doSeaAttack() { print("\(name) hunt for fish") }
    override func doSeaMovement() { print("\(name) swims") }
    override func doLandMovement() { print("\(name) walk") }
}
class Hummingbird: AirAnimal {
   
     func doSingASong() { print("\(name) chirp - chirp") }
}
class Peacock: AirAnimal {

    override init() {
        super.init()
        landMovement = true
    }
    override func doLandMovement() { print("\(name) walk") }
    func doShowTail() { print("\(name) shows the tail") }
}

class Bear: LandAnimal {
   
    override init() {
        super.init()
        landAttack = true
        seaAttack = true
        seaMovement = true
    }
    override func doLandAttack() { print("\(name) hunting for a rabbit") }
    override func doSeaAttack() { print("\(name) hunt for fish") }
    override func doSeaMovement() { print("\(name) swims") }
}
class Wolf: LandAnimal {

    override init() {
        super.init()
        landAttack = true
    }
    override func doLandAttack() { print("\(name) hunting for a rabbit") }
}
   
class Beaver: LandAnimal {
   
    override init() {
        super.init()
        seaAttack = true
        seaMovement = true
    }
       
    override func doSeaAttack() { print("\(name) hunt for fish") }
    override func doSeaMovement() { print("\(name) swims") }
}


var animals = [Animal]()

var duck1 = Duck()
duck1.name = "duck Abbey"
duck1.age = 2
duck1.weightKg = 10
duck1.currentState = "\(duck1.doEat())"

var duck2 = Duck()
duck2.name = "duck Ashley"
duck2.age = 4
duck2.weightKg = 9
duck2.currentState = "\(duck2.doAirMovement())"

var duck3 = Duck()
duck3.name = "duck Baby"
duck3.age = 1
duck3.weightKg = 12
duck3.currentState = "\(duck3.doLandMovement())"

var duck4 = Duck()
duck4.name = "duck Brandy"
duck4.age = 3
duck4.weightKg = 15
duck4.currentState = "\(duck4.doSeaAttack())"


var hummingbird1 = Hummingbird()
hummingbird1.name = "hummingbird Caitlyn"
hummingbird1.age = 1
hummingbird1.weightKg = 0.012
hummingbird1.currentState = "\(hummingbird1.doAirMovement())"

var hummingbird2 = Hummingbird()
hummingbird2.name = "hummingbird Cori"
hummingbird2.age = 2
hummingbird2.weightKg = 0.011
hummingbird2.currentState = "\(hummingbird2.doSingASong())"

var hummingbird3 = Hummingbird()
hummingbird3.name = "hummingbird Diva"
hummingbird3.age = 1
hummingbird3.weightKg = 0.009
hummingbird3.currentState = "\(hummingbird3.doEat())"

var hummingbird4 = Hummingbird()
hummingbird4.name = "hummingbird Dolly"
hummingbird4.age = 2
hummingbird4.weightKg = 0.014
hummingbird4.currentState = "\(hummingbird4.doSingASong())"

var hummingbird5 = Hummingbird()
hummingbird5.name = "hummingbird Erin"
hummingbird5.age = 1
hummingbird5.weightKg = 0.011
hummingbird5.currentState = "\(hummingbird5.doAirMovement())"

var hummingbird6 = Hummingbird()
hummingbird6.name = "hummingbird Cori"
hummingbird6.age = 3
hummingbird6.weightKg = 0.012
hummingbird6.currentState = "\(hummingbird6.doSingASong())"

var hummingbird7 = Hummingbird()
hummingbird7.name = "hummingbird Hussy"
hummingbird7.age = 2
hummingbird7.weightKg = 0.011
hummingbird7.currentState = "\(hummingbird7.doSingASong())"


var peacock1 = Peacock()
peacock1.name = "peacock Isha"
peacock1.age = 5
peacock1.weightKg = 25
peacock1.currentState = "\(peacock1.doLandMovement())"


var bear1 = Bear()
bear1.name = "bear Luna"
bear1.age = 7
bear1.weightKg = 220
bear1.currentState = "\(bear1.doLandAttack())"

var bear2 = Bear()
bear2.name = "bear Loki"
bear2.age = 10
bear2.weightKg = 250
bear2.currentState = "\(bear2.doSeaAttack())"

var bear3 = Bear()
bear3.name = "bear Kelly"
bear3.age = 15
bear3.weightKg = 300
bear3.currentState = "\(bear3.doLandMovement())"


var wolf1 = Wolf()
wolf1.name = "wolf Cliff"
wolf1.age = 15
wolf1.weightKg = 49
wolf1.currentState = "\(wolf1.doLandAttack())"

var wolf2 = Wolf()
wolf2.name = "wolf Chips"
wolf2.age = 9
wolf2.weightKg = 53
wolf2.currentState = "\(wolf2.doEat())"

var wolf3 = Wolf()
wolf3.name = "wolf Bruno"
wolf3.age = 8
wolf3.weightKg = 60
wolf3.currentState = "\(wolf3.doLandMovement())"

var wolf4 = Wolf()
wolf4.name = "wolf Barney"
wolf4.age = 7
wolf4.weightKg = 45
wolf4.currentState = "\(wolf4.doLandMovement())"

var wolf5 = Wolf()
wolf5.name = "wolf Alex"
wolf5.age = 12
wolf5.weightKg = 55
wolf5.currentState = "\(wolf5.doLandAttack())"


var beaver1 = Beaver()
beaver1.name = "beaver Dave"
beaver1.age = 6
beaver1.weightKg = 20
beaver1.currentState = "\(beaver1.doSeaMovement())"

var beaver2 = Beaver()
beaver2.name = "beaver Elvis"
beaver2.age = 5
beaver2.weightKg = 22
beaver2.currentState = "\(beaver2.doSeaAttack())"


animals.append(duck1)
animals.append(duck2)
animals.append(duck3)
animals.append(duck4)
animals.append(hummingbird1)
animals.append(hummingbird2)
animals.append(hummingbird3)
animals.append(hummingbird4)
animals.append(hummingbird5)
animals.append(hummingbird6)
animals.append(hummingbird7)
animals.append(peacock1)
animals.append(bear1)
animals.append(bear2)
animals.append(bear3)
animals.append(wolf1)
animals.append(wolf2)
animals.append(wolf3)
animals.append(wolf4)
animals.append(wolf5)
animals.append(beaver1)
animals.append(beaver2)
