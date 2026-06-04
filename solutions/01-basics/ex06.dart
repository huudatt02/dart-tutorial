import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter last name: ");
  String lastName = stdin.readLineSync()!;
  stdout.write("Enter first name: ");
  String firstName = stdin.readLineSync()!;
  String res = "";
  res = lastName + firstName;
  print(res);
}
