import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/api_provider.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/offer/data/datasources/add_offer_remote_datasource.dart';
import 'package:mady_seller/features/offer/data/models/add_offer/add_offer_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'get_offers_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiProvider])
void main() {
  late AddOfferRemoteDataSourceImpl sut;
  late MockApiProvider apiProvider;

  setUp(() {
    apiProvider = MockApiProvider();
    sut = AddOfferRemoteDataSourceImpl(apiProvider);
  });

  group('getOffers test', () {
     const tParams = Params({'action': 'add_offer'});
    final tJson = fixture('add_offer.json');
    final tJsonError = fixture('add_offer_error.json');
    final tAddOffersModel1 = AddOfferModel.fromJson(jsonDecode(tJson));
    final tAddOffersModel2 = AddOfferModel.fromJson(jsonDecode(tJsonError));

    test(
      "Should perform a post request to [currentDataUrl] with proper params",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenAnswer((_) async => Response(tJson, 200));
        //act
        await sut.addOffer(tParams.param);
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
        final result = sut.addOffer;
        //assert
        expect(result(tParams.param),
            throwsA(const TypeMatcher<ServerException>()));
      },
    );

    test(
      "Should return a AddOfferModel if call is success 200 and model success is 1",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenAnswer((_) async => Response(tJson, 200));
        //act
        final result = await sut.addOffer(tParams.param);
        //assert
        expect(result, tAddOffersModel1);
      },
    );

    test(
      "Should return a AddOfferModel if call is success 200 and model success is -2",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params'))).thenAnswer(
            (_) async => Response(tJsonError, 200));
        //act
        final result = await sut.addOffer(tParams.param);
        //assert
        expect(result, tAddOffersModel2);
      },
    );
  });
}
