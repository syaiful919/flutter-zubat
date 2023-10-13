import 'package:package_info_plus/package_info_plus.dart';

class AppVersionService {
  const AppVersionService();

  Future<String> getAppVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version.trim();
    } catch (_) {
      return '';
    }
  }
}
