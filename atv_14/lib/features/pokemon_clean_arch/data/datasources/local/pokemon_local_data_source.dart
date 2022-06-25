import 'dart:convert';

import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class PokemonLocalDataSource {
  Future<PokemonEntityModel> getLastPokemon();
  Future<void> cachePokemon(PokemonEntityModel pokemonToCache);
}

const CACHED_POKEMON_ENTITY = 'CACHED_POKEMON_ENTITY';

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final SharedPreferences sharedPreferences;
  PokemonLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PokemonEntityModel> getLastPokemon() {
    final jsonString = sharedPreferences.getString(CACHED_POKEMON_ENTITY);
    if (jsonString != null) {
      return Future.value(PokemonEntityModel.fromJson(json.decode(jsonString)));
    } else {
      // TODO: implement getLastPokemon
      throw UnimplementedError();
    }
  }

  @override
  Future<void> cachePokemon(PokemonEntityModel pokemonToCache) {
    return sharedPreferences.setString(
    CACHED_POKEMON_ENTITY,
    json.encode(pokemonToCache.toJson()),
  );
  }
}
