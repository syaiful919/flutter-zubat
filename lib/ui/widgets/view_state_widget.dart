import 'package:flutter/material.dart';
import 'package:zubat/models/common/state_type.dart';
import 'package:zubat/models/common/view_state.dart';

class ViewStateWidget<T> extends StatelessWidget {
  final ViewState<T>? state;
  final Widget Function(T) onSuccess;
  final Widget Function()? onLoading;
  final Widget Function(String)? onError;
  final Widget Function()? onEmpty;
  final Widget Function()? onInit;

  const ViewStateWidget({
    super.key,
    required this.state,
    required this.onSuccess,
    this.onLoading,
    this.onError,
    this.onEmpty,
    this.onInit,
  });

  @override
  Widget build(BuildContext context) {
    final ViewState<T>? state = this.state;
    if (state == null) {
      return _getEmptyDefault();
    }

    switch (state.type) {
      case StateType.loading:
        return onLoading?.call() ?? _getLoadingDefault();
      case StateType.empty:
        return onEmpty?.call() ?? _getEmptyDefault();
      case StateType.error:
        final Widget Function(String)? errorCallback = onError;
        if (errorCallback != null) {
          return errorCallback.call(state.message);
        }
        return _getErrorDefault(state.message);
      case StateType.success:
        final T? data = state.data;
        if (data == null) {
          return _getEmptyDefault();
        }
        return onSuccess.call(data);
      default:
        return onInit?.call() ?? _getEmptyDefault();
    }
  }

  Widget _getErrorDefault(String message) {
    return Material(
      child: Center(
        child: Text(message),
      ),
    );
  }

  Widget _getLoadingDefault() {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _getEmptyDefault() {
    return const SizedBox.shrink();
  }
}
