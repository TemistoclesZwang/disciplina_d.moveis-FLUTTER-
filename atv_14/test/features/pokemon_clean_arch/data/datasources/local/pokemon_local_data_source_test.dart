import 'dart:convert';
import 'package:atv_14/core/error/exceptions.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/local/pokemon_local_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  PokemonLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = PokemonLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
    group('getLastPokemon', () {
      final tPokemonModel = PokemonEntityModel.fromJson(
          json.decode(fixtures('pokemon_cached.json')));
      test(
        'should return PokemonEntityModel from SharedPreferences when there is one in the cache',
        () async {
          when(() => mockSharedPreferences.getString(any())) //!
              .thenReturn(fixtures('pokemon_cached.json'));
          final result = await dataSource.getLastPokemon();
          verify(() => mockSharedPreferences.getString(CACHED_POKEMON_ENTITY));
          expect(result, equals(tPokemonModel));
        },
      );
      test(
        'should throw a CacheException when there is not a cached value',
        () async {
          when(() =>
              mockSharedPreferences.getString(any()).thenReturn(null)); //!

          final call = dataSource.getLastPokemon();
          expect(()=> call, throwsA(TypeMatcher<CacheException>()));
        },
      );
      group('cachePokemon', () {
  final tNumberTriviaModel =
      PokemonEntityModel(id: 1, name: 'Bulbasaur');

  test('should call SharedPreferences to cache the data', () {
    // act
    dataSource.cachePokemon(tPokemonModel);
    // assert
    final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
    verify(() => mockSharedPreferences.setString(
      CACHED_POKEMON_ENTITY,expectedJsonString,
    ));
  });
    });
  });
  });
}
