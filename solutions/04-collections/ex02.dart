void main(List<String> args) {
  var fruits = ["Cherry", "Blueberry", "Strawberry"];
  for (var i = 0; i < fruits.length; i++) {
    print(fruits[i]);
  }
  print("---");
  for (var fruit in fruits) {
    print(fruit);
  }
  print("---");
  fruits.forEach((n) => print(n));
}
