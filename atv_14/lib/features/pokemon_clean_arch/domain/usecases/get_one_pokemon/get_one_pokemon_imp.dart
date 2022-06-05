import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failure.dart';

import '../../entities/pokemon_entity.dart';
import '../../repositories/pokemon_repository.dart';
import '../../usecases/get_one_pokemon/get_one_pokemon_usecase.dart';


class GetOnePokemonImp implements GetOnePokemonUsecase {
  final PokemonRepository _pokemonRepository;
  GetOnePokemonImp(this._pokemonRepository);


    Future<Either<Failure, PokemonEntity>> execute({
    required int id,
  }) async {
    return await _pokemonRepository.getOnePokemon(id);
  }
  
  @override
  Future<List> call() {
    throw UnimplementedError();
  }
}
  
