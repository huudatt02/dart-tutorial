class Camera {
  int _id;
  String _brand;
  String _color;
  double _price;

  Camera(this._id, this._brand, this._color, this._price);

  int get id => _id;
  String get brand => _brand;
  String get color => _color;
  double get price => _price;

  set id(int id) {
    _id = id;
  }

  set brand(String brand) {
    _brand = brand;
  }

  set color(String color) {
    _color = color;
  }

  set price(double price) {
    _price = price;
  }

  @override
    String toString() {
      return "$_id $_brand $_color $_price";
    }
}

void main(List<String> args) {
  Camera camera1 = Camera(1, "Nikon", "Black", 2000);
  Camera camera2 = Camera(2, "Cannon", "Silver", 5000);
  Camera camera3 = Camera(3, "Sony", "Grey", 4000);

  print(camera1.toString());
  print(camera2.toString());
  print(camera3.toString());
}
