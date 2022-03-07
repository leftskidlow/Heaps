/*
 Creates a heap that keeps track of the most overdue (oldest) task in your to do list.
 */

import Foundation

class MinHeap {
    
    // Instance Variables
    private var heap: [TaskNode]
    private var size: Int {
        heap.count
    }
    
    // Initializer
    init() {
        self.heap = []
    }
    
    // Public Facing Methods
    
    // Add Method -> Adds a task to the heap
    func add(task: String, dueDate: Date) {
        let taskNode = TaskNode(task, dueDate)
        print("Adding [\(taskNode.getTask())]...")
        heap.append(taskNode)
        heapifyUp()
    }
    
    // getTask Method -> Allows a user to see the task without removing it
    func getTask() {
        if heap.isEmpty {
            print("Your task list is empty, good job!")
            return
        }
        print("Your next task is: \(heap.first!)")
    }
    
    // finishTask Method -> Removes the task from the heap and reorganizes it
    func finishTask() {
        if heap.isEmpty {
            print("There are no tasks left to complete.")
            return
        } else {
            heap.swapAt(0, size - 1)
            print("Removing: \(heap.remove(at: size - 1))")
        }
        heapifyDown()
    }
    
    // Private Methods
    
    // HeapifyUp Method -> Makes sure the the parent node is older than its children
    private func heapifyUp() {
        var currentIndex = size - 1
        while currentIndex > 0 && heap[currentIndex] < heap[parentIndex(of: currentIndex)] {
            print("Heapifying (up) elements at index: \(currentIndex) & \(parentIndex(of: currentIndex))")
            heap.swapAt(currentIndex, parentIndex(of: currentIndex))
            currentIndex = parentIndex(of: currentIndex)
        }
    }
    
    // HeapifyDown Method -> Makes sure the older child is swapped with a younger parent
    private func heapifyDown() {
        var currentIndex = 0
        var toSwap: (needsToSwap: Bool, olderChildIndex: Int) = hasOlderChildren(currentIndex)
        while toSwap.needsToSwap {
            print("Heapifying (down) elements at index: \(currentIndex) & \(toSwap.olderChildIndex)")
            heap.swapAt(currentIndex, toSwap.olderChildIndex)
            currentIndex = toSwap.olderChildIndex
            toSwap = hasOlderChildren(currentIndex)
        }
    }
    
    // hasOlderChildren Method -> Determines if a parent has children to swap with and returns the bool to run the while loop and the index of the oldest child to swap with
    private func hasOlderChildren(_ currentIndex: Int) -> (Bool, Int) {
        var olderChild = false
        var olderChildIndex = 0
        
        let leftChildIndex = leftChildIndex(of: currentIndex)
        let rightChildIndex = rightChildIndex(of: currentIndex)
        if indexExists(leftChildIndex) && heap[currentIndex] > heap[leftChildIndex] {
            olderChild = true
            olderChildIndex = leftChildIndex
        }
        if indexExists(rightChildIndex)
            && heap[currentIndex] > heap[rightChildIndex]
            && heap[rightChildIndex] < heap[leftChildIndex]{
            olderChild = true
            olderChildIndex = rightChildIndex
        }
        return (olderChild, olderChildIndex)
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

// Extensions will be given to the learner (they won't make them) in the form of an initial savepoint of an exercise and discussed in the exercise body. They just completed similar protocol conformances in a previous lesson, don't want to distract from the data structure
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
class TaskNode {
    
    // Instance Variables
    private let dueDate: Date
    private let task: String
    
    // Initializer
    init(_ task: String, _ dueDate: Date) {
        self.dueDate = dueDate
        self.task = task
    }
    func getTask() -> String {
        return task
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


let test: MinHeap = MinHeap();
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
test.add(task: "Meeting: Annual Review", dueDate: dateFormatter.date(from: "05/01/2045 09:00")!)
test.add(task: "Submit Initial Design Ideas", dueDate: dateFormatter.date(from: "05/01/2000 11:00")!)
test.add(task: "Review Swift Fundamentals", dueDate: dateFormatter.date(from: "04/28/2000 19:00")!)
test.add(task: "Finish Lesson on Algorithms", dueDate: dateFormatter.date(from: "03/22/2000 13:45")!)
test.add(task: "Apply for Job", dueDate: dateFormatter.date(from: "06/17/2044 12:55")!)
test.add(task: "Finish Interview Prep", dueDate: dateFormatter.date(from: "07/25/2046 11:05")!)
test.add(task: "Complete Code Review", dueDate: dateFormatter.date(from: "10/29/2012 15:30")!)
test.add(task: "Mentor Intern", dueDate: dateFormatter.date(from: "09/15/2041 16:25")!)
test.add(task: "Swap Laundry", dueDate: dateFormatter.date(from: "11/05/2003 13:00")!)
test.add(task: "Run Anti Virus Software", dueDate: dateFormatter.date(from: "08/31/2009 23:30")!)
test.add(task: "Relax", dueDate: dateFormatter.date(from: "01/11/2100 19:00")!)
print(test)
test.getTask()
test.finishTask()
//test.finishTask()
//test.finishTask()
//test.finishTask()
//test.finishTask()
//test.finishTask()
print(test)
