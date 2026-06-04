import 'dart:io';

void main(List<String> args) {
  File file = File("05-file-handling/data/hello.txt");
  file.createSync();
  file.writeAsStringSync("Nguyen Huu Dat");
}
