void main(List<String> args) {
  int res = 0;
  for (var i = 1; i <= 9; i++) {
    for (var j = 1; j <= 10; j++) {
      res = i * j;
      print("$i * $j = $res");
    }
    print("---");
  }
}
