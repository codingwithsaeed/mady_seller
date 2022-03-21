import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/offer/data/datasources/get_seller_local_datasource.dart';
import 'package:mady_seller/features/offer/data/repositories/get_seller_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_seller_repository_impl_test.mocks.dart';

@GenerateMocks([GetSellerLocalDatasource])
void main() {
  late GetSellerRepositoryImpl sut;
  late MockGetSellerLocalDatasource datasource;

  setUp(() {
    datasource = MockGetSellerLocalDatasource();
    sut = GetSellerRepositoryImpl(datasource);
  });

  group('GetSellerId Test', () {
    test(
      "Should return [GeneralFailure] if returned value is null",
      () async {
        //arrange
        when(datasource.getSellerId()).thenReturn(null);
        //act
        final result = sut.getSellerId();
        //assert
        expect(result, const Left(GeneralFailure(Failure.notFound)));
      },
    );
    test(
      "Should return String value if there is no problem",
      () async {
        //arrange
        when(datasource.getSellerId()).thenReturn('9');
        //act
        final result = sut.getSellerId();
        //assert
        expect(result, const Right('9'));
      },
    );

    test(
      "Should return Failure on any exception from repository",
      () async {
        //arrange
        when(datasource.getSellerId()).thenThrow(const CacheException(Failure.notFound));
        //act
        final result = sut.getSellerId();
        //assert
        expect(result, const Left(GeneralFailure(Failure.notFound)));
      },
    );
  });
}
