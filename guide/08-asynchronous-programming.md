# Tổng Hợp Asynchronous Programming Trong Dart

## 1. Asynchronous Programming Là Gì?

Asynchronous Programming (lập trình bất đồng bộ) cho phép chương trình thực hiện các tác vụ tốn thời gian mà không làm chặn luồng chính (main thread).

Ví dụ:

- Gọi API
- Đọc/Ghi file
- Truy vấn database
- Chờ người dùng nhập dữ liệu

Nếu thực hiện đồng bộ (synchronous), chương trình phải đợi tác vụ hoàn thành rồi mới chạy tiếp.

---

## 2. Synchronous vs Asynchronous

### Synchronous

```dart
void main() {
  print("Start");

  print("Processing...");

  print("End");
}
```

Kết quả:

```text
Start
Processing...
End
```

### Asynchronous

```dart
void main() {
  print("Start");

  Future.delayed(Duration(seconds: 2), () {
    print("Processing...");
  });

  print("End");
}
```

Kết quả:

```text
Start
End
Processing...
```

---

## 3. Future

`Future` đại diện cho một giá trị sẽ có trong tương lai.

```dart
Future<String> getName() {
  return Future.value("Dat");
}
```

Hoặc:

```dart
Future<String> getName() async {
  return "Dat";
}
```

---

## 4. Future.delayed()

Tạo Future sau một khoảng thời gian.

```dart
void main() {
  Future.delayed(
    Duration(seconds: 3),
    () => print("Hello"),
  );
}
```

---

## 5. async

Đánh dấu hàm bất đồng bộ.

```dart
Future<void> fetchData() async {
  print("Fetching...");
}
```

Hàm `async` luôn trả về `Future`.

```dart
Future<String> getUser() async {
  return "Dat";
}
```

---

## 6. await

`await` dùng để chờ một `Future` hoàn thành.

```dart
Future<String> getUser() async {
  await Future.delayed(Duration(seconds: 2));

  return "Dat";
}

void main() async {
  String user = await getUser();

  print(user);
}
```

---

## 7. async + await

Ví dụ hoàn chỉnh:

```dart
Future<String> fetchUser() async {
  await Future.delayed(Duration(seconds: 2));

  return "Dat";
}

void main() async {
  print("Loading...");

  String user = await fetchUser();

  print(user);
}
```

Kết quả:

```text
Loading...
Dat
```

---

## 8. then()

Xử lý kết quả Future mà không dùng `await`.

```dart
Future<String> getName() async {
  return "Dat";
}

void main() {
  getName().then((value) {
    print(value);
  });
}
```

---

## 9. catchError()

Bắt lỗi Future.

```dart
Future<int> divide(int a, int b) {
  return Future(() {
    return a ~/ b;
  });
}

void main() {
  divide(10, 0).catchError((error) {
    print(error);
  });
}
```

---

## 10. try-catch Với async-await

Cách phổ biến nhất để xử lý lỗi.

```dart
Future<int> divide(int a, int b) async {
  return a ~/ b;
}

void main() async {
  try {
    int result = await divide(10, 0);

    print(result);
  } catch (e) {
    print("Error: $e");
  }
}
```

---

## 11. finally

Luôn được thực thi dù có lỗi hay không.

```dart
void main() async {
  try {
    await Future.delayed(Duration(seconds: 1));

    print("Success");
  } catch (e) {
    print(e);
  } finally {
    print("Done");
  }
}
```

---

## 12. Future.wait()

Chạy nhiều Future song song.

```dart
Future<String> getUser() async {
  await Future.delayed(Duration(seconds: 2));

  return "Dat";
}

Future<int> getAge() async {
  await Future.delayed(Duration(seconds: 1));

  return 20;
}

void main() async {
  List results = await Future.wait([
    getUser(),
    getAge(),
  ]);

  print(results);
}
```

Kết quả:

```text
[Dat, 20]
```

---

## 13. Stream

`Stream` là chuỗi nhiều dữ liệu được phát theo thời gian.

Trong khi `Future` chỉ trả về **một giá trị**, `Stream` có thể trả về **nhiều giá trị**.

```dart
Stream<int> count() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));

    yield i;
  }
}
```

---

## 14. listen()

Lắng nghe Stream.

```dart
void main() {
  count().listen((value) {
    print(value);
  });
}
```

---

## 15. async*

Dùng để tạo Stream.

