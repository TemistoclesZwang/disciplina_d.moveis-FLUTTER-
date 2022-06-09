import 'package:dartz/dartz.dart';
import '../entities/pokemon_entity.dart';
import '../../../../core/error/failure.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getAllPokemon(); // é um future que retorna uma falha ou um acerto (pokemon entity)
  Future<Either<Failure, PokemonEntity>> getOnePokemon(int id);
}
