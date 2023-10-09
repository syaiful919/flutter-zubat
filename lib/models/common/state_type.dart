enum StateType {
  initial,
  loading,
  error,
  success,
  empty;

  bool get isInitial => this == StateType.initial;
  bool get isLoading => this == StateType.loading;
  bool get isError => this == StateType.error;
  bool get isSuccess => this == StateType.success;
  bool get isEmpty => this == StateType.empty;
}
