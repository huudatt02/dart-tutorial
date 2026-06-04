void main(List<String> args) {
  List<String> friends = [];
  friends.add("Nguyen Huu Dat");
  friends.add("Nguyen Thi Thanh Dao");
  friends.add("Le Trong Tinh");
  friends.add("Nguyen Vu Manh Ha");
  friends.add("Bui Thanh Dam");
  List<String> find = friends.where((name) => name.startsWith("N")).toList();
  for (var name in find) {
    print(name);
  }
}
