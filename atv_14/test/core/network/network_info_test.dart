import 'dart:html';

import 'package:atv_14/core/network/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {
  void main() {
    NetworkInfoImpl networkInfoImp;
    MockDataConnectionChecker mockDataConnectionChecker;

    setUp(() {
      mockDataConnectionChecker = MockDataConnectionChecker();
      networkInfoImp = NetworkInfoImpl(mockDataConnectionChecker);
      
      group('isConnected', () {
        test('should forward the call to DataConnectionChecker.hasConnection',
            () async {
          final tHasConnectionFuture = Future.value(true);

          when(() => mockDataConnectionChecker.hasConnection)
              .thenAnswer((_)  => tHasConnectionFuture);
          final result = networkInfoImp.isConnected;
          verify(() => mockDataConnectionChecker.hasConnection);
          expect(result, tHasConnectionFuture);
        });
      });
    });
  }
}
