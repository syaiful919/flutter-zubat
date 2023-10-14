class GenderPercentage {
  final double male;
  final double female;

  const GenderPercentage({
    required this.male,
    required this.female,
  });

  factory GenderPercentage.fromJson(Map<String, dynamic> json) {
    return GenderPercentage(
      male: json["male"] ?? 0,
      female: json["female"] ?? 0,
    );
  }
}