```dart
Stream<int> numbers() async* {
  yield 1;
  yield 2;
  yield 3;
}
```

---

## 16. yield

Phát dữ liệu vào Stream.

```dart
Stream<String> names() async* {
  yield "Dat";
  yield "John";
  yield "Alex";
}
```

---

## 17. await for

Duyệt dữ liệu từ Stream.

```dart
void main() async {
  await for (var value in count()) {
    print(value);
  }
}
```

---

## 18. Stream.fromIterable()

Tạo Stream từ Collection.

```dart
void main() {
  Stream.fromIterable([
    "Dat",
    "John",
    "Alex"
  ]).listen(print);
}
```

---

## 19. StreamController

Tạo và quản lý Stream thủ công.

```dart
import 'dart:async';

void main() {
  final controller = StreamController<String>();

  controller.stream.listen((data) {
    print(data);
  });

  controller.add("Hello");
  controller.add("Dart");

  controller.close();
}
```

---

## 20. Completer

Cho phép hoàn thành Future thủ công.

```dart
import 'dart:async';

void main() async {
  Completer<String> completer = Completer();

  Future.delayed(Duration(seconds: 2), () {
    completer.complete("Done");
  });

  print(await completer.future);
}
```

---

## 21. Event Loop

Dart sử dụng Event Loop để xử lý các tác vụ bất đồng bộ.

Thứ tự hoạt động:

```text
Call Stack
    ↓
Microtask Queue
    ↓
Event Queue
```

Ví dụ:

```dart
void main() {
  print("1");

  Future.microtask(() => print("2"));

  Future(() => print("3"));

  print("4");
}
```

Kết quả:

```text
1
4
2
3
```

`microtask` luôn được xử lý trước `event queue`.

---

## 22. Future.microtask()

Tạo tác vụ trong Microtask Queue.

```dart
void main() {
  Future.microtask(() {
    print("Microtask");
  });

  print("Main");
}
```

Kết quả:

```text
Main
Microtask
```

---

## 23. Future.sync()

Thực thi code đồng bộ nhưng trả về Future.

```dart
Future<int> getNumber() {
  return Future.sync(() {
    return 10;
  });
}
```

---

## 24. Timer

Thực hiện tác vụ sau một khoảng thời gian.

```dart
import 'dart:async';

void main() {
  Timer(
    Duration(seconds: 2),
    () => print("Hello"),
  );
}
```

---

## 25. Timer.periodic()

Chạy lặp lại theo chu kỳ.

```dart
import 'dart:async';

void main() {
  Timer.periodic(
    Duration(seconds: 1),
    (timer) {
      print(timer.tick);

      if (timer.tick == 5) {
        timer.cancel();
      }
    },
  );
}
```

---

# Tóm Tắt

| Thành phần | Công dụng |
|------------|-----------|
| `Future` | Giá trị trả về trong tương lai |
| `async` | Đánh dấu hàm bất đồng bộ |
| `await` | Chờ Future hoàn thành |
| `then()` | Xử lý kết quả Future |
| `catchError()` | Bắt lỗi Future |
| `try-catch` | Bắt lỗi với async-await |
| `finally` | Luôn chạy sau try/catch |
| `Future.wait()` | Chạy nhiều Future song song |
| `Stream` | Nhiều giá trị theo thời gian |
| `listen()` | Lắng nghe Stream |
| `async*` | Tạo Stream |
| `yield` | Phát dữ liệu vào Stream |
| `await for` | Duyệt Stream |
| `Stream.fromIterable()` | Tạo Stream từ Collection |
| `StreamController` | Quản lý Stream thủ công |
| `Completer` | Hoàn thành Future thủ công |
| `Event Loop` | Cơ chế xử lý bất đồng bộ |
| `Future.microtask()` | Tạo microtask |
| `Future.sync()` | Đồng bộ nhưng trả Future |
| `Timer` | Hẹn giờ |
| `Timer.periodic()` | Hẹn giờ lặp lại |

## Những Nội Dung Quan Trọng Cần Nắm

1. `Future`
2. `async`
3. `await`
4. `try-catch`
5. `Future.wait()`
6. `Stream`
7. `listen()`
8. `await for`
9. `StreamController`
10. Event Loop

Đây là các kiến thức cốt lõi cần nắm trước khi học:

- HTTP Request / REST API
- Flutter Networking
- State Management
- WebSocket
- Firebase
- Isolates
- Clean Architecture
