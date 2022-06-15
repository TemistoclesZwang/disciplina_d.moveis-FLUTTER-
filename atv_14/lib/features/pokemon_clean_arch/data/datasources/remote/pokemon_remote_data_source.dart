import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonEntityModel> GetOnePokemon(int number);
  
  Future<PokemonEntityModel> GetAllPokemon();
}