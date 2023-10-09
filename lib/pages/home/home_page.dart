import 'package:flutter/material.dart';
import 'package:zubat/const/app_images.dart';
import 'package:zubat/services/pokemon_service.dart';

import '../detail/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokemonService = const PokemonService();

  void _openDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.zubat),
            TextButton(
              onPressed: _openDetail,
              child: const Text('Open'),
            ),
          ],
        ),
      ),
    );
  }
}
