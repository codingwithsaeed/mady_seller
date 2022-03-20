import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/login/domain/repositories/login_repository.dart';
import 'package:mady_seller/features/login/domain/usecases/login_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late LoginUsecase sut;
  late MockLoginRepository repository;

  setUp(() {
    repository = MockLoginRepository();
    sut = LoginUsecase(repository);
  });

  group('do login test', () {
    const tParams = Params(
        {'action': 'signin', 'phone': '09136581814', 'password': 'saeed'});

    const tSeller = Seller(
        sid: 'sid',
        storeName: 'storeName',
        phone: 'phone',
        category: 'category',
        address: 'address',
        website: 'website',
        logo: 'logo',
        lat: 'lat',
        lng: 'lng',
        pocket: 'pocket',
        offerCount: 'offerCount',
        expire: 'expire',
        hasSpecial: 'hasSpecial',
        specialCount: 'specialCount');

    test(
      "should return failure if repository return it",
      () async {
        //arrange
        when(repository.doLogin(any)).thenAnswer((_) async =>
            const Left(ServerFailure(Failure.noInternetConnection)));
        //act
        final result = await sut.doLogin(tParams);
        //assert
        expect(result, const Left(ServerFailure(Failure.noInternetConnection)));
        verify(repository.doLogin(tParams));
        verifyNoMoreInteractions(repository);
      },
    );

    test(
      "should return solid seller object if repository return it",
      () async {
        //arrange
        when(repository.doLogin(any)).thenAnswer((_) async => const Right(tSeller));
        //act
        final result = await sut.doLogin(tParams);
        //assert
        expect(result, const Right(tSeller));
      },
    );
  });
}
