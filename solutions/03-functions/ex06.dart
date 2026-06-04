String reverseString(String text) {
  String res = "";
  for (var i = text.length - 1; i >= 0; i--) {
    res += text[i];
  }
  return res;
}

void main(List<String> args) {
  print(reverseString("huudat"));
}
