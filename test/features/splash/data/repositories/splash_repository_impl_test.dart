import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/features/splash/data/datasources/splash_datasource.dart';
import 'package:mady_seller/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo, SplashDatasource])
void main() {
  late SplashRepositoryImpl sut;
  late MockSplashDatasource datasource;
  late MockNetworkInfo networkInfo;

  setUp(() {
    networkInfo = MockNetworkInfo();
    datasource = MockSplashDatasource();
    sut = SplashRepositoryImpl(datasource, networkInfo);
  });

  group('testing check login', () {
    test(
      "Sholud return ServerFailure if device not connected to internet",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);
        when(datasource.isLoggedIn()).thenAnswer((_) => false);
        //act
        final result = await sut.checkLoggin();
        //assert
        expect(
            result, const Left(GeneralFailure(Failure.noInternetConnection)));
      },
    );

    test(
      "Sholud return true datasource return it",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(datasource.isLoggedIn()).thenAnswer((_) => true);
        //act
        final result = await sut.checkLoggin();
        //assert
        expect(result, const Right(true));
      },
    );

    test(
      "Sholud return false on CacheException",
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(datasource.isLoggedIn())
            .thenThrow(const CacheException(Failure.notFound));
        //act
        final result = await sut.checkLoggin();
        //assert
        expect(result, const Right(false));
      },
    );
  });
}
