import 'package:atv_14/core/network/network_info.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/local/pokemon_local_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/repositories/pokemon_repository_imp.dart';
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
  });
}