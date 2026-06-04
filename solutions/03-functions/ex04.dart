import 'dart:math';

String randomPassword() {
  String char =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  String res = "";
  Random random = new Random();
  for (var i = 0; i < 10; i++) {
    res += char[random.nextInt(char.length)];
  }
  return res;
}

void main(List<String> args) {
  print(randomPassword());
}
