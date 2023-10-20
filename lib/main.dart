import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_01/todo.dart';

void main() {
  /// 4. Riverpod을 사용하기 위해 ProvideScope로 MyApp을 설정해준다.
  runApp(ProviderScope(
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(),
    );
  }
}

/// 5. 위젯 -> ConsumerWidget으로 만들면 Provider를 구독할 수 있다.
class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 6. todo의 창고관리자 new
    /*
       ref를 통해 Provide가 관리하는 상태에 접근할 수 있다.
       ref.read() : 상태 값을 1번만 수신할 때 사용한다.
       ref.watch() : 상태 값이 변경되는 것을 계속 수신할 때 사용한다.
       Provider는 상태 변경이 될 수 없기 때문에 read()로 수신한다.
    */
    Todo todo = ref.read(todoProvider);
    return Scaffold(
      body: Center(
        /// 7. Provide를 구독하여, Todo의 상태 값에 접근하여 화면을 그린다.
        child: Text(
          "완료 : ${todo.isCompleted}, 내용 : ${todo.description}",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
