import 'dart:io';

void main(List<String> args) {
  File file = File("05-file-handling/data/students.csv");
  String choice = "y";
  while (choice == "y") {
    stdout.write("Enter name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter age: ");
    int age = int.parse(stdin.readLineSync()!);

    stdout.write("Enter address: ");
    String address = stdin.readLineSync()!;

    file.writeAsStringSync("$name,$age,$address\n", mode: FileMode.append);

    stdout.write("Continue (y/n)? ");
    choice = stdin.readLineSync()!;
  }
  file.readAsLinesSync();
}
