import 'dart:io';

void main(List<String> args) {
  List<String> task = [];
  bool running = true;
  while (running) {
    stdout.write("""
1. Add Task
2. Remove Task
3. View Tasks
4. Exit

Enter choice: """);
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write("Enter job: ");
        String job = stdin.readLineSync()!;
        task.add(job);
        break;
      case 2:
        stdout.write("Enter remove index = ");
        int removeIndex = int.parse(stdin.readLineSync()!);
        task.removeAt(removeIndex);
        break;
      case 3:
        print("");
        print("List task: ");
        for (var i = 0; i < task.length; i++) {
          print("$i. ${task[i]}");
        }
        print("");
        break;
      case 4:
        running = false;
        break;
      default:
    }
    print("---");
  }
}
