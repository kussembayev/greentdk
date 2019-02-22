import Vapor

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
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    router.get("trees") { req -> [Tree] in
        var trees = [Tree]()
        let tree = Tree(name: "Maria", iin: "302", id: 1, lat: 33.30303030, long: 34.00000)
        let tree2 = Tree(name: "Magdalena", iin: "303", id: 2, lat: 33.30303030, long: 34.00000)
        trees.append(tree)
        trees.append(tree2)
        
        return trees
    }
}
