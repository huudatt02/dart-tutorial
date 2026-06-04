int maxNumder(int a, int b, int c) {
  int largestNumber = 0;
  if (a >= b && a >= c) {
    largestNumber = a;
  } else if (b >= a && b >= c) {
    largestNumber = b;
  } else {
    largestNumber = c;
  }
  return largestNumber;
}

void main(List<String> args) {
  print(maxNumder(1, 2, 3));
}
