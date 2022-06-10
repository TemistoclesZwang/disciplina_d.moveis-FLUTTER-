import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../lib/features/pokemon_clean_arch/domain/usecases/get_one_pokemon/get_one_pokemon_imp.dart';
import '../../../../../../lib/features/pokemon_clean_arch/domain/repositories/pokemon_repository.dart';
import '../../../../../../lib/features/pokemon_clean_arch/domain/entities/pokemon_entity.dart';
import '../../../../../../lib/features/pokemon_clean_arch/domain/usecases/pokemon_usecase.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}
void main() {
  final mockPokemonRepository = MockPokemonRepository();
  final usecase = GetOnePokemonImp(mockPokemonRepository);

  final tPokemon = PokemonEntity (
    id: 1,
    name: 'Bulbasaur',
  );


  final tIdPokemon = 1;
  test ('should get one pokemon in the list', () async {
    when(() => mockPokemonRepository.getOnePokemon(tIdPokemon))
      .thenAnswer((_) async => Right(tPokemon));
    final result = await usecase(Params(id: tIdPokemon));

    expect(result, Right(tPokemon));

    verify(() => mockPokemonRepository.getOnePokemon(tIdPokemon));
    verifyNoMoreInteractions(mockPokemonRepository);
});
}
