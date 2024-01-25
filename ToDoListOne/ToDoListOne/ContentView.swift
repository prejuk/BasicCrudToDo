import SwiftUI

struct ContentView: View {
    
    @State private var listApp = ["Task 1", "Task 2", "Task 3"]
    @State private var newTask = ""
    
    var body: some View {
        VStack {
            TextField("Enter a new task", text: $newTask, onCommit: addTask)
                .padding()
            
            List {
                ForEach(listApp, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteTask)
            }
        }
    }
    
    func addTask() {
        // Append the new task to the listApp array
        if !newTask.isEmpty {
            listApp.append(newTask)
            // Clear the TextField after adding the task
            newTask = ""
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        // Remove tasks at the specified indices
        listApp.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
