import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zubat/services/app_version_service.dart';
import 'package:zubat/ui/pages/home/bloc/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final AppVersionService appVersionService;

  HomePageCubit({
    required this.appVersionService,
  }) : super(
          const HomePageState(
            appVersion: '',
          ),
        );

  Future<void> checkAppVersion() async {
    final String appVersion = await appVersionService.getAppVersion();

    emit(
      state.copyWith(appVersion: appVersion),
    );
  }
}
