import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/domain/repositories/get_offers_repository.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_offers_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_offers_usecase_test.mocks.dart';

@GenerateMocks([GetOffersRepository])
void main() {
  late GetOffersUsecase sut;
  late MockGetOffersRepository repository;

  setUp(() {
    repository = MockGetOffersRepository();
    sut = GetOffersUsecase(repository);
  });

  group('testing getSellerId', () {
    const tParams = Params({'action': 'get_offers', 'sid': '9'});

    const tOffers = <Offer>[
      Offer(
        oid: "5",
        content:
            "\u0628\u0633\u062a\u0647 \u062f\u0647 \u062a\u0627\u06cc\u06cc \u06af\u0648\u0634\u062a \u0628\u0648\u0642\u0644\u0645\u0648\u0646",
        date: "1400-12-23",
        sTime: "14:00",
        eTime: "23:59",
        price: "30000",
        percent: "50",
        currentPrice: "15000",
        picture: "http://192.168.1.2/mady/uploads/offerpics/meat.jpeg",
        count: "20",
        status: "2",
        isSpecial: "0",
      ),
    ];
    test(
      "Should return failure if repository return it",
      () async {
        //arrange
        when(repository.getOffers(any)).thenAnswer(
            (_) async => const Left(GeneralFailure(Failure.notFound)));
        //act
        final result = await sut(tParams);
        //assert
        expect(result, const Left(GeneralFailure(Failure.notFound)));
      },
    );

    test(
      "Should return a List of offers if repository return it",
      () async {
        //arrange
        when(repository.getOffers(any)).thenAnswer((_) async => const Right(tOffers));
        //act
        final result = await sut(tParams);
        //assert
        expect(result, const Right(tOffers));
      },
    );
  });
}
