import 'package:zubat/models/common/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

      emit(
        state.copyWith(pokemonDetail: ViewState.success(data: response)),
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
