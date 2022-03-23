import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/offer/data/datasources/get_offers_remote_datasource.dart';
import 'package:mady_seller/features/offer/data/models/get_offers_model.dart';
import 'package:mady_seller/features/offer/data/repositories/get_offers_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'get_offers_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo, GetOffersRemoteDatasource])
void main() {
  late GetOffersRepositoryImpl sut;
  late MockNetworkInfo networkInfo;
  late MockGetOffersRemoteDatasource datasource;

  setUp(() {
    networkInfo = MockNetworkInfo();
    datasource = MockGetOffersRemoteDatasource();
    sut = GetOffersRepositoryImpl(datasource, networkInfo);
  });

  group('GetOffers Test', () {
    const tParams = Params({'action': 'get_offers', 'sid': '9'});
    final tJson = fixture('get_offers.json');
    final tOffersModel2 = GetOffersModel.fromJson(jsonDecode(tJson));
    test(
      "Should return a General failure if device is not connected to internet",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);
        when(datasource.getOffers(any)).thenAnswer((_) async => tOffersModel2.offers);
        //act
        final result = await sut.getOffers(tParams);
        //assert
        expect(
            result, const Left(GeneralFailure(Failure.noInternetConnection)));
        verify(networkInfo.isConnected);
        verifyNoMoreInteractions(networkInfo);
      },
    );

    test(
      "Should return List of Offers if call to datasource is succeed",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(datasource.getOffers(any)).thenAnswer((_) async => tOffersModel2.offers);
        //act
        final result = await sut.getOffers(tParams);
        //assert
        expect(
          result,
          Right(tOffersModel2.offers),
        );
        verify(datasource.getOffers(tParams.param));
        verifyNoMoreInteractions(datasource);
      },
    );
  });
}