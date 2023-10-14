class PokemonMove {
  final int learntLevel;
  final String name;

  const PokemonMove({
    required this.learntLevel,
    required this.name,
  });

  factory PokemonMove.fromJson(Map<String, dynamic> json) {
    return PokemonMove(
      learntLevel: json["learntLevel"] ?? "",
      name: json["name"] ?? "",
    );
  }
}
