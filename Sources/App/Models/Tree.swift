//
//  Tree.swift
//  App
//
//  Created by Rauan Kussembayev on 2/22/19.
//


import Vapor
import FluentPostgreSQL

final class Tree: PostgreSQLModel {
    var id: Int?    
    var name: String
    var iin: String
    var latitude: Double
    var longitude: Double
    
    //Convinience method for instanciation of our object
    init(name: String, iin: String, id: Int, latitude: Double, longitude: Double) {
        self.name = name
        self.iin = iin
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Tree : Content {}

extension Tree : Migration {}

extension Tree : Parameter {}
