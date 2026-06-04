class Animal {
  int id;
  String name;
  String color;
  Animal(this.id, this.name, this.color);
}

class Cat extends Animal {
  String sound;
  Cat(int id, String name, String color, this.sound) : super(id, name, color);

  @override
  String toString() {
    return "$id $name $color $sound";
  }
}

void main(List<String> args) {
  Cat cat = Cat(1, "Cam", "Orange", "Meow meow");
  print(cat.id);
  print(cat.name);
  print(cat.color);
  print(cat.sound);
  print(cat.toString());
}
