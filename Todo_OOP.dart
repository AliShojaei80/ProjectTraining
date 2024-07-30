import 'dart:io';

class Task {
  String title;
  String description;
  int priority;
  bool isCompleted;

  Task({required this.title, required this.description, required this.priority, this.isCompleted = false});
}

class TodoApp {
  List<Task> tasks = [];

  void run() {
    while (true) {
      print('1. Add a new task');
      print('2. Show task list');
      print('3. Exit');
      print('Please select an option:');

      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          addTask();
          break;
        case 2:
          showTasks();
          break;
        case 3:
          print('Exiting the program...');
          return;
        default:
          print('Invalid option');
      }
    }
  }

  void addTask() {
    print('Please enter the task title:');
    String title = stdin.readLineSync()!;

    print('Please enter the task description:');
    String description = stdin.readLineSync()!;

    print('Please enter the task priority (1: highest priority):');
    int priority = int.parse(stdin.readLineSync()!);

    // Check for duplicate priorities
    if (tasks.any((task) => task.priority == priority)) {
      print('Your option is invalid plz carefull for priority try again.');
      return;
    }

    Task newTask = Task(title: title, description: description, priority: priority);
    tasks.add(newTask);
    print('Task added successfully.');
  }

  void showTasks() {
    if (tasks.isEmpty) {
      print('There are no tasks.');
      return;
    }

    tasks.sort((a, b) => b.priority.compareTo(a.priority)); // Sort by priority
    for (var task in tasks) {
      print('Title: ${task.title}');
      print('Description: ${task.description}');
      print('Priority: ${task.priority}');
      print('Status: ${task.isCompleted ? 'Completed' : 'In progress'}');
      print('--------------------');
    }
  }
}

void main() {
  TodoApp app = TodoApp();
  app.run();
}
