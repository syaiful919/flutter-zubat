class HomePageState {
  final String appVersion;

  const HomePageState({
    required this.appVersion,
  });

  HomePageState copyWith({
    String? appVersion,
  }) {
    return HomePageState(
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
