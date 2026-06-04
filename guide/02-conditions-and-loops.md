# Tổng Hợp Conditions & Loops Trong Dart

## 1. Conditions (Câu Điều Kiện)

Conditions dùng để kiểm tra điều kiện và quyết định luồng thực thi của chương trình.

---

## 2. if

Thực hiện khối lệnh nếu điều kiện đúng (`true`).

```dart
void main() {
  int age = 18;

  if (age >= 18) {
    print("Adult");
  }
}
```

---

## 3. if - else

Thực hiện một khối lệnh khi điều kiện đúng và một khối khác khi điều kiện sai.

```dart
void main() {
  int age = 16;

  if (age >= 18) {
    print("Adult");
  } else {
    print("Minor");
  }
}
```

---

## 4. if - else if - else

Kiểm tra nhiều điều kiện liên tiếp.

```dart
void main() {
  int score = 85;

  if (score >= 90) {
    print("Excellent");
  } else if (score >= 80) {
    print("Good");
  } else if (score >= 70) {
    print("Average");
  } else {
    print("Poor");
  }
}
```

---

## 5. Nested if

Lồng nhiều câu lệnh `if` bên trong nhau.

```dart
void main() {
  int age = 20;
  bool hasLicense = true;

  if (age >= 18) {
    if (hasLicense) {
      print("Can drive");
    }
  }
}
```

---

## 6. Ternary Operator

Viết ngắn gọn cho `if - else`.

Cú pháp:

```dart
condition ? valueIfTrue : valueIfFalse
```

Ví dụ:

```dart
void main() {
  int age = 20;

  String result = age >= 18 ? "Adult" : "Minor";

  print(result);
}
```

---

## 7. Switch Statement

Dùng khi cần so sánh một giá trị với nhiều trường hợp.

```dart
void main() {
  String day = "Monday";

  switch (day) {
    case "Monday":
      print("Start of week");
      break;

    case "Friday":
      print("Weekend is coming");
      break;

    default:
      print("Normal day");
  }
}
```

---

## 8. Switch Expression (Dart 3)

Cách viết ngắn gọn hơn.

```dart
void main() {
  String day = "Monday";

  String message = switch (day) {
    "Monday" => "Start of week",
    "Friday" => "Weekend is coming",
    _ => "Normal day",
  };

  print(message);
}
```

---

# Loops (Vòng Lặp)

Loops dùng để lặp lại một đoạn code nhiều lần.

---

## 9. for Loop

Dùng khi biết trước số lần lặp.

```dart
void main() {
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
}
```

Kết quả:

```text
1
2
3
4
5
```

---

## 10. for-in Loop

Duyệt các phần tử trong Collection.

```dart
void main() {
  List<String> names = ["Dat", "John", "Jane"];

  for (String name in names) {
    print(name);
  }
}
```

---

## 11. forEach()

Duyệt Collection bằng callback.

```dart
void main() {
  List<String> names = ["Dat", "John", "Jane"];

  names.forEach((name) {
    print(name);
  });
}
```

Arrow function:

```dart
names.forEach((name) => print(name));
```

---

## 12. while Loop

Lặp khi điều kiện còn đúng.

```dart
void main() {
  int i = 1;

  while (i <= 5) {
    print(i);
    i++;
  }
}
```

---

## 13. do-while Loop

Luôn chạy ít nhất 1 lần.

```dart
void main() {
  int i = 1;

  do {
    print(i);
    i++;
  } while (i <= 5);
}
```

---

## 14. break

Thoát khỏi vòng lặp ngay lập tức.

```dart
void main() {
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      break;
    }

    print(i);
  }
}
```

Kết quả:

```text
1
2
3
4
```

---

## 15. continue

Bỏ qua lần lặp hiện tại.

```dart
void main() {
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      continue;
    }

    print(i);
  }
}
```

Kết quả:

```text
1
2
4
5
```

---

## 16. Label với break

Thoát khỏi vòng lặp ngoài.

```dart
void main() {
  outerLoop:
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (i == 2 && j == 2) {
        break outerLoop;
      }

      print("$i $j");
    }
  }
}
```

---

## 17. Label với continue

Chuyển sang lần lặp tiếp theo của vòng lặp ngoài.

```dart
void main() {
  outerLoop:
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (j == 2) {
        continue outerLoop;
      }

      print("$i $j");
    }
  }
}
```

---

# Tóm Tắt

## Conditions

- `if`
- `if - else`
- `if - else if - else`
- `nested if`
- `ternary operator`
- `switch`
- `switch expression`
- `null-aware conditions`

## Loops

- `for`
- `for-in`
- `forEach`
- `while`
- `do-while`
- `break`
- `continue`
- `label + break`
- `label + continue`
