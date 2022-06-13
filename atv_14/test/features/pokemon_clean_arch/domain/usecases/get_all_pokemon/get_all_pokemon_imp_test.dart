import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../lib/features/pokemon_clean_arch/domain/usecases/get_all_pokemon/get_all_pokemon_imp.dart';
import '../../../../../../lib/features/pokemon_clean_arch/domain/repositories/pokemon_repository.dart';
import '../../../../../../lib/features/pokemon_clean_arch/domain/entities/pokemon_entity.dart';
import '../../../../../../lib/core/usecases/usecase_failure_standard.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}
void main() {
  final mockPokemonRepository = MockPokemonRepository();
  final usecase = GetAllPokemonImp(mockPokemonRepository);

  final tPokemon1 = PokemonEntity (
    id: 1,
    name: 'Bulbasaur',
  );

  final tPokemon2 = PokemonEntity (
    id: 2,
    name: 'Ivysaur',
  );

  final tListPokemon = [tPokemon1,tPokemon2];
  test ('should get all pokemon in the list', () async {
    when(() => mockPokemonRepository.getAllPokemon())
      .thenAnswer((_) async => Right(tListPokemon));
    final result = await usecase(NoParams());

    expect(result, Right(tListPokemon));

    verify(() => mockPokemonRepository.getAllPokemon());
    verifyNoMoreInteractions(mockPokemonRepository);
});
}
