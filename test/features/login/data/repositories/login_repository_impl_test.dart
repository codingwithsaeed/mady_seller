import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/login/data/datasources/login_local_datasource.dart';
import 'package:mady_seller/features/login/data/datasources/login_remote_datasource.dart';
import 'package:mady_seller/features/login/data/models/seller_model.dart';
import 'package:mady_seller/features/login/data/repositories/login_repository_impl.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo, LoginRemoteDatasource, LoginLocalDatasource])
void main() {
  late LoginRepositoryImpl sut;
  late MockNetworkInfo networkInfo;
  late MockLoginRemoteDatasource remote;
  late MockLoginLocalDatasource local;

  setUp(() {
    networkInfo = MockNetworkInfo();
    remote = MockLoginRemoteDatasource();
    local = MockLoginLocalDatasource();
    sut = LoginRepositoryImpl(remote, local, networkInfo);
  });

  group('Testing doLogin', () {
    const tParams = Params(
        {'action': 'signin', 'phone': '09136581814', 'password': 'saeed'});
    const tSellerModel1 = SellerModel(
      success: 1,
      data: Seller(
          sid: "9",
          storeName:
              "\u0631\u0633\u062a\u0648\u0631\u0627\u0646 \u0633\u0639\u06cc\u062f",
          phone: "09136581814",
          category:
              "\u0631\u0633\u062a\u0648\u0631\u0627\u0646 \u0648 \u0641\u0633\u062a\u200c\u0641\u0648\u062f",
          address:
              "\u0627\u0635\u0641\u0647\u0627\u0646\u060c \u0645\u062c\u0645\u0648\u0639\u0647 \u06f1\u06f9\u06f3",
          website: "https://codingwithsaeed.ir",
          logo: "http://192.168.1.2/mady/uploads/logo/SVrQM7.jpeg",
          lat: "51.68252896517515",
          lng: "51.68252896517515",
          pocket: "4",
          offerCount: "117",
          expire: "1401-06-18",
          hasSpecial: "0",
          specialCount: "0"),
    );

    //const tSellerModel2 = SellerModel(success: -1);
    final tJson1 = fixture('seller_login.json');
    final tJson2 = fixture('seller_failed_login.json');
    test(
      "Should return [ServerFailure] if device is not connected to server",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);
        when(remote.doLogin(any))
            .thenAnswer((_) async => SellerModel.fromJson(jsonDecode(tJson1)));
        //act
        final result = await sut.doLogin(tParams);
        //assert
        expect(result, const Left(GeneralFailure(Failure.noInternetConnection)));
        verify(networkInfo.isConnected);
        verifyNoMoreInteractions(networkInfo);
      },
    );

    test(
      "Should return [SellerModel] if device is online and repository return it",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remote.doLogin(any))
            .thenAnswer((_) async => SellerModel.fromJson(jsonDecode(tJson1)));
        //act
        final result = await sut.doLogin(tParams);
        //assert
        expect(result, Right(tSellerModel1.data!));
        verify(remote.doLogin(tParams.param));
        verifyNoMoreInteractions(remote);
      },
    );

    test(
      "Should return failure if login isn't succeed",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remote.doLogin(any))
            .thenAnswer((_) async => SellerModel.fromJson(jsonDecode(tJson2)));
        //act
        final result = await sut.doLogin(tParams);
        //assert
        expect(result, const Left(GeneralFailure(Failure.notFound)));
      },
    );

    test(
      "Should return failure on [ServerException]",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remote.doLogin(any))
            .thenThrow(const ServerException(Failure.notFound));
        //act
        final result = await sut.doLogin(tParams);
        //assert
        expect(result, const Left(GeneralFailure(Failure.notFound)));
      },
    );
  });
}
