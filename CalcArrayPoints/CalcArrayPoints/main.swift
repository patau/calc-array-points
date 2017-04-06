//
//  main.swift
//  CalcArrayPoints
//
//  Created by Patricia Au on 4/5/17.
//  Copyright © 2017 Patricia Au. All rights reserved.
//

import Foundation

////////////////////////////////////////////////////////////////////////
//Calculator Functions
func add(x: Int, y: Int) -> Int {
    return x + y
}

func subtract(x: Int, y: Int) -> Int {
    return x - y
}

func multiply(x: Int, y: Int) -> Int {
    return x * y
}

func divide(x: Int, y: Int) -> Int {
    return x / y
}

func compute(x: Int, y: Int, mathFunction: (Int, Int) -> Int) -> Int {
    return mathFunction(x, y)
}
////////////////////////////////////////////////////////////////////////
//Array Functions
func addArray(arr: [Int]) -> Int {
    var runningSum: Int = 0
    for num in arr {
        runningSum += num
    }
    return runningSum
}

func multArray(arr: [Int]) -> Int {
    var runningProd: Int = 1
    for num in arr {
        runningProd *= num
    }
    return runningProd
}

func countArray(arr: [Int]) -> Int {
    return arr.count
}

func avgArray(arr: [Int]) -> Int {
    return addArray(arr: arr) / arr.count
}

func computeArray(arr: [Int], arrFunc: ([Int]) -> Int) -> Int {
    return arrFunc(arr)
}
////////////////////////////////////////////////////////////////////////
//Tuple Points
func makeTuple(s: String) -> (Int, Int) {
    var s = s
    s = s.replacingOccurrences(of: "(", with: "")
    s = s.replacingOccurrences(of: ")", with: "")
    s = s.replacingOccurrences(of: " ", with: "")
    var sCopy: [String] = s.components(separatedBy: ",") //Array of strings
    var point : (x: Int, y: Int) = (0, 0)
    point.x = Int(sCopy[0])!
    point.y = Int(sCopy[1])!
    return point
}

func addTuple(t1: String, t2: String) -> String {
    let t1 = t1
    let t2 = t2
    let t1Copy: (Int, Int) = makeTuple(s: t1)
    let t2Copy: (Int, Int) = makeTuple(s: t2)
    return "(\(t1Copy.0 + t2Copy.0), \(t1Copy.1 + t2Copy.1))"
}

func subTuple(t1: String, t2: String) -> String {
    let t1 = t1
    let t2 = t2
    let t1Copy: (Int, Int) = makeTuple(s: t1)
    let t2Copy: (Int, Int) = makeTuple(s: t2)
    return "(\(t1Copy.0 - t2Copy.0), \(t1Copy.1 - t2Copy.1))"
}

func computeTuple(t1: String, t2: String, tupleFunc: (String, String) -> String) -> String {
    return tupleFunc(t1, t2)
}
////////////////////////////////////////////////////////////////////////
//Dictionary Points
func makeDict(s: String) -> [String : Double] {
    var s = s
    s = s.replacingOccurrences(of: "(", with: "")
    s = s.replacingOccurrences(of: ")", with: "")
    s = s.replacingOccurrences(of: "[", with: "")
    s = s.replacingOccurrences(of: "]", with: "")
    s = s.replacingOccurrences(of: " ", with: "")
    s = s.replacingOccurrences(of: "x:", with: "")
    s = s.replacingOccurrences(of: "y:", with: "")
    var sCopy: [String] = s.components(separatedBy: ",") //Array of strings
    return ["x": Double(sCopy[0])!, "y": Double(sCopy[1])!]
}

func addDict(s1: String, s2: String) -> String {
    let s1 = s1
    let s2 = s2
    let s1Copy: [String : Double] = makeDict(s: s1)
    let s2Copy: [String : Double] = makeDict(s: s2)
    return "(\(s1Copy["x"]! + s2Copy["x"]!), \(s1Copy["y"]! + s2Copy["y"]!))"
}

func subDict(s1: String, s2: String) -> String {
    let s1 = s1
    let s2 = s2
    let s1Copy: [String : Double] = makeDict(s: s1)
    let s2Copy: [String : Double] = makeDict(s: s2)
    return "(\(s1Copy["x"]! - s2Copy["x"]!), \(s1Copy["y"]! - s2Copy["y"]!))"
}

func computeDict(s1: String, s2: String, dictFunc: (String, String) -> String) -> String {
    return dictFunc(s1, s2)
}
////////////////////////////////////////////////////////////////////////


print("Enter a value, point, or function to begin:")
let x = readLine(strippingNewline: true)!
print("Enter an array or numbers if using a function.\nProvide an operand if calculating numbers.")
var z: String = readLine(strippingNewline: true)!

if z != "+" && z != "-" && z != "*" && z != "/" {
    z = z.replacingOccurrences(of: " ", with: "")
    z = z.replacingOccurrences(of: "[", with: "")
    z = z.replacingOccurrences(of: "]", with: "")
    var parsedArr: [String] = z.components(separatedBy: ",")
    var numArr: [Int] = [Int]()
    for elements in parsedArr {
        numArr.append(Int(elements)!)
    }
    switch x {
    case "add":
        print(computeArray(arr: numArr, arrFunc: addArray))
    case "mul":
        print(computeArray(arr: numArr, arrFunc: multArray))
    case "count":
        print(computeArray(arr: numArr, arrFunc: countArray))
    case "avg":
        print(computeArray(arr: numArr, arrFunc: avgArray))
    default:
        print("Not a valid array function")
    }
} else if UInt(x) == nil {
    print("Enter a point:")
    var tuple2: String = readLine(strippingNewline: true)!
    print("Deal with tuple points or dictionary points?\nEnter \"tuple\" or \"dictionary\"")
    var decision: String = readLine(strippingNewline: true)!
    if decision.lowercased() == "tuple" {
        switch z {
        case "+":
            print(computeTuple(t1: x, t2: tuple2, tupleFunc: addTuple))
        case "-":
            print(computeTuple(t1: x, t2: tuple2, tupleFunc: subTuple))
        default:
            print("Available operands are: +, -")
        }
    } else if decision.lowercased() == "dictionary" {
        switch z {
        case "+":
            print(computeDict(s1: x, s2: tuple2, dictFunc: addDict))
        case "-":
            print(computeDict(s1: x, s2: tuple2, dictFunc: subDict))
        default:
            print("Available operands are: +, -")
        }
    } else {
        print("You're not supposed to see this! Now look what you've done :(")
    }
} else {
    print("Enter a number:")
    let y = UInt(readLine(strippingNewline: true)!)
    switch z {
    case "+":
        print(compute(x: Int(x)!, y: Int(y!), mathFunction: add))
    case "-":
        print(compute(x: Int(x)!, y: Int(y!), mathFunction: subtract))
    case "*":
        print(compute(x: Int(x)!, y: Int(y!), mathFunction: multiply))
    case "/":
        print(compute(x: Int(x)!, y: Int(y!), mathFunction: divide))
    default:
        print("Available operands are: +, -, *, /")
    }
}
