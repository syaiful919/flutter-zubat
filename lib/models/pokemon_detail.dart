import 'package:zubat/models/pokemon_move.dart';
import 'package:zubat/models/pokemon_type.dart';

class PokemonDetail {
  final String name;
  final String pokedexNumber;
  final String description;
  final List<PokemonType> types;
  final List<PokemonMove> moves;
  final String imagePath;
  final String headerImagePath;

  const PokemonDetail({
    required this.name,
    required this.pokedexNumber,
    required this.description,
    required this.types,
    required this.moves,
    required this.imagePath,
    required this.headerImagePath,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    final types = List<String>.from(json["types"].map((x) => x));
    final PokemonType firstType = types.first.getPokemonType();

    return PokemonDetail(
      name: json["name"],
      pokedexNumber: json["pokedexNumber"],
      description: json["description"],
      types: List<PokemonType>.from(
        types.map((x) => x.getPokemonType()),
      ),
      moves: List<PokemonMove>.from(
        json["moves"].map((x) => PokemonMove.fromJson(x)),
      ),
      imagePath: json["imagePath"],
      headerImagePath: firstType.getBackgroundHeaderPath(),
    );
  }

  PokemonDetail copyWith({
    String? name,
    String? pokedexNumber,
    String? description,
    List<PokemonType>? types,
    List<PokemonMove>? moves,
    String? imagePath,
    String? headerImagePath,
  }) {
    return PokemonDetail(
      name: name ?? this.name,
      pokedexNumber: pokedexNumber ?? this.pokedexNumber,
      description: description ?? this.description,
      types: types ?? this.types,
      moves: moves ?? this.moves,
      imagePath: imagePath ?? this.imagePath,
      headerImagePath: headerImagePath ?? this.headerImagePath,
    );
  }
}
