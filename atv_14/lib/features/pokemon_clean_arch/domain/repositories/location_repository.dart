import 'package:dartz/dartz.dart';
import '../entities/pokemon_entity.dart';
import '../../../../core/error/failure.dart';

abstract class LocationEntity {
  Future<Either<Failure, LocationEntity>> getLocationPokemon(int id);
  // é um future que retorna uma falha ou um acerto (pokemon entity)
}
