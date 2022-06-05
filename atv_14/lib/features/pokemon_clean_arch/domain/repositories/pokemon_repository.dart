import 'package:dartz/dartz.dart';
import '../entities/pokemon_entity.dart';
import '../../../../core/error/failure.dart';

abstract class PokemonRepository {
  // Future<List<dynamic>> getAllCharacters(); //.antigo
  // Future<dynamic> getOneCharacter(int id); //.antigo
  Future<Either<Failure, PokemonEntity>> getAllPokemon();
  Future<Either<Failure, PokemonEntity>> getOnePokemon(int id);
}
