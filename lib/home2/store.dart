import 'package:flutter/material.dart';
import 'package:statepattern/home2/state.dart';
import 'package:statepattern/service.dart';

class PokemonStore extends ChangeNotifier {
  final service = PokemonService();

  //usando o polimorfismo, eu posso receber qualquer instancia do filho da sealed class
  // instancias diferentes na mesma propriedade.
  //estamos esperando a classe PAI no state, entao qualquer
  // intancia que herda a classe pai podera ser atribuida
  //nome disso é inversao de controle.

  PokemonStte state = EmptyPokemonState();

  getPokemons() async {
    state = LoadingPokemonState();
    notifyListeners();

    try {
      final pokemons = await service.fetchAll();
      state = GettedPokemonState(pokemons);
      notifyListeners();
    } catch (e) {
      state = ErrorPokemonState(e.toString());
      notifyListeners();
    }
  }
}
