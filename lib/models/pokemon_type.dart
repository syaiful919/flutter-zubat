import 'package:flutter/material.dart';
import 'package:zubat/const/app_images.dart';

enum PokemonType {
  normal,
  flying,
  poison;

  String getBackgroundHeaderPath() {
    switch (this) {
      case PokemonType.poison:
        return AppImages.poisonHeader;
      default:
        return '';
    }
  }

  Color getBackgroundColor() {
    switch (this) {
      case PokemonType.poison:
        return const Color(0xFFB567CE);
      case PokemonType.flying:
        return const Color(0xFF89AAE3);
      default:
        return Colors.white;
    }
  }
}

extension PokemonTypeStringExt on String {
  PokemonType getPokemonType() {
    switch (this) {
      case 'flying':
        return PokemonType.flying;
      case 'poison':
        return PokemonType.poison;
      case 'normal':
      default:
        return PokemonType.normal;
    }
  }
}
