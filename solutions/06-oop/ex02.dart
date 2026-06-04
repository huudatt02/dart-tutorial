class House {
  int? id;
  String? name;
  double? price;

  House(this.id, this.name, this.price);
}

void main(List<String> args) {
  House house1 = House(1, "DatHouse", 5000);
  House house2 = House(2, "TinhHouse", 3000);
  House house3 = House(3, "MoHouse", 2000);

  List<House> houses = [];
  houses.add(house1);
  houses.add(house2);
  houses.add(house3);

  for (var house in houses) {
    print("${house.id} ${house.name} ${house.price}");
  }
}
