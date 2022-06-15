import 'package:atv_14/core/platform/network_info.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/local/pokemon_local_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/repositories/pokemon_repository_imp.dart';
import 'package:atv_14/features/pokemon_clean_arch/domain/entities/pokemon_entity.dart';
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
    final mockRemoteDataSource = MockRemoteDataSource();
    final mockLocalDataSource = MockLocalDataSource();
    final mockNetworkInfo = MockNetworkInfo();
    final repository = PokemonRepositoryImp(

      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getConcreteNumberTrivia', () {
  // DATA FOR THE MOCKS AND ASSERTIONS
  // We'll use these three variables throughout all the tests
  final tId = 1;
  final mockNetworkInfo = MockNetworkInfo();
  final tPokemonModel =
      PokemonEntityModel( id: tId, name: 'Bulbasaur');
  final PokemonEntity tPokemonEntity = tPokemonModel;

  test('should check if the device is online', () {
    //arrange
  setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
  });
});

}