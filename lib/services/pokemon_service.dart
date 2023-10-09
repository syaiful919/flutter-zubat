import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zubat/models/pokemon_detail.dart';

class PokemonService {
  const PokemonService();

  Future<PokemonDetail> getPokemonDetail(String id) async {
    // simulate get data from network
    await Future.delayed(const Duration(seconds: 2));
    final String jsonString =
        await rootBundle.loadString('assets/json/$id.json');

    return PokemonDetail.fromJson(jsonDecode(jsonString));
  }
}
