import 'package:package_info_plus/package_info_plus.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class AppVersionService {
  final ShorebirdCodePush codePush;

  const AppVersionService({
    required this.codePush,
  });

  Future<String> getAppVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();

      String appVersion = packageInfo.version.trim();
      final int? currentPatchversion = await codePush.currentPatchNumber();

      if (currentPatchversion != null) {
        appVersion = '$appVersion - patch $currentPatchversion';
      }

      return appVersion;
    } catch (_) {
      return '';
    }
  }
}
