void main(List<String> args) {
  int a = 3;
  int b = 4;
  int temp = 0;

  temp = a;
  a = b;
  b = temp;

  print(a);
  print(b);
}
