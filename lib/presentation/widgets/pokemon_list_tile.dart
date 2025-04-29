import 'package:flutter/material.dart';

class PokemonListTile extends StatelessWidget {
  const PokemonListTile({super.key, required this.pokemonURL});

  final String pokemonURL;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(pokemonURL));
  }
}
