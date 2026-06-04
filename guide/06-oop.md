# Tổng Hợp OOP Trong Dart

## 1. Class

Class là khuôn mẫu để tạo object.

```dart
class User {
  String name = "Dat";
  int age = 20;
}
```

Tạo object:

```dart
void main() {
  User user = User();

  print(user.name);
  print(user.age);
}
```

---

## 2. Property (Field)

Thuộc tính bên trong class.

```dart
class Laptop {
  int? id;
  String? name;
  int? ram;
}
```

Sử dụng:

```dart
void main() {
  Laptop laptop = Laptop();

  laptop.id = 1;
  laptop.name = "MacBook Pro";
  laptop.ram = 32;

  print(laptop.name);
}
```

---

## 3. Constructor

Dùng để khởi tạo object.

### Constructor thường

```dart
class User {
  String name;
  int age;

  User(String name, int age) {
    this.name = name;
    this.age = age;
  }
}
```

### Constructor rút gọn

```dart
class User {
  String name;
  int age;

  User(this.name, this.age);
}
```

Sử dụng:

```dart
void main() {
  User user = User("Dat", 20);

  print(user.name);
}
```

### Named Constructor

Cho phép tạo nhiều cách khởi tạo object.

```dart
class User {
  String name;

  User(this.name);

  User.guest() : name = "Guest";
}
```

Sử dụng:

```dart
void main() {
  User u1 = User("Dat");
  User u2 = User.guest();

  print(u2.name);
}
```

### Factory Constructor

`factory constructor` là constructor đặc biệt có thể trả về object mới hoặc object đã tồn tại.

```dart
class User {
  String name;

  User(this.name);

  factory User.guest() {
    return User("Guest");
  }
}
```

Sử dụng:

```dart
void main() {
  User user = User.guest();

  print(user.name);
}
```

---

## 4. Method

Hàm bên trong class.

```dart
class User {
  String name;

  User(this.name);

  void sayHello() {
    print("Hello $name");
  }
}
```

```dart
void main() {
  User user = User("Dat");
  user.sayHello();
}
```

---

## 5. Getter

Lấy dữ liệu dưới dạng property.

```dart
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double get area => width * height;
}
```

```dart
void main() {
  Rectangle r = Rectangle(10, 5);

  print(r.area);
}
```

---

## 6. Setter

Thiết lập dữ liệu.

```dart
class User {
  String _name = "";

  set name(String value) {
    _name = value.trim();
  }

  String get name => _name;
}
```

```dart
void main() {
  User user = User();

  user.name = " Dat ";

  print(user.name);
}
```

---

## 7. Encapsulation

Ẩn dữ liệu bằng dấu `_`.

```dart
class BankAccount {
  double _balance = 0;

  void deposit(double amount) {
    _balance += amount;
  }

  double get balance => _balance;
}
```

```dart
void main() {
  BankAccount account = BankAccount();

  account.deposit(1000);

  print(account.balance);
}
```

---

## 8. Inheritance

Kế thừa từ class cha bằng `extends`.

```dart
class Animal {
  void eat() {
    print("Eating");
  }
}

class Dog extends Animal {
  void bark() {
    print("Barking");
  }
}
```

```dart
void main() {
  Dog dog = Dog();

  dog.eat();
  dog.bark();
}
```

---

## 9. Method Override

Ghi đè method của class cha.

```dart
class Animal {
  void sound() {
    print("Animal sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Woof");
  }
}
```

```dart
void main() {
  Dog dog = Dog();
  dog.sound();
}
```

---

## 10. super

Gọi constructor hoặc method của class cha.

```dart
class Animal {
  String name;

  Animal(this.name);
}

class Dog extends Animal {
  Dog(String name) : super(name);
}
```

Hoặc:

```dart
class Animal {
  void sound() {
    print("Animal sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    super.sound();
    print("Woof");
  }
}
```

---

## 11. Abstract Class

Không thể tạo object trực tiếp.

```dart
abstract class Animal {
  void sound();

  void sleep() {
    print("Sleeping");
  }
}
```

```dart
class Dog extends Animal {
  @override
  void sound() {
    print("Woof");
  }
}
```

