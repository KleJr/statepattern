// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:statepattern/service.dart';

//usando polimorfismo => a classe se adapta ao que precisa

sealed class PokemonStte {}

class EmptyPokemonState implements PokemonStte {}

class LoadingPokemonState implements PokemonStte {}

class ErrorPokemonState implements PokemonStte {
  final String error;
  ErrorPokemonState(this.error);
}

class GettedPokemonState implements PokemonStte {
  final List<Pokemon> pokemons;
  GettedPokemonState(
    this.pokemons,
  );
}
