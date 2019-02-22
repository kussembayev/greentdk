import Vapor
import PostgreSQL

struct PostgreSQLVersion: Codable {
    let version: String
}


/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works, Kuzya!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    
//    router.get("trees") { req -> [Tree] in
//        var trees = [Tree]()
//
//        let tree = Tree(name: "Maria", iin: "302", id: 1, latitude: 45.000909, longitude: 78.345382)
//        let tree2 = Tree(name: "Magdalena", iin: "303", id: 2, latitude: 44.998618, longitude: 78.347849)
//
//        trees.append(tree)
//        trees.append(tree2)
//
//        return trees
//    }
    
    router.get("sql") { req in
        return req.withPooledConnection(to: .psql) { conn in
            return conn.raw("SELECT version()")
                .all(decoding: PostgreSQLVersion.self)
            }.map { rows in
                return rows[0].version
        }
    }
    
    let treeController = TreeController()
    router.get("trees", use: treeController.list)
    router.post("trees", use: treeController.create)
}
