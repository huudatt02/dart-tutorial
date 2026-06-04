void printEvenNumbers(int start, int end) {
  for (var i = start; i <= end; i++) {
    if ((i % 2) == 0) {
      print(i);
    }
  }
}

void main(List<String> args) {
  printEvenNumbers(2, 10);
}
