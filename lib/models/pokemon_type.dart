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
