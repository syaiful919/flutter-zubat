import 'package:zubat/models/common/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zubat/models/pokemon_detail.dart';
import 'package:zubat/models/pokemon_move.dart';
import 'package:zubat/ui/pages/detail/bloc/detail_page_state.dart';
import 'package:zubat/services/pokemon_service.dart';

class DetailPageCubit extends Cubit<DetailPageState> {
  final PokemonService pokemonService;

  DetailPageCubit({
    required this.pokemonService,
  }) : super(
          DetailPageState(
            pokemonDetail: ViewState.initial(),
          ),
        );

  Future<void> loadData() async {
    try {
      emit(state.copyWith(pokemonDetail: ViewState.loading()));

      final response = await pokemonService.getPokemonDetail('zubat');

      final List<PokemonMove> moves = List.from(response.moves);
      moves.sort((a, b) => a.name.compareTo(b.name));

      final PokemonDetail pokemonDetail = response.copyWith(
        moves: moves,
      );

      emit(
        state.copyWith(pokemonDetail: ViewState.success(data: pokemonDetail)),
      );
    } catch (_) {
      emit(
        state.copyWith(
          pokemonDetail: ViewState.error(message: 'something error'),
        ),
      );
    }
  }
}
