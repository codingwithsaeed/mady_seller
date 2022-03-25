import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/offer/data/datasources/add_offer_remote_datasource.dart';
import 'package:mady_seller/features/offer/data/models/add_offer/add_offer_model.dart';
import 'package:mady_seller/features/offer/data/repositories/add_offer_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'add_offer_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo, AddOfferRemoteDataSource])
void main() {
  late AddOfferRepositoryImpl sut;
  late MockNetworkInfo networkInfo;
  late MockAddOfferRemoteDataSource datasource;

  setUp(() {
    networkInfo = MockNetworkInfo();
    datasource = MockAddOfferRemoteDataSource();
    sut = AddOfferRepositoryImpl(datasource, networkInfo);
  });

  group('AddOffer Test', () {
    const tParams = Params({'action': 'get_offers', 'sid': '9'});
    final tJson = fixture('add_offer.json');
    final tJsonError = fixture('add_offer_error.json');
    final tJsonZero = fixture('add_offer_zero.json');
    final tAddOffersModel1 = AddOfferModel.fromJson(jsonDecode(tJson));
    final tAddOffersModel2 = AddOfferModel.fromJson(jsonDecode(tJsonError));
    final tAddOffersModel3 = AddOfferModel.fromJson(jsonDecode(tJsonZero));
    test(
      "Should return a General failure if device is not connected to internet",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);
        when(datasource.addOffer(any))
            .thenAnswer((_) async => tAddOffersModel1);
        //act
        final result = await sut.addOffer(tParams);
        //assert
        expect(
            result, const Left(GeneralFailure(Failure.noInternetConnection)));
        verify(networkInfo.isConnected);
        verifyNoMoreInteractions(networkInfo);
      },
    );

    test(
      "Should return failure if model.success is -2",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(datasource.addOffer(any))
            .thenAnswer((_) async => tAddOffersModel2);
        //act
        final result = await sut.addOffer(tParams);
        //assert
        expect(
          result,
          const Left(GeneralFailure(
              'تاریخ ثبت بسته نمیتواند از تاریخ فعلی کمتر باشد')),
        );
      },
    );

    test(
      "Should return failure if model.success is 0",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(datasource.addOffer(any))
            .thenAnswer((_) async => tAddOffersModel3);
        //act
        final result = await sut.addOffer(tParams);
        //assert
        expect(
          result,
          const Left(GeneralFailure('مشکل در عملیات ثبت')),
        );
      },
    );

    test(
      "Should return true if model.success is 1",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(datasource.addOffer(any))
            .thenAnswer((_) async => tAddOffersModel1);
        //act
        final result = await sut.addOffer(tParams);
        //assert
        expect(
          result,
          const Right(true),
        );
      },
    );

    test(
      "Should return failure on [ServerException]",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(datasource.addOffer(any))
            .thenThrow(const ServerException(Failure.notFound));
        //act
        final result = await sut.addOffer(tParams);
        //assert
        expect(
          result,
          const Left(GeneralFailure(Failure.notFound)),
        );
      },
    );
  });
}