> Method có body vẫn có thể bị override.

---

## 12. Interface

Mọi class trong Dart đều có thể dùng như interface.

```dart
class Animal {
  void sound() {}
}

class Dog implements Animal {
  @override
  void sound() {
    print("Woof");
  }
}
```

Lưu ý:

```dart
implements
```

→ Phải override toàn bộ method, getter và setter.

---

## 13. Mixin

Tái sử dụng code mà không cần kế thừa.

```dart
mixin Flyable {
  void fly() {
    print("Flying");
  }
}
```

```dart
class Bird with Flyable {}
```

```dart
void main() {
  Bird bird = Bird();

  bird.fly();
}
```

Nhiều mixin:

```dart
class Bird with Flyable, Swimmable {}
```

---

## 14. Polymorphism

Một biến có thể tham chiếu tới nhiều kiểu object khác nhau.

```dart
class Animal {
  void sound() {}
}

class Dog extends Animal {
  @override
  void sound() {
    print("Woof");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("Meow");
  }
}
```

```dart
void main() {
  Animal animal = Dog();

  animal.sound();
}
```

---

## 15. Static

Thuộc về class, không thuộc object.

```dart
class MathUtil {
  static const double pi = 3.14;

  static int add(int a, int b) {
    return a + b;
  }
}
```

```dart
void main() {
  print(MathUtil.pi);
  print(MathUtil.add(1, 2));
}
```

---

## 16. Enum

Tập hợp các giá trị cố định.

```dart
enum Gender {
  male,
  female,
  other
}
```

```dart
void main() {
  Gender gender = Gender.male;

  print(gender);
}
```

---

## 17. Generic

Cho phép class làm việc với nhiều kiểu dữ liệu.

```dart
class Box<T> {
  T value;

  Box(this.value);
}
```

```dart
void main() {
  Box<String> box1 = Box("Hello");
  Box<int> box2 = Box(100);

  print(box1.value);
  print(box2.value);
}
```

---

## 18. Extension Method

Thêm method cho class có sẵn.

```dart
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
```

```dart
void main() {
  print("dat".capitalize());
}
```

---

## 19. Extension Type (Dart 3)

Tạo kiểu dữ liệu mạnh hơn mà không tốn chi phí runtime.

```dart
extension type UserId(int value) {}
```

```dart
void getUser(UserId id) {
  print(id.value);
}

void main() {
  getUser(UserId(1));
}
```

Giúp tránh nhầm lẫn:

```dart
extension type UserId(int value) {}
extension type ProductId(int value) {}

void getUser(UserId id) {}

getUser(UserId(1));      // OK
// getUser(ProductId(1)); // Error
```

---

# 4 Trụ Cột OOP

## Encapsulation (Đóng gói)

Ẩn dữ liệu và chỉ cho phép truy cập thông qua method hoặc getter/setter.

```dart
class User {
  String _name = "";

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
```

## Inheritance (Kế thừa)

Cho phép class con tái sử dụng code của class cha.

```dart
class Animal {}

class Dog extends Animal {}
```

## Polymorphism (Đa hình)

Một interface có thể có nhiều cách triển khai.

```dart
Animal animal = Dog();
animal.sound();
```

## Abstraction (Trừu tượng)

Chỉ định nghĩa hành vi, không quan tâm chi tiết triển khai.

```dart
abstract class Animal {
  void sound();
}
```

---

# Thứ Tự Nên Học

1. Class
2. Object
3. Property
4. Constructor
5. Method
6. Getter / Setter
7. Encapsulation
8. Inheritance
9. Override
10. super
11. Abstract Class
12. Interface
13. Mixin
14. Polymorphism
15. Static
16. Enum
17. Generic
18. Extension Method
19. Extension Type

---

# Kiến Thức OOP Quan Trọng Nhất Khi Học Flutter

* Class
* Constructor
* Getter / Setter
* Encapsulation
* Inheritance
* Abstract Class
* Interface
* Polymorphism
* Generic
* Enum

Đây là các kiến thức xuất hiện thường xuyên trong Model, Service, Repository, State Management và Widget của Flutter.
