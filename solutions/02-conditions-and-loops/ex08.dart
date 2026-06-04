import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter a = ");
  double a = double.parse(stdin.readLineSync()!);
  stdout.write("Enter b = ");
  double b = double.parse(stdin.readLineSync()!);
  stdout.write("Enter operator = ");
  String sign = stdin.readLineSync()!;
  double res = 0;

  switch (sign) {
    case "+":
      res = a + b;
      print("$a + $b  = $res");
      break;
    case "-":
      res = a - b;
      print("$a - $b  = $res");
      break;
    case "*":
      res = a * b;
      print("$a * $b  = $res");
      break;
    case "/":
      res = a / b;
      print("$a / $b  = $res");
      break;
    default:
      print("operator invalid");
  }
}
