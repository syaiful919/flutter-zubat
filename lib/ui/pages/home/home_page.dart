import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:zubat/const/app_images.dart';
import 'package:zubat/services/app_version_service.dart';
import 'package:zubat/ui/pages/detail/detail_page.dart';
import 'package:zubat/ui/pages/home/bloc/home_page_state.dart';
import 'package:zubat/ui/pages/home/bloc/homel_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appVersionService = AppVersionService(
    codePush: ShorebirdCodePush(),
  );

  void _openDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const DetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (_) {
        return HomePageCubit(
          appVersionService: _appVersionService,
        )..checkAppVersion();
      },
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, snapshot) {
          return Scaffold(
            body: Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _openDetail,
                    child: Image.asset(AppImages.zubat),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Text(
                    'v${snapshot.appVersion}',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
