import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  /// 1. Todo 객체 -> 창고
  final bool isCompleted;
  final String description;

  Todo(this.isCompleted, this.description);
}

/// 2. Provide 생성(provide는 Todo()의 데이터를 관리한다.) -> 창고 관리자(Only-read / final)
/// Todo는 창고
final todoProvider = Provider<Todo>((ref) {
  /// 3. true, "공부하기" -> 창고 데이터
  return Todo(true, "공부하기");
});
