import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failure.dart';

import '../../entities/pokemon_entity.dart';
import '../../repositories/pokemon_repository.dart';
import '../../../../../core/usecases/usecase_failure_standard.dart';

import '../../../../../core/error/failure.dart';


class GetAllPokemonImp extends UseCase<List<PokemonEntity>, NoParams> {
  final PokemonRepository repository;

  GetAllPokemonImp(this.repository);

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(NoParams params) async {
    return await repository.getAllPokemon();
  }
}