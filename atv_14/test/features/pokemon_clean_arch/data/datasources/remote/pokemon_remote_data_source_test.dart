import 'dart:convert';
import 'package:atv_14/core/error/exceptions.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:atv_14/features/pokemon_clean_arch/data/models/pokemon_entity_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';
import 'package:matcher/matcher.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  PokemonRemoteDataSourceImp dataSource;
  MockHttpClient mockHttpClient; //!

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PokemonRemoteDataSourceImp(client: mockHttpClient);

    void setUpMockHttpClientSuccess200() {
      when(() => mockHttpClient.get(any(), headers: any())).thenAnswer(
        (_) async => http.Response(fixtures('pokemon.json'), 200),
      );
    }

    void setUpMockHttpClientFailure404() {
      when(() => mockHttpClient.get(any(), headers: any())).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
    }

    group('getOnePokemon', () {
      final tNumber = 1;
      final tNumberPokemonModel =
          PokemonEntityModel.fromJson(json.decode(fixtures('pokemon.json')));
      test(
          'should preform a GET request on a URL with number being the endpoint and with application/json header',
          () async {
        when(() => mockHttpClient
                .get(any(), headers: {'Content-type': 'headers'})) //!
            .thenAnswer(
                (_) async => http.Response(fixtures('pokemon.json'), 200));

        setUpMockHttpClientSuccess200();
        dataSource.getOnePokemon(tNumber);

        final String apiEndpoint = 'https://pokeapi.co/api/v2/pokemon/$tNumber';
        final Uri url = Uri.parse(apiEndpoint);

        verify(() => mockHttpClient.get(
              url,
              headers: {
                'Content-Type': 'application/json',
              },
            ));
      });

      test(
        'should return NumberTrivia when the response code is 200 (success)',
        () async {
          // arrange
          setUpMockHttpClientSuccess200();
          // act
          final result = await dataSource.getOnePokemon(tNumber);
          // assert
          expect(result, equals(tNumberPokemonModel));
        },
      );
      test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
          // arrange
          setUpMockHttpClientFailure404();
          // act
          final call = dataSource.getAllPokemon();
          // assert
          expect(() => call, throwsA(TypeMatcher<ServerException>()));
        }, //!
      );

      
    });
  });
}//.fim