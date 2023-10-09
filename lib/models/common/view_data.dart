import 'state_type.dart';

class ViewData<T> {
  final StateType type;
  final T? data;
  final String message;

  const ViewData._({
    required this.type,
    this.data,
    this.message = '',
  });

  factory ViewData.initial() {
    return const ViewData._(type: StateType.initial);
  }

  factory ViewData.loading() {
    return const ViewData._(type: StateType.loading);
  }

  factory ViewData.success({T? data}) {
    return ViewData._(
      type: StateType.success,
      data: data,
    );
  }

  factory ViewData.error({required String message}) {
    return ViewData._(
      type: StateType.error,
      message: message,
    );
  }

  factory ViewData.empty({String message = ''}) {
    return ViewData._(
      type: StateType.empty,
      message: message,
    );
  }
}
