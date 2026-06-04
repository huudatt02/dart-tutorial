import 'dart:io';

void main(List<String> args) {
  for (var i = 1; i <= 100; i++) {
    File file = File("05-file-handling/data/file_$i.txt");
    file.createSync();
  }
}
