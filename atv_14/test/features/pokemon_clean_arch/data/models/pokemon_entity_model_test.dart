import 'dart:convert';
import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';
import 'package:atv_14/features/pokemon_clean_arch/domain/entities/pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';


void main() {
  final tPokemonModel = PokemonEntityModel(
    id: 1,
    name: 'Bulbasaur',
  );
  group('subclass', (){
    test('should be subclass of PokemonEntity', (){
      expect(tPokemonModel, isA<PokemonEntity>());
    });
  });

  group('json tests',  (){
    test('should be json', (){ //!
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixtures('pokemon_fixture.json'));

      // act
      final result = PokemonEntityModel.fromJson(jsonMap);

      // asset
      expect(result, tPokemonModel);
    });

    test('should be return a map from json inserted', (){ //!
      final result = tPokemonModel.toJson();
      final mapGenerated = {
        'id': 1,
        'name': 'Bulbasaur',
      };
      expect(result, mapGenerated);
    });
  });



}