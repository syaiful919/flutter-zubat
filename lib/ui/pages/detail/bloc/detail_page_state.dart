import 'package:zubat/models/common/view_state.dart';
import 'package:zubat/models/pokemon_detail.dart';

class DetailPageState {
  final ViewState<PokemonDetail> pokemonDetail;

  const DetailPageState({
    required this.pokemonDetail,
  });

  DetailPageState copyWith({
    ViewState<PokemonDetail>? pokemonDetail,
  }) {
    return DetailPageState(
      pokemonDetail: pokemonDetail ?? this.pokemonDetail,
    );
  }
}
