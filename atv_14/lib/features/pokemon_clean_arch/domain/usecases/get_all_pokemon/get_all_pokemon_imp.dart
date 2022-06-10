import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failure.dart';

import '../../entities/pokemon_entity.dart';
import '../../repositories/pokemon_repository.dart';
import '../../../../../core/error/usecases/usecase_failure_standard.dart';
//.import 'package:rick_and_morty/presentation/features/rick_and_morty/presentation/widgets/character_card.dart';

class GetAllPokemonImp extends UseCase<List<PokemonEntity>, NoParams> {
  final PokemonRepository repository;

  GetAllPokemonImp(this.repository);

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(NoParams params) async {
    return await repository.getAllPokemon();
  }
}