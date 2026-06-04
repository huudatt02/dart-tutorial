void main(List<String> args) {
  Map<String, String> users = {"ADat": "0933884761", "Dao": "0584888574"};
  var res = users.keys.where((key) => key.length == 3);
  for (var user in res) {
    print("$user");
  }
}
