import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  void _onTapBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_poison_header.png'),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: Image.network(
                  'https://img.pokemondb.net/artwork/vector/zubat.png',
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
                    icon: Icon(
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
                  'Zubat',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '#041',
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
                  children: List.generate(9, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xffaa5599),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      child: Text(
                        'Poison',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 12),
                Text(
                  'Zubat is a Poison/Flying type Pokémon introduced in Generation 1.',
                ),
                const SizedBox(height: 12),
                Text(
                  'Moves',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                ...['xxx', 'ssss', 'xxxx'].map(
                  (e) => Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          '1',
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        flex: 10,
                        child: Text(
                          e,
                        ),
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
