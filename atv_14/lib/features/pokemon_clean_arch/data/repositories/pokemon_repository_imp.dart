import 'package:atv_14/core/error/exceptions.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/local/pokemon_local_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:atv_14/features/pokemon_clean_arch/domain/entities/pokemon_entity.dart';

import 'package:atv_14/core/error/failure.dart';

import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImp implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource; 
  final GetLastPokemonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PokemonRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PokemonEntity>>> getAllPokemon() {
    // TODO: implement getAllPokemon
    throw UnimplementedError();
  }

//   @override
//   Future<Either<Failure, List<PokemonEntity>>> getAllPokemon () async{
//       if (await networkInfo.isConnected) {
// //get remote data
//       try {
//         final remotePokemon = await remoteDataSource.GetAllPokemon();
//         localDataSource.cachePokemon(remotePokemon);
//         return Right(remotePokemon);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       try {
//         final localPokemon = await localDataSource.getLastPokemon();
//         return Right(localPokemon);
//       } on CacheException {
//         return Left(CacheFailure());
//       }
//     }

//   }


  @override
  Future<Either<Failure, PokemonEntity>> getOnePokemon(int id) async {
    if (await networkInfo.isConnected) {
//get remote data
      try {
        final remotePokemon = await remoteDataSource.GetOnePokemon(id);
        localDataSource.cachePokemon(remotePokemon);
        return Right(remotePokemon);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPokemon = await localDataSource.getLastPokemon();
        return Right(localPokemon);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
