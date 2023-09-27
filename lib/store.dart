import 'package:flutter/material.dart';
import 'package:statepattern/service.dart';
import 'package:statepattern/state.dart';

class Store extends ChangeNotifier {
  final service = PokemonService();

  var state = PokemonState.empty();

  getPokemons() async {
    state = state.copyWith(
      error: '',
      isLoading: true,
      pokemons: [],
    );
    notifyListeners();

    try {
      final pokemons = await service.fetchAll();
      state = state.copyWith(
        error: '',
        isLoading: false,
        pokemons: pokemons,
      );
      notifyListeners();
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
        pokemons: [],
      );
      notifyListeners();
    }
  }
}
