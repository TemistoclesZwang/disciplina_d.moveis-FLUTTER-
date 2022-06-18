import 'package:atv_14/core/error/exceptions.dart';
import 'package:atv_14/core/error/failure.dart';
import 'package:atv_14/core/platform/network_info.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/local/pokemon_local_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/repositories/pokemon_repository_imp.dart';
import 'package:atv_14/features/pokemon_clean_arch/domain/entities/pokemon_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:data_connection_checker/data_connection_checker.dart';


class MockRemoteDataSource extends Mock
    implements PokemonRemoteDataSource {}

class MockLocalDataSource extends Mock implements GetLastPokemonLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
    PokemonRepositoryImp repository;
    MockRemoteDataSource mockRemoteDataSource;
    MockLocalDataSource mockLocalDataSource;
    MockNetworkInfo mockNetworkInfo;    
    

    
    setUp(() {
        mockRemoteDataSource = MockRemoteDataSource();
        mockLocalDataSource = MockLocalDataSource();
        mockNetworkInfo = MockNetworkInfo();
        repository = PokemonRepositoryImp(
            remoteDataSource: mockRemoteDataSource,
            localDataSource: mockLocalDataSource,
            networkInfo: mockNetworkInfo,
        );

    // }); //!

    void runTestsOnline(Function body) {
        group('device is online', () {
            setUp(() {
                when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
            });

            body();
        });
    }

    void runTestsOffline(Function body) {
        group('device is offline', () {
            setUp(() {
                when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
            });

            body();
        });
    }
  group('getAllPokemon', () {
        final tId = 1;
  final tPokemonModel =
      PokemonEntityModel( id: tId, name: 'Bulbasaur');
  final PokemonEntity tPokemonEntity = tPokemonModel;
  // DATA FOR THE MOCKS AND ASSERTIONS
  // We'll use these three variables throughout all the tests

  setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
  test('should check if the device is online', () {
  //arrange
  when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  // act
  repository.getAllPokemon();
  // assert
  verify(() => mockNetworkInfo.isConnected);
});


  runTestsOnline(() { 
  // This setUp applies only to the 'device is online' group

  test(
    'should return remote data when the call to remote data source is successful',
    () async {
      // arrange
      when(() => mockRemoteDataSource.GetOnePokemon(tId)
          ).thenAnswer((_) async => tPokemonModel);
      // act
      final result = await repository.getOnePokemon(tId);
      // assert
      verify(() => mockRemoteDataSource.GetOnePokemon(tId));
      expect(result, equals(Right(tPokemonEntity)));
    },
  );
    test(
    'should return server failure when the call to remote data source is unsuccessfull',
    () async {
      // arrange
      when(() => mockRemoteDataSource.GetOnePokemon(tId)
          ).thenThrow(ServerException());
      // act
      final result = await repository.getOnePokemon(tId);
      // assert
      verify(() => mockRemoteDataSource.GetOnePokemon(tId));
      verifyZeroInteractions(mockRemoteDataSource);

      expect(result, equals(Left(ServerFailure())));
    },
  );
});


  runTestsOffline( (){

  test(
    'should return last locally cached data when the cached data is present',
    () async {
      // arrange
      when(() => mockLocalDataSource.getLastPokemon())
          .thenAnswer((_) async => tPokemonModel);
      // act
      final result = await repository.getOnePokemon(tId);
      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      verify(() => mockLocalDataSource.getLastPokemon());
      expect(result, equals(Right(tPokemonEntity)));
    },
  );

    test(
    'should return CacheFailure when there is no  cached data is present',
    () async {
      // arrange
      when(() => mockLocalDataSource.getLastPokemon())
          .thenThrow(CacheException());
      // act
      final result = await repository.getOnePokemon(tId);
      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      verify(() => mockLocalDataSource.getLastPokemon());
      expect(result, equals(Left(CacheFailure())));
    },
  );
});

//.end
  });
  // });
//!inicio
  group('getAllPokemon', () {

  final tPokemonModel =
      PokemonEntityModel( id: 1, name: 'Bulbasaur');
  final PokemonEntity tPokemonEntity = tPokemonModel;
  // DATA FOR THE MOCKS AND ASSERTIONS
  // We'll use these three variables throughout all the tests

  test('should check if the device is online', () {
  //arrange
  when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  // act
  repository.getAllPokemon();
  // assert
  verify(() => mockNetworkInfo.isConnected);
});


  runTestsOnline(() { 
  // This setUp applies only to the 'device is online' group

  test(
    'should return remote data when the call to remote data source is successful',
    () async {
      // arrange
      when(() => mockRemoteDataSource.GetAllPokemon()
          ).thenAnswer((_) async => tPokemonModel);
      // act
      final result = await repository.getAllPokemon();
      // assert
      verify(() => mockRemoteDataSource.GetAllPokemon());
      expect(result, equals(Right(tPokemonEntity)));
    },
  );
    test(
    'should return server failure when the call to remote data source is unsuccessfull',
    () async {
      // arrange
      when(() => mockRemoteDataSource.GetAllPokemon()
          ).thenThrow(ServerException());
      // act
      final result = await repository.getAllPokemon();
      // assert
      verify(() => mockRemoteDataSource.GetAllPokemon());
      verifyZeroInteractions(mockRemoteDataSource);

      expect(result, equals(Left(ServerFailure())));
    },
  );
});


  runTestsOffline( (){

  test(
    'should return last locally cached data when the cached data is present',
    () async {
      // arrange
      when(() => mockLocalDataSource.getLastPokemon())
          .thenAnswer((_) async => tPokemonModel);
      // act
      final result = await repository.getAllPokemon();
      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      verify(() => mockLocalDataSource.getLastPokemon());
      expect(result, equals(Right(tPokemonEntity)));
    },
  );

    test(
    'should return CacheFailure when there is no  cached data is present',
    () async {
      // arrange
      when(() => mockLocalDataSource.getLastPokemon())
          .thenThrow(CacheException());
      // act
      final result = await repository.getAllPokemon();
      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      verify(() => mockLocalDataSource.getLastPokemon());
      expect(result, equals(Left(CacheFailure())));
    },
  );
});

//.end
  });
  });
  
}