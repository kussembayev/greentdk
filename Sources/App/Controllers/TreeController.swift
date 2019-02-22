//
//  TreeController.swift
//  App
//
//  Created by Rauan Kussembayev on 2/22/19.
//

import Vapor

final class TreeController {
    
    // view with trees
    func list(_ req: Request) throws -> Future<[Tree]> {
        return Tree.query(on: req).all()
    }
    // create a new tree
    func create(_ req: Request) throws -> Future<Tree> {
        return try req.content.decode(Tree.self).flatMap { tree in
            return tree.save(on: req)
        }
    }
}
