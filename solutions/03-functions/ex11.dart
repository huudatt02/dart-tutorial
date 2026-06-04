void createUser(String name, int age, {bool isActive = true}) {
  print("$name $age $isActive");
}

void main(List<String> args) {
  createUser("Nguyen Huu Dat", 24);
  createUser("Nguyen Thi Thanh Dao", 24, isActive: false);
}
