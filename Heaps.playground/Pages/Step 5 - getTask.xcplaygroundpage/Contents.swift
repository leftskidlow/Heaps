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
    
    // Public Functions
    
    // Add Function -> Adds a task to the heap
    func add(task: String, dueDate: Date) {
        let taskNode = TaskNode(task, dueDate)
        print("Adding [\(taskNode.getTask())]...")
        heap.append(taskNode)
        heapifyUp()
    }
    
    // getTask Function -> Allows a user to see the task without removing it
    
    
    
    // Private Functions
    
    // HeapifyUp Function -> Makes sure the the parent node is older than its children
    private func heapifyUp() {
        var currentIndex = size - 1
        while currentIndex > 0 && heap[currentIndex] < heap[parentIndex(of: currentIndex)] {
            print("Heapifying (up) elements at index: \(currentIndex) & \(parentIndex(of: currentIndex))")
            heap.swapAt(currentIndex, parentIndex(of: currentIndex))
            currentIndex = parentIndex(of: currentIndex)
        }
    }
    
    // Helper Functions -> Will be given to the learner in the form of an initial savepoint of an exercise
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
    
    // Getter Functions
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
// Checkpoint 2
toDoList.add(task: "Mentor Intern", dueDate: dateFormatter.date(from: "09/15/2041 16:25")!)
toDoList.add(task: "Swap Laundry", dueDate: dateFormatter.date(from: "11/05/2003 13:00")!)
toDoList.add(task: "Run Anti Virus Software", dueDate: dateFormatter.date(from: "08/31/2009 23:30")!)
// Checkpoint 3



/* Final Save Point

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
    
    // Public Functions
    
    // Add Function -> Adds a task to the heap
    func add(task: String, dueDate: Date) {
        let taskNode = TaskNode(task, dueDate)
        print("Adding [\(taskNode.getTask())]...")
        heap.append(taskNode)
        heapifyUp()
    }
    
    // getTask Function -> Allows a user to see the task without removing it
    func getTask() {
        if heap.isEmpty {
            print("Your task list is empty, good job!")
        } else {
            print("Your next task is: \(heap[0])")
        }
    }
    
    // Private Functions
    
    // HeapifyUp Function -> Makes sure the the parent node is older than its children
    private func heapifyUp() {
        var currentIndex = size - 1
        while currentIndex > 0 && heap[currentIndex] < heap[parentIndex(of: currentIndex)] {
            print("Heapifying (up) elements at index: \(currentIndex) & \(parentIndex(of: currentIndex))")
            heap.swapAt(currentIndex, parentIndex(of: currentIndex))
            currentIndex = parentIndex(of: currentIndex)
        }
    }
    
    // Helper Functions -> Will be given to the learner in the form of an initial savepoint of an exercise
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
    
    // Getter Functions
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
 // Checkpoint 2
 toDoList.getTask()
 toDoList.add(task: "Mentor Intern", dueDate: dateFormatter.date(from: "09/15/2041 16:25")!)
 toDoList.add(task: "Swap Laundry", dueDate: dateFormatter.date(from: "11/05/2003 13:00")!)
 toDoList.add(task: "Run Anti Virus Software", dueDate: dateFormatter.date(from: "08/31/2009 23:30")!)
 // Checkpoint 3
toDoList.getTask()
*/
