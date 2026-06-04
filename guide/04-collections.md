# Tổng Hợp Collections Trong Dart

Collections là các cấu trúc dữ liệu dùng để lưu trữ nhiều giá trị.

Các collection phổ biến trong Dart:

- List
- Set
- Map
- Queue
- Iterable

---

# 1. List

`List` là tập hợp có thứ tự và cho phép phần tử trùng lặp.

```dart
List<String> fruits = [
  "Apple",
  "Banana",
  "Orange",
];
```

Hoặc:

```dart
var fruits = ["Apple", "Banana"];
```

## Truy cập phần tử

```dart
print(fruits[0]);
print(fruits[1]);
```

## Thuộc tính thường dùng

```dart
print(fruits.length);
print(fruits.first);
print(fruits.last);
print(fruits.isEmpty);
print(fruits.isNotEmpty);
```

## Thêm phần tử

```dart
fruits.add("Mango");

fruits.addAll([
  "Kiwi",
  "Grape",
]);
```

## Chèn phần tử

```dart
fruits.insert(1, "Watermelon");

fruits.insertAll(2, [
  "A",
  "B",
]);
```

## Xóa phần tử

```dart
fruits.remove("Apple");

fruits.removeAt(0);

fruits.removeLast();

fruits.clear();
```

## Duyệt List

```dart
for (var fruit in fruits) {
  print(fruit);
}
```

```dart
fruits.forEach((fruit) {
  print(fruit);
});
```

## where()

Lọc dữ liệu.

```dart
var numbers = [1, 2, 3, 4, 5, 6];

var evenNumbers =
    numbers.where((n) => n % 2 == 0);

print(evenNumbers);
```

Đổi sang List:

```dart
var evenNumbers =
    numbers.where((n) => n % 2 == 0).toList();
```

## map()

Biến đổi dữ liệu.

```dart
var numbers = [1, 2, 3];

var doubled =
    numbers.map((n) => n * 2);

print(doubled);
```

Đổi sang List:

```dart
var doubled =
    numbers.map((n) => n * 2).toList();
```

## any()

```dart
var hasEven =
    numbers.any((n) => n % 2 == 0);
```

## every()

```dart
var allPositive =
    numbers.every((n) => n > 0);
```

## contains()

```dart
print(numbers.contains(3));
```

## sort()

```dart
numbers.sort();

numbers.sort(
  (a, b) => b.compareTo(a),
);
```

## reversed

```dart
print(numbers.reversed);
```

```dart
print(
  numbers.reversed.toList(),
);
```

---

# 2. Set

`Set` là tập hợp không chứa phần tử trùng lặp.

```dart
Set<String> names = {
  "Dat",
  "An",
  "Dat",
};

print(names);
```

Kết quả:

```dart
{Dat, An}
```

## Thêm dữ liệu

```dart
names.add("Huy");

names.addAll({
  "Nam",
  "Khanh",
});
```

## Xóa dữ liệu

```dart
names.remove("Dat");

names.clear();
```

## Kiểm tra

```dart
print(names.contains("An"));
```

## Duyệt Set

```dart
for (var name in names) {
  print(name);
}
```

## Chuyển Set sang List

```dart
var list = names.toList();
```

---

# 3. Map

`Map` lưu dữ liệu theo dạng key-value.

```dart
Map<String, int> scores = {
  "Dat": 90,
  "An": 85,
};
```

## Truy cập

```dart
print(scores["Dat"]);
```

## Thêm dữ liệu

```dart
scores["Huy"] = 100;
```

## Cập nhật

```dart
scores["Dat"] = 95;
```

## Xóa

```dart
scores.remove("An");
```

## Kiểm tra

```dart
print(scores.containsKey("Dat"));

print(scores.containsValue(95));
```

## Duyệt Map

```dart
scores.forEach((key, value) {
  print("$key : $value");
});
```

## Lấy keys

```dart
print(scores.keys);
```

## Lấy values

```dart
print(scores.values);
```

## Lấy entries

```dart
for (var entry in scores.entries) {
  print(
    "${entry.key}: ${entry.value}",
  );
}
```

---

# 4. Iterable

`Iterable` là tập hợp có thể duyệt tuần tự.

```dart
Iterable<int> numbers = [
  1,
  2,
  3,
];
```

## where()

```dart
var even =
    numbers.where(
      (n) => n.isEven,
    );
```

## map()

```dart
var strings =
    numbers.map(
      (n) => "Number $n",
    );
```

## take()

```dart
var firstTwo =
    numbers.take(2);
```

## skip()

```dart
var remain =
    numbers.skip(2);
```

## firstWhere()

```dart
var value =
    numbers.firstWhere(
      (n) => n > 2,
    );
```

## toList()

```dart
var list =
    numbers.toList();
```

## toSet()

```dart
var set =
    numbers.toSet();
```

---

# 5. Queue

Thuộc thư viện:

```dart
import 'dart:collection';
```

## Tạo Queue

```dart
import 'dart:collection';

void main() {
  Queue<int> queue =
      Queue<int>();
}
```

## Thêm dữ liệu

```dart
queue.add(1);

queue.addLast(2);

queue.addFirst(0);
```

## Xóa dữ liệu

```dart
queue.removeFirst();

queue.removeLast();
```

## Truy cập

```dart
print(queue.first);

print(queue.last);
```

---

# Collection If

```dart
bool isAdmin = true;

var menu = [
  "Home",

  if (isAdmin)
    "Dashboard",
];
```

---

# Collection For

```dart
var numbers = [1, 2, 3];

var doubled = [
  for (var n in numbers)
    n * 2,
];
```

Kết quả:

```dart
[2, 4, 6]
```

---

# Spread Operator (...)

```dart
var a = [1, 2];

var b = [
  ...a,
  3,
  4,
];
```

Kết quả:

```dart
[1, 2, 3, 4]
```

---

# Null-aware Spread (?...)

```dart
List<int>? numbers;

var result = [
  ...?numbers,
];
```

---

# So Sánh Nhanh

| Collection | Có thứ tự | Trùng lặp | Truy cập index |
|------------|-----------|-----------|----------------|
| List | ✅ | ✅ | ✅ |
| Set | ❌ | ❌ | ❌ |
| Map | Key-Value | Key duy nhất | Theo key |
| Queue | ✅ | ✅ | ❌ |
| Iterable | Phụ thuộc | Phụ thuộc | ❌ |

---

# Các Method Hay Dùng Nhất

```dart
where()
map()
any()
every()
contains()
firstWhere()
forEach()
take()
skip()
toList()
toSet()
length
first
last
isEmpty
isNotEmpty
```
