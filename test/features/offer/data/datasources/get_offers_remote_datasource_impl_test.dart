import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/offer/data/datasources/get_offers_remote_datasource.dart';
import 'package:mady_seller/features/offer/data/models/get_offers/get_offers_model.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'get_offers_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiProvider])
void main() {
  late GetOffersRemoteDatasourceImpl sut;
  late MockApiProvider apiProvider;

  setUp(() {
    apiProvider = MockApiProvider();
    sut = GetOffersRemoteDatasourceImpl(apiProvider);
  });

  group('getOffers test', () {
    const tParams = Params({'action': 'get_offers', 'sid': '9'});
    final tOffers =
        GetOffersModel.fromJson(jsonDecode(fixture('get_offers.json'))).offers;

    final tOffersEmpty = <Offer>[];
    test(
      "Should perform a post request to [currentDataUrl] with proper params",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenAnswer((_) async => Response(fixture('get_offers.json'), 200));
        //act
        await sut.getOffers(tParams.param);
        //assert
        verify(apiProvider.post(currentDataUrl, params: tParams.param));
        verifyNoMoreInteractions(apiProvider);
      },
    );

    test(
      "Should throws a [ServerException] if call is not success 200",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenThrow(const ServerException(Failure.noInternetConnection));
        //act
        final result = sut.getOffers;
        //assert
        expect(result(tParams.param),
            throwsA(const TypeMatcher<ServerException>()));
      },
    );

    test(
      "Should return a list of Offers if call is success 200 and offers is not empty",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenAnswer((_) async => Response(fixture('get_offers.json'), 200));
        //act
        final result = await sut.getOffers(tParams.param);
        //assert
        expect(result, tOffers);
      },
    );

    test(
      "Should return a empty list of Offers if call is success 200 and offers is empty",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params'))).thenAnswer(
            (_) async => Response(fixture('get_offers_empty.json'), 200));
        //act
        final result = await sut.getOffers(tParams.param);
        //assert
        expect(result, tOffersEmpty);
      },
    );
  });
}
