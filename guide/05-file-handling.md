# Tổng Hợp File Handling Trong Dart

## 1. Import Thư Viện

Để làm việc với file trong Dart:

```dart
import 'dart:io';
```

---

## 2. Tạo Đối Tượng File

```dart
File file = File('data.txt');
```

Hoặc:

```dart
var file = File('data.txt');
```

---

## 3. Kiểm Tra File Có Tồn Tại Không

### Async

```dart
bool exists = await file.exists();

print(exists);
```

### Sync

```dart
bool exists = file.existsSync();

print(exists);
```

---

## 4. Đọc Nội Dung File

### Đọc Toàn Bộ Dưới Dạng String

#### Async

```dart
String content = await file.readAsString();

print(content);
```

#### Sync

```dart
String content = file.readAsStringSync();

print(content);
```

### Đọc Theo Danh Sách Dòng

#### Async

```dart
List<String> lines = await file.readAsLines();

print(lines);
```

#### Sync

```dart
List<String> lines = file.readAsLinesSync();

print(lines);
```

### Đọc Dưới Dạng Bytes

#### Async

```dart
List<int> bytes = await file.readAsBytes();

print(bytes);
```

#### Sync

```dart
List<int> bytes = file.readAsBytesSync();

print(bytes);
```

---

## 5. Ghi File

### Ghi Đè Nội Dung

#### Async

```dart
await file.writeAsString('Hello Dart');
```

#### Sync

```dart
file.writeAsStringSync('Hello Dart');
```

### Ghi Thêm (Append)

```dart
await file.writeAsString(
  '\nNew Line',
  mode: FileMode.append,
);
```

### Ghi Bytes

```dart
await file.writeAsBytes([
  72,
  101,
  108,
  108,
  111,
]);
```

---

## 6. Xóa File

### Async

```dart
await file.delete();
```

### Sync

```dart
file.deleteSync();
```

---

## 7. Đổi Tên File

### Async

```dart
await file.rename('new_data.txt');
```

### Sync

```dart
file.renameSync('new_data.txt');
```

---

## 8. Copy File

### Async

```dart
await file.copy('backup.txt');
```

### Sync

```dart
file.copySync('backup.txt');
```

---

## 9. Lấy Thông Tin File

### Kích Thước File

```dart
int size = await file.length();

print(size);
```

### Đường Dẫn File

```dart
print(file.path);
```

### Đường Dẫn Tuyệt Đối

```dart
print(file.absolute.path);
```

### Thời Gian Chỉnh Sửa Cuối

```dart
FileStat stat = await file.stat();

print(stat.modified);
```

---

## 10. Làm Việc Với Directory

### Tạo Thư Mục

```dart
Directory dir = Directory('data');

await dir.create();
```

Tạo cả thư mục cha:

```dart
await dir.create(recursive: true);
```

### Kiểm Tra Thư Mục Tồn Tại

```dart
bool exists = await dir.exists();

print(exists);
```

### Xóa Thư Mục

```dart
await dir.delete();
```

Xóa cả thư mục con:

```dart
await dir.delete(recursive: true);
```

### Liệt Kê File Trong Thư Mục

```dart
await for (var entity in dir.list()) {
  print(entity.path);
}
```

Hoặc:

```dart
List<FileSystemEntity> files = dir.listSync();

for (var file in files) {
  print(file.path);
}
```

---

## 11. Path

Thường dùng package `path` để thao tác đường dẫn.

### pubspec.yaml

```yaml
dependencies:
  path: ^1.9.0
```

### Import

```dart
import 'package:path/path.dart' as path;
```

### Nối Đường Dẫn

```dart
String fullPath = path.join(
  'users',
  'documents',
  'file.txt',
);

print(fullPath);
```

### Lấy Tên File

```dart
print(path.basename('/tmp/file.txt'));
```

Kết quả:

```text
file.txt
```

### Lấy Extension

```dart
print(path.extension('file.txt'));
```

Kết quả:

```text
.txt
```

---

## 12. Temp Directory

### Lấy Thư Mục Tạm

```dart
Directory temp = Directory.systemTemp;

print(temp.path);
```

### Tạo File Tạm

```dart
File tempFile =
    await File('${temp.path}/temp.txt')
        .create();
```

---

## 13. Exception Handling

```dart
try {
  String content =
      await file.readAsString();

  print(content);
} on FileSystemException catch (e) {
  print(e.message);
}
```

---

## 14. Ví Dụ Hoàn Chỉnh

```dart
import 'dart:io';

Future<void> main() async {
  File file = File('user.txt');

  if (!await file.exists()) {
    await file.create();
  }

  await file.writeAsString(
    'Dat\n20',
  );

  String content =
      await file.readAsString();

  print(content);

  print(
    'Size: ${await file.length()} bytes',
  );
}
```

---

# Cheat Sheet

| Tác vụ | Method |
|---------|---------|
| Tạo file | `create()` |
| Kiểm tra tồn tại | `exists()` |
| Đọc text | `readAsString()` |
| Đọc lines | `readAsLines()` |
| Đọc bytes | `readAsBytes()` |
| Ghi file | `writeAsString()` |
| Ghi bytes | `writeAsBytes()` |
| Ghi thêm | `FileMode.append` |
| Xóa file | `delete()` |
| Copy file | `copy()` |
| Đổi tên file | `rename()` |
| Kích thước file | `length()` |
| Thông tin file | `stat()` |
| Tạo thư mục | `Directory.create()` |
| Liệt kê thư mục | `Directory.list()` |
| Xóa thư mục | `Directory.delete()` |
| Thao tác path | `package:path` |

## Nên Nhớ

- `File` → làm việc với file.
- `Directory` → làm việc với thư mục.
- `FileSystemEntity` → lớp cha của `File` và `Directory`.
- `dart:io` chỉ dùng cho CLI, Server, Desktop.
- Flutter Mobile/Desktop dùng được `dart:io`.
- Flutter Web không hỗ trợ `dart:io`.
