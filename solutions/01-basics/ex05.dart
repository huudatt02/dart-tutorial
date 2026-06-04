import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter a = ");
  int a = int.parse(stdin.readLineSync()!);
  int res = 0;
  res = a * a;
  print(res);
}
