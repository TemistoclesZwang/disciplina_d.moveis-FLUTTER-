import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../entities/pokemon_entity.dart';
import '../../repositories/pokemon_repository.dart';
import '../../usecases/get_all_pokemon/get_all_pokemon_imp_test.dart';



class MockPokemonRepository extends Mock
    implements PokemonRepository {}

void main() {
  GetAllPokemonImp usecase;
  MockPokemonRepository mockPokemonRepository;

  // const tNumber = 1;
  // const tNumberPokemon = NumberPokemon(number: 1, text: 'test');

  test(
    'should get all pokemon',
    () async {
      // arrange
      mockPokemonRepository = MockPokemonRepository();
      when(mockPokemonRepository.getAllPokemonImp())
          .thenAnswer((_) async => Right());
      // act
      usecase = GetAllPokemonImp(mockPokemonRepository);
      final result = await usecase.execute();
      // assert
      expect(result, const Right());
      verify(mockPokemonRepository.getAllPokemonImp());
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );
}