import 'package:flutter/material.dart';
import 'package:statepattern/home2/state.dart';

import 'store.dart';

class MyHome2 extends StatelessWidget {
  MyHome2({super.key});

  final store = PokemonStore();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: store,
        builder: (context, child) {
          final state = store.state;
          Widget body = Container();

          if (state is LoadingPokemonState) {
            body = const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.yellow,
                color: Colors.black,
              ),
            );
          } else if (state is ErrorPokemonState) {
            body = Center(
              child: ElevatedButton(
                onPressed: store.getPokemons,
                child: Text(state.error.isNotEmpty
                    ? state.error
                    : 'Click para pegar Pokemon'),
              ),
            );
          } else if (state is EmptyPokemonState) {
            body = Center(
              child: ElevatedButton(
                onPressed: store.getPokemons,
                child: const Text('Click para pegar Pokemon'),
              ),
            );
          } else if (state is GettedPokemonState) {
            body = ListView.builder(
                shrinkWrap: true,
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  return Text(state.pokemons[index].name);
                });
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('widget.title 2'),
            ),
            body: body,

            floatingActionButton: FloatingActionButton(
              onPressed: store.getPokemons,
              tooltip: 'Increment',
              child: const Icon(Icons.refresh),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
