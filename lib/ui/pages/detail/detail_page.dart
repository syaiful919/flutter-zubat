import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zubat/models/pokemon_detail.dart';
import 'package:zubat/ui/pages/detail/bloc/detail_page_cubit.dart';
import 'package:zubat/ui/pages/detail/bloc/detail_page_state.dart';
import 'package:zubat/services/pokemon_service.dart';
import 'package:zubat/ui/pages/detail/widgets/detail_page_shimmer.dart';
import 'package:zubat/ui/pages/detail/widgets/element_type_chip.dart';
import 'package:zubat/ui/widgets/view_state_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _pokemonService = const PokemonService();

  void _onTapBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailPageCubit>(
      create: (_) {
        return DetailPageCubit(
          pokemonService: _pokemonService,
        )..loadData();
      },
      child: BlocBuilder<DetailPageCubit, DetailPageState>(
        builder: (context, snapshot) {
          return ViewStateWidget(
            state: snapshot.pokemonDetail,
            onSuccess: _getContent,
            onLoading: () => const DetailPageShimmer(),
          );
        },
      ),
    );
  }

  Widget _getContent(PokemonDetail data) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data.headerImagePath),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Image.network(
                  data.imagePath,
                  width: MediaQuery.sizeOf(context).width * 0.64,
                  height: MediaQuery.sizeOf(context).width * 0.64,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: SafeArea(
                  child: IconButton(
                    onPressed: _onTapBack,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  data.pokedexNumber,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 2,
                  runSpacing: 4,
                  children: data.types
                      .map((e) => ElementTypeChip(
                            backgroundColor: e.getBackgroundColor(),
                            name: e.name,
                          ))
                      .toList(),
                ),
                const SizedBox(height: 12),
                Text(data.description),
                const SizedBox(height: 12),
                const Text(
                  'Moves',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                ...data.moves.map(
                  (e) => Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text("${e.learntLevel}"),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        flex: 10,
                        child: Text(e.name),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
