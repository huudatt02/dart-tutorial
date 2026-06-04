int calculateArea({int lenght = 1, int width = 1}) {
  return lenght * width;
}

void main(List<String> args) {
  print(calculateArea());
  print(calculateArea(lenght: 2, width: 4));
}
