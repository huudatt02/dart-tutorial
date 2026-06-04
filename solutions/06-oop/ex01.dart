class Laptop {
  int? id;
  String? name;
  int? ram;
}

void main(List<String> args) {
  Laptop laptop = Laptop();
  laptop.id = 1;
  laptop.name = "MacBook M1 Pro";
  laptop.ram = 32;

  print(laptop.id);
  print(laptop.name);
  print(laptop.ram);
}
