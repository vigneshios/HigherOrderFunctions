//
//  ViewController.swift
//  HigherOrderFunctionsUsage
//
//  Created by Apple on 03/07/20.
//  Copyright © 2020 Vignesh. All rights reserved.
//

import UIKit


struct Person {
    let name: String
    let address: String
    let age: Int
    let income: Double
    let cars: [String]
}

class ViewController: UIViewController {
    // Collections are responsible for holding the elements sequentially in most of the cases. Be it array, dictionary, sets

    var nameArr = ["aaa","bbb","ccc","aaa","ddd","bbb","ccc","bbb","eee","eee","fff"]

    let peopleArray = [ Person(name:"Santosh", address: "Pune, India", age:34, income: 100000.0, cars:["i20","Swift VXI"]),
    Person(name: "John", address:"New York, US", age: 23, income: 150000.0, cars:["Crita", "Swift VXI"]),
    Person(name:"Amit", address:"Nagpure, India", age:17, income: 200000.0, cars:Array())]
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        traditionalWay()
        filterHigherOrder()
        shortHandFilters()
        reduceHigherOrder()
        mapHigherOrder()
        
        
        
    }
    
    // 1.Using for loops and filtering out from array
    func traditionalWay() {
        var filteredArr = [String]()
        for name in nameArr {
            if name == "bbb" {
                filteredArr.append(name)
            }
        }
        print("1-Traditional:",filteredArr)
    }
    
    
    //2.Using higher order function - Filter
    func filterHigherOrder() {
        let filteredArr = nameArr.filter{(name:String) -> Bool in
            return name == "bbb"
        }
        print("2-Filter:",filteredArr)
    }
    
    //3.ShortHandFilters
    func shortHandFilters(){
        let filteredArr = nameArr.filter{return $0 == "eee"}
        print("3-Filter:",filteredArr)
        
        let filteredNames = peopleArray.filter( {$0.age > 18 }).map({ return $0.name })
        print("3.1-Filter:",filteredNames)
        
        
    }
    
    
    //4.Reduce
    func reduceHigherOrder(){
        let numArr = [1,2,3,4,5]
        let addNumArr = numArr.reduce(0, +)
        print("4.0-Reduce:",addNumArr)
        
        let mulNumArr = numArr.reduce(1, *)
        print("4.1-Reduce:",mulNumArr)
        
        
        let reducedStr = nameArr.reduce("", +)
        print("4.2-Reduce:",reducedStr)
    }
    
    //5.Map
    func mapHigherOrder() {
        let names = peopleArray.map{$0.name}
        print("5.0-Map:",names)
        
        let cars = peopleArray.map{(person) -> [String] in
            return person.cars
        }
        print("5.1-Map:",cars)
        
        let flatMapCars = peopleArray.flatMap{$0.cars}
        print("5.2-FlatMap:", flatMapCars) // flat map - removes nil from the optional.
        
    }
    


}

