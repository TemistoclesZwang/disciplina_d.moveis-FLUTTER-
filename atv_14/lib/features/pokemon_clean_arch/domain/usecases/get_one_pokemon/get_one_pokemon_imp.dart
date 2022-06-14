import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failure.dart';

import '../../entities/pokemon_entity.dart';
import '../../repositories/pokemon_repository.dart';
import '../../../../../core/usecases/usecase_failure_standard.dart';

import '../../../../../core/error/failure.dart';

class GetOnePokemonImp extends UseCase<PokemonEntity, Params> {
  final PokemonRepository repository;

  GetOnePokemonImp(this.repository);

  @override
  Future<Either<Failure, PokemonEntity>> call(Params params) async {
    return await repository.getOnePokemon(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params({required this.id});

  @override
  List<Object?> get props => throw None();
}