import 'dart:convert';

import 'package:atv_14/core/error/exceptions.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';
import 'package:http/http.dart' as http;


abstract class PokemonRemoteDataSource {
  Future<PokemonEntityModel> getOnePokemon(int number);
  
  Future<PokemonEntityModel> getAllPokemon();
}

class PokemonRemoteDataSourceImp implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImp({required this.client});

  @override
  Future<PokemonEntityModel> getOnePokemon(int number) async {
    final String apiEndpoint = 'https://pokeapi.co/api/v2/pokemon/$number';
    final Uri url = Uri.parse(apiEndpoint);
    // final response = await http.post(url);

    client.get (url,
            headers: {
              'Content-Type': 'application/json',
    },
    );
    // return throw UnimplementedError();
    final response = await client.get(
    url, headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return PokemonEntityModel.fromJson(json.decode(response.body));
  } else {
    throw ServerException();
  }
  }

  @override
  Future<PokemonEntityModel> getAllPokemon() {
    return throw UnimplementedError();
    
  }


  
}
