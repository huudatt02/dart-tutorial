# Tổng Hợp Null Safety Trong Dart

## 1. Null Safety Là Gì?

Null Safety giúp ngăn lỗi khi truy cập vào một biến có giá trị `null`.

Dart sử dụng **Sound Null Safety**, nghĩa là nếu một biến được khai báo không cho phép `null`, Dart đảm bảo nó không bao giờ là `null` ở runtime.

---

## 2. Non-nullable Type (Mặc Định)

Mọi kiểu dữ liệu trong Dart đều **không cho phép null** mặc định.

```dart
String name = "Dat";
int age = 20;
```

Sai:

```dart
String name = null; // Error
```

---

## 3. Nullable Type (`?`)

Thêm `?` sau kiểu dữ liệu để cho phép giá trị `null`.

```dart
String? name;
int? age;
```

```dart
String? name = null;
```

Có thể gán:

```dart
name = "Dat";
name = null;
```

---

## 4. Null Check (`!= null`)

Kiểm tra trước khi sử dụng.

```dart
String? name = "Dat";

if (name != null) {
  print(name.length);
}
```

Sau khi kiểm tra, Dart tự hiểu `name` không còn null trong block đó.

```dart
if (name != null) {
  print(name.length);
}
```

---

## 5. Null Assertion Operator (`!`)

Khẳng định biến chắc chắn không null.

```dart
String? name = "Dat";

print(name!.length);
```

Nếu thực tế là null:

```dart
String? name = null;

print(name!.length); // Runtime Error
```

Chỉ dùng khi thực sự chắc chắn.

---

## 6. Null-Aware Access (`?.`)

Gọi thuộc tính hoặc method nếu giá trị không null.

```dart
String? name = "Dat";

print(name?.length);
```

Nếu:

```dart
String? name = null;
```

Kết quả:

```text
null
```

Không gây lỗi.

---

## 7. Null-Coalescing Operator (`??`)

Trả về giá trị mặc định nếu bên trái là null.

```dart
String? name;

print(name ?? "Unknown");
```

Output:

```text
Unknown
```

---

## 8. Null-Coalescing Assignment (`??=`)

Chỉ gán khi biến đang null.

```dart
String? name;

name ??= "Dat";

print(name);
```

Output:

```text
Dat
```

Nếu:

```dart
name = "John";

name ??= "Dat";
```

Kết quả vẫn:

```text
John
```

---

## 9. Required Parameter

Bắt buộc truyền giá trị cho named parameter.

```dart
void createUser({
  required String name,
  required int age,
}) {
  print("$name - $age");
}
```

Gọi:

```dart
createUser(
  name: "Dat",
  age: 20,
);
```

Sai:

```dart
createUser(name: "Dat"); // Error
```

---

## 10. Late Keyword

Khai báo biến sẽ được khởi tạo sau.

```dart
late String name;

void main() {
  name = "Dat";
  print(name);
}
```

Nếu truy cập trước khi gán:

```dart
late String name;

print(name); // LateInitializationError
```

---

## 11. Late Final

Gán một lần nhưng không cần gán ngay.

```dart
late final String token;

void init() {
  token = "abc123";
}
```

Sai:

```dart
token = "xyz"; // Error
```

---

## 12. Nullable Collection

### Nullable List

```dart
List<String>? names;
```

List có thể null.

### List Chứa Phần Tử Nullable

```dart
List<String?> names = [
  "Dat",
  null,
  "John",
];
```

### Cả List Và Phần Tử Đều Nullable

```dart
List<String?>? names;
```

---

## 13. Nullable Return Type

```dart
String? getName() {
  return null;
}
```

Sử dụng:

```dart
String? name = getName();
```

---

## 14. Nullable Parameter

```dart
void greet(String? name) {
  print(name);
}
```

Gọi:

```dart
greet(null);
```

---

## 15. Default Value Cho Nullable

```dart
void greet([String? name]) {
  print(name ?? "Guest");
}
```

```dart
greet();
```

Output:

```text
Guest
```

---

## 16. Null-Aware Cascade (`?..`)

```dart
User? user;

user
  ?..name = "Dat"
  ..age = 20;
```

Nếu `user` là null thì toàn bộ cascade bị bỏ qua.

---

## 17. Null Safety Trong Generic

```dart
List<int> numbers = [1, 2, 3];
```

Không cho phép:

```dart
numbers.add(null); // Error
```

Cho phép:

```dart
List<int?> numbers = [1, null, 3];
```

---

## 18. Các Toán Tử Null Safety Quan Trọng

| Toán tử | Ý nghĩa |
|----------|----------|
| `?` | Cho phép null |
| `!` | Khẳng định không null |
| `?.` | Truy cập nếu không null |
| `?..` | Cascade nếu không null |
| `??` | Giá trị mặc định nếu null |
| `??=` | Gán nếu null |
| `required` | Bắt buộc truyền tham số |
| `late` | Khởi tạo sau |

---

## 19. Toán Tử Null Safety Kết Hợp

```dart
String? name;

print(name?.toUpperCase() ?? "UNKNOWN");
```

Output:

```text
UNKNOWN
```

Giải thích:

- `?.` gọi method nếu không null.
- `??` trả về giá trị mặc định nếu kết quả là null.

---

## 20. Constructor Và Null Safety

### Nullable Field

```dart
class User {
  String? name;
}
```

### Required Field

```dart
class User {
  String name;

  User({
    required this.name,
  });
}
```

### Late Field

```dart
class User {
  late String name;
}
```

---

## Sơ Đồ Ghi Nhớ

| Khai báo | Ý nghĩa |
|-----------|----------|
| `String name` | Không được null |
| `String? name` | Có thể null |
| `name!` | Chắc chắn không null |
| `name?.length` | Truy cập an toàn |
| `name ?? "Guest"` | Giá trị mặc định |
| `name ??= "Guest"` | Gán nếu null |
| `required String name` | Bắt buộc truyền |
| `late String name` | Khởi tạo sau |
| `List<String>?` | List có thể null |
| `List<String?>` | Phần tử có thể null |
| `List<String?>?` | Cả list và phần tử đều có thể null |

---

## Best Practices

✅ Ưu tiên dùng `?`, `?.`, `??`, `??=` để xử lý null an toàn.

✅ Dùng `required` cho các tham số bắt buộc.

✅ Dùng `late` khi giá trị sẽ được khởi tạo sau.

✅ Kiểm tra null trước khi sử dụng biến nullable.

❌ Không lạm dụng `!` vì có thể gây lỗi runtime.

❌ Không dùng nullable nếu giá trị luôn phải tồn tại.
