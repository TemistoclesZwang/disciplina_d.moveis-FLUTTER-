import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';


abstract class GetLastPokemonLocalDataSource {
  Future<PokemonEntityModel> getLastPokemon();
  Future<void> cachePokemon(PokemonEntityModel pokemonToCache);
}


