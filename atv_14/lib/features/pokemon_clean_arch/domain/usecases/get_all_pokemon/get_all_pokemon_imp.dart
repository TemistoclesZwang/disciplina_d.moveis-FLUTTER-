import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failure.dart';

import '../../entities/pokemon_entity.dart';
import '../../repositories/pokemon_repository.dart';
import 'get_all_pokemon_usecase.dart';
//.import 'package:rick_and_morty/presentation/features/rick_and_morty/presentation/widgets/character_card.dart';

class GetAllPokemonImp implements GetAllPokemonUsecase {
  final PokemonRepository _pokemonRepository;
  GetAllPokemonImp(this._pokemonRepository);

  // @override
  // Future<dynamic> getAllPokemon() async {
    // return await _characterRepository.getAllPokemon();
  // } //.antigo

    Future<Either<Failure, PokemonEntity>> execute({
    required int number, //!
  }) async {
    return await _pokemonRepository.getAllPokemon();
  }
  
  @override
  Future<List> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
  
