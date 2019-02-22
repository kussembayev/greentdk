//
//  Tree.swift
//  App
//
//  Created by Rauan Kussembayev on 2/22/19.
//


import Vapor

final class Tree: Content {
    
    //Add your properties like you normally would in iOS
    var name: String
    var iin: String
    var id: Int
    var lat: Double
    var long: Double
    
    //Convinience method for instanciation of our object
    init(name: String, iin: String, id: Int, lat: Double, long: Double) {
        self.name = name
        self.iin = iin
        self.id = id
        self.lat = lat
        self.long = long
    }
}
