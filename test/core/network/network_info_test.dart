import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'network_info_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late NetworkInfoImpl sut;
  late MockClient client;

  setUp(() {
    client = MockClient();
    sut = NetworkInfoImpl(client);
  });

  group('Testing is connected', () {
    test(
      "Should return true if response is 200",
      () async {
        //arrange
        when(client.post(any, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response("{\"success\": 1}", 200));
        //act
        final result = await sut.isConnected;
        //assert
        expect(result, true);
      },
    );

    test(
      "Should return false if response is 404",
      () async {
        //arrange
        when(client.post(any, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response("{\"success\": 1}", 404));
        //act
        final result = await sut.isConnected;
        //assert
        expect(result, false);
      },
    );

    test(
      "Should return false if response is \"success\": 0",
      () async {
        //arrange
        when(client.post(any, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response("{\"success\": 0}", 200));
        //act
        final result = await sut.isConnected;
        //assert
        expect(result, false);
      },
    );

    test(
      "Should return false on TimeoutException",
      () async {
        //arrange
        when(client.post(any, body: anyNamed('body')))
            .thenThrow(TimeoutException('TimeOut'));
        //act
        final result = await sut.isConnected;
        //assert
        expect(result, false);
      },
    );
  });
}