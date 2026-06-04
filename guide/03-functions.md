# Tổng Hợp Functions Trong Dart

## 1. Function Là Gì?

Function (hàm) là một khối mã dùng để thực hiện một nhiệm vụ cụ thể.

```dart
void greet() {
  print("Hello Dart");
}

void main() {
  greet();
}
```

---

## 2. Cấu Trúc Function

```dart
returnType functionName(parameters) {
  // code
}
```

Ví dụ:

```dart
int add(int a, int b) {
  return a + b;
}
```

---

## 3. Function Không Có Giá Trị Trả Về

Dùng `void`.

```dart
void printName() {
  print("Dat");
}
```

---

## 4. Function Có Giá Trị Trả Về

```dart
String getName() {
  return "Dat";
}

int sum(int a, int b) {
  return a + b;
}
```

---

## 5. Arrow Function (Fat Arrow)

```dart
int square(int n) => n * n;

String greet(String name) => "Hello $name";
```

---

## 6. Positional Parameters

```dart
void printInfo(String name, int age) {
  print("$name - $age");
}

printInfo("Dat", 20);
```

---

## 7. Optional Positional Parameters

```dart
void printInfo(String name, [int? age]) {
  print("$name - $age");
}

printInfo("Dat");
printInfo("Dat", 20);
```

---

## 8. Optional Named Parameters

```dart
void printInfo({
  String? name,
  int? age,
}) {
  print("$name - $age");
}

printInfo(name: "Dat", age: 20);
```

---

## 9. Required Named Parameters

```dart
void printInfo({
  required String name,
  required int age,
}) {
  print("$name - $age");
}

printInfo(
  name: "Dat",
  age: 20,
);
```

---

## 10. Default Parameter Values

```dart
void greet({
  String name = "Guest",
}) {
  print("Hello $name");
}

greet();
greet(name: "Dat");
```

---

## 11. Anonymous Function

```dart
var list = [1, 2, 3];

list.forEach((item) {
  print(item);
});
```

---

## 12. Function Là First-Class Object

```dart
var greet = () {
  print("Hello");
};

greet();
```

---

## 13. Function Làm Tham Số (Callback)

```dart
void execute(Function action) {
  action();
}

void sayHello() {
  print("Hello");
}

void main() {
  execute(sayHello);
}
```

---

## 14. Function Trả Về Function

```dart
Function multiply(int x) {
  return (int y) => x * y;
}

void main() {
  var doubleValue = multiply(2);

  print(doubleValue(5));
}
```

---

## 15. Lambda Expression

```dart
var add = (int a, int b) => a + b;

print(add(3, 4));
```

---

## 16. Closure

```dart
Function counter() {
  int count = 0;

  return () {
    count++;
    print(count);
  };
}

void main() {
  var c = counter();

  c();
  c();
  c();
}
```

---

## 17. Recursive Function

```dart
int factorial(int n) {
  if (n <= 1) {
    return 1;
  }

  return n * factorial(n - 1);
}

print(factorial(5));
```

---

## 18. Generator Function

### sync*

```dart
Iterable<int> numbers() sync* {
  yield 1;
  yield 2;
  yield 3;
}
```

### async*

```dart
Stream<int> numbers() async* {
  yield 1;
  yield 2;
  yield 3;
}
```

---

## 19. Async Function

```dart
Future<String> fetchData() async {
  return "Data";
}
```

---

## 20. Async + Await

```dart
Future<void> getData() async {
  String result = await fetchData();

  print(result);
}
```

---

## 21. Typedef

```dart
typedef Operation = int Function(int, int);

int add(int a, int b) => a + b;

void main() {
  Operation op = add;

  print(op(2, 3));
}
```

---

# Tóm Tắt

| Loại Function | Cú pháp |
|---------------|----------|
| Normal Function | `int add(int a, int b)` |
| Void Function | `void greet()` |
| Arrow Function | `=>` |
| Optional Positional | `[param]` |
| Named Parameter | `{param}` |
| Required Named | `required` |
| Anonymous Function | `() {}` |
| Lambda | `(x) => x * 2` |
| Closure | Function nhớ biến ngoài |
| Recursive | Function tự gọi lại |
| Generator | `sync*`, `async*` |
| Async Function | `Future<T>` |
| Callback Function | Function truyền làm tham số |
| Function Return Function | Trả về function |
| Typedef | Alias cho function type |
