import 'dart:io';

void main(List<String> args) {
  File file = File("05-file-handling/data/hello.txt");
  file.writeAsStringSync("Nguyen Thi Thanh Dao\n", mode: FileMode.append);
}
