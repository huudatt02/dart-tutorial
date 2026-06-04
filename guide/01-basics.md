# Tổng Hợp Variables & Data Types Trong Dart

## 1. Variables (Biến)

Biến dùng để lưu trữ dữ liệu.

### var

Dart tự suy luận kiểu dữ liệu.

```dart
var name = "Dat";
var age = 20;
var isStudent = true;
```

Sau khi được gán giá trị lần đầu, kiểu dữ liệu không thể thay đổi.

```dart
var age = 20;

// age = "twenty"; // Error
```

---

### dynamic

Có thể thay đổi kiểu dữ liệu trong quá trình chạy.

```dart
dynamic value = "Dat";

value = 20;
value = true;
```

> Hạn chế dùng `dynamic` khi không thực sự cần thiết.

---

### Object
Kiểu cha của hầu hết các kiểu dữ liệu trong Dart.

```dart
Object value = "Hello";
Object number = 100;
Object flag = true;
```

Khác với dynamic, Dart vẫn kiểm tra kiểu dữ liệu khi gọi phương thức.

```dart
Object value = "Hello";

// Sai
value.length;
```

Phải ép kiểu:

```dart
print((value as String).length);
```

---

## 2. final

Giá trị chỉ được gán một lần.

```dart
final String name = "Dat";

// name = "John"; // Error
```

Ví dụ:

```dart
final currentTime = DateTime.now();
```

---

## 3. const

Hằng số compile-time.

```dart
const pi = 3.14159;
const appName = "My App";
```

Không thể sử dụng giá trị chỉ có ở runtime.

```dart
// const currentTime = DateTime.now(); // Error
```

---

## 4. So sánh var, final, const

| Keyword | Đổi giá trị | Runtime | Compile-time |
|----------|------------|----------|--------------|
| var | ✅ | ✅ | ❌ |
| final | ❌ | ✅ | ❌ |
| const | ❌ | ❌ | ✅ |

Ví dụ:

```dart
var a = 10;
a = 20;

final b = DateTime.now();

const c = 3.14;
```

---

# Data Types Trong Dart

## 1. String

Kiểu dữ liệu chuỗi.

```dart
String name = "Dat";
String city = 'HCM';
```

### String Interpolation

```dart
String name = "Dat";

print("Hello $name");
print("Length: ${name.length}");
```

### Multi-line String

```dart
String text = '''
Line 1
Line 2
Line 3
''';
```

---

## 2. int

Kiểu số nguyên.

```dart
int age = 20;
int score = 100;
```

---

## 3. double

Kiểu số thực.

```dart
double price = 99.99;
double height = 1.75;
```

---

## 4. num

Kiểu cha của `int` và `double`.

```dart
num value = 10;

value = 10.5;
```

---

## 5. bool

Kiểu logic.

```dart
bool isLogin = true;
bool isAdmin = false;
```

---

# Null Safety

Dart mặc định không cho phép giá trị `null`.

## Non-nullable

```dart
String name = "Dat";
```

Không được:

```dart
// name = null; // Error
```

---

## Nullable

Cho phép biến có thể nhận giá trị null

```dart
String? name;

name = null;
name = "Dat";
```

---

## Null Assertion Operator (!)

Ép Dart tin rằng biến không null, dù nó có thể null

```dart
String? name = "Dat";

print(name!.length);
```

---

## Null Aware Operator

### ?.

Chỉ truy cập nếu không null, còn null thì dừng và trả null

```dart
String? name;

print(name?.length);
```

### ??

Nếu bên trái không null thì dùng nó, nếu null thì dùng giá trị bên phải.

```dart
String? name;

print(name ?? "Unknown");
```

### ??=

Chỉ gán giá trị nếu biến đang là null

```dart
String? name;

name ??= "Dat";
```

---

## late

Khai báo biến sẽ được gán giá trị sau.

```dart
late String name;

void main() {
  name = "Dat";
  print(name);
}
```

---

# Type Checking

## is

Kiểm tra kiểu dữ liệu.

```dart
var value = "Dat";

print(value is String);
```

---

## is!

Kiểm tra không phải kiểu dữ liệu.

```dart
print(value is! int);
```

---

# Type Casting

Ép kiểu dữ liệu.

```dart
dynamic value = "Dat";

String name = value as String;
```

---

# Cheat Sheet

```text
var      -> Dart tự suy luận kiểu
dynamic  -> Có thể đổi kiểu dữ liệu
final    -> Gán một lần (runtime)
const    -> Hằng số (compile-time)

String   -> Chuỗi
int      -> Số nguyên
double   -> Số thực
num      -> int hoặc double
bool     -> true / false

?        -> Nullable
!        -> Null Assertion
?.       -> Null Aware Access
??       -> Giá trị mặc định
??=      -> Gán nếu null
late     -> Gán giá trị sau
is       -> Kiểm tra kiểu dữ liệu
as       -> Ép kiểu dữ liệu
```
