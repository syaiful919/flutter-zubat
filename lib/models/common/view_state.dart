import 'state_type.dart';

class ViewState<T> {
  final StateType type;
  final T? data;
  final String message;

  const ViewState._({
    required this.type,
    this.data,
    this.message = '',
  });

  factory ViewState.initial() {
    return const ViewState._(type: StateType.initial);
  }

  factory ViewState.loading() {
    return const ViewState._(type: StateType.loading);
  }

  factory ViewState.success({T? data}) {
    return ViewState._(
      type: StateType.success,
      data: data,
    );
  }

  factory ViewState.error({required String message}) {
    return ViewState._(
      type: StateType.error,
      message: message,
    );
  }

  factory ViewState.empty({String message = ''}) {
    return ViewState._(
      type: StateType.empty,
      message: message,
    );
  }
}
