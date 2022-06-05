import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../entities/pokemon_entity.dart';
import '../../repositories/pokemon_repository.dart';
import '../../usecases/get_one_pokemon/get_one_pokemon_imp_test.dart';


class MockPokemonRepository extends Mock
    implements PokemonRepository {}

void main() {
  GetOnePokemonImp usecase;
  MockPokemonRepository mockPokemonRepository;

  const tNumber = 1;
  const tNumberPokemon = NumberPokemon(number: 1, text: 'test');

  test(
    'should get one pokemon from the number',
    () async {
      // arrange
      mockPokemonRepository = MockPokemonRepository();
      when(mockPokemonRepository.getOnePokemonImp(1))
          .thenAnswer((_) async => Right(tNumberPokemon));
      // act
      usecase = GetOnePokemonImp(mockPokemonRepository);
      final result = await usecase.execute(number: tNumber);
      // assert
      expect(result, const Right(tNumberPokemon));
      verify(mockPokemonRepository.getOnePokemonImp(tNumber));
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );
}