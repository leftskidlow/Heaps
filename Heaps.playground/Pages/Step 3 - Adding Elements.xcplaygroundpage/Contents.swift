import Foundation

class MinHeap {
    
    // Instance Variables
    private var heap: [TaskNode]
    private var size: Int {
        heap.count
    }
    
    // Initializer
    init() {
        self.heap = [];
    }
}

class TaskNode {
    
    // Instance Variables
    private var dueDate: Date
    private var task: String
    
    // Initializer
    init(_ task: String, _ dueDate: Date) {
        self.dueDate = dueDate
        self.task = task
    }
    
    // Getter Methods
    func getTask() -> String {
        return task
    }
}
