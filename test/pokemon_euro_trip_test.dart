
import 'package:test/test.dart';

import '../bin/pokemon.dart';

void main() {
  test('Obtener datos de torchic desde la PokeApi', () async {
    final Pokemon = await obtenerPokemon("torchic");

    expect(Pokemon, isNotNull);
    expect(Pokemon!.nombre, "torchic");
    expect(Pokemon.vida, greaterThan(0));
    expect(Pokemon.tipos, contains("fire"));
  });
}
