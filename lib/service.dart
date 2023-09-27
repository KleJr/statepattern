class Pokemon {
  String name;
  Pokemon(this.name);
}

class PokemonService {
  Future<List<Pokemon>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Pokemon('Picachu'),
      Pokemon('Mewtwo'),
      Pokemon('Mew'),
      Pokemon('Rayquaza'),
      Pokemon('Lugia'),
      Pokemon('Giratina')
    ];
  }
}
