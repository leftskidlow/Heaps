/* Initial Save Point
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
    
    // Public Methods
    
    // Add Method -> Adds a task to the heap
    func add(task: String, dueDate: Date) {
        let taskNode = TaskNode(task, dueDate)
        print("Adding [\(taskNode.getTask())]...")
        heap.append(taskNode)
        heapifyUp()
    }
    
    
    // Private Methods
    
    // HeapifyUp Method -> Makes sure the the parent node is older than its children
    private func heapifyUp() {
        
    }
    
    // Helper Methods -> Will be given to the learner in the form of an initial savepoint of an exercise
    private func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func indexExists(_ index: Int) -> Bool {
        return index < size
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

extension MinHeap: CustomStringConvertible {
    
    var description: String {
        var text = ""
        text += "Total outstanding tasks: \(size)\n"
        var taskNumber = 1
        for task in heap {
            text += "\(taskNumber): \(task)\n"
            taskNumber += 1
        }
        return String(text.dropLast(2))
    }
}
extension TaskNode: Comparable, CustomStringConvertible {
    static func < (lhs: TaskNode, rhs: TaskNode) -> Bool {
        lhs.dueDate < rhs.dueDate
    }
    
    static func == (lhs: TaskNode, rhs: TaskNode) -> Bool {
        lhs.dueDate == rhs.dueDate && lhs.task == rhs.task
    }
    var description: String {
        if dueDate < Date.now {
            return "LATE: \(task), Due: \(dueDate.formatted())"
        }
        return "\(task), Due: \(dueDate.formatted())"
    }
}
*/
/*
let toDoList: MinHeap = MinHeap();
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
toDoList.add(task: "Meeting: Annual Review", dueDate: dateFormatter.date(from: "05/01/2045 09:00")!)
toDoList.add(task: "Submit Initial Design Ideas", dueDate: dateFormatter.date(from: "05/01/2000 11:00")!)
print(toDoList)
 */

// Final Save Point
 
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
    
    // Public Methods
    
    // Add Method -> Adds a task to the heap
    func add(task: String, dueDate: Date) {
        let taskNode = TaskNode(task, dueDate)
        print("Adding [\(taskNode.getTask())]...")
        heap.append(taskNode)
        heapifyUp()
    }
    
    
    // Private Methods
    
    // HeapifyUp Method -> Makes sure the the parent node is older than its children
    private func heapifyUp() {
        
    }
    
    // Helper Methods -> Will be given to the learner in the form of an initial savepoint of an exercise
    private func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func indexExists(_ index: Int) -> Bool {
        return index < size
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

extension MinHeap: CustomStringConvertible {
    
    var description: String {
        var text = ""
        text += "Total outstanding tasks: \(size)\n"
        var taskNumber = 1
        for task in heap {
            text += "\(taskNumber): \(task)\n"
            taskNumber += 1
        }
        return String(text.dropLast(2))
    }
}
extension TaskNode: Comparable, CustomStringConvertible {
    static func < (lhs: TaskNode, rhs: TaskNode) -> Bool {
        lhs.dueDate < rhs.dueDate
    }
    
    static func == (lhs: TaskNode, rhs: TaskNode) -> Bool {
        lhs.dueDate == rhs.dueDate && lhs.task == rhs.task
    }
    var description: String {
        if dueDate < Date.now {
            return "LATE: \(task), Due: \(dueDate.formatted())"
        }
        return "\(task), Due: \(dueDate.formatted())"
    }
}

 let toDoList: MinHeap = MinHeap();
 let dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
 toDoList.add(task: "Meeting: Annual Review", dueDate: dateFormatter.date(from: "05/01/2045 09:00")!)
 toDoList.add(task: "Submit Initial Design Ideas", dueDate: dateFormatter.date(from: "05/01/2000 11:00")!)
 print(toDoList)
 //
