import 'dart:io';

void main(List<String> args) {
  double total = 0;
  List<double> expenses = [];
  String choice = "y";
  while (choice == "y") {
    stdout.write("Enter expense = ");
    double expense = double.parse(stdin.readLineSync()!);
    expenses.add(expense);
    total += expense;

    stdout.write("Continue (y/n): ");
    choice = stdin.readLineSync()!;
  }
  print("Total = $total");
}
