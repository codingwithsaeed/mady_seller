import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/nework/api_provider.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/login/data/datasources/login_datasource.dart';
import 'package:mady_seller/features/login/data/models/seller_model.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'login_datasource_impl_test.mocks.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([ApiProvider])
void main() {
  late LoginDatasourceImpl sut;
  late MockApiProvider apiProvider;

  setUp(() {
    apiProvider = MockApiProvider();
    sut = LoginDatasourceImpl(apiProvider);
  });

  group('doLogin Test', () {
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

    const tSellerModel2 = SellerModel(success: -1);
    final tJson1 = fixture('seller_login.json');
    final tJson2 = fixture('seller_failed_login.json');
    test(
      "Should perform a post request to server",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenAnswer((_) async => http.Response(tJson1, 200));
        //act
        await sut.doLogin(tParams.param);
        //assert
        verify(apiProvider.post(currentDataUrl, params: tParams.param));
      },
    );

    test(
      "Should return [SellerModel] if request is successfull 200",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenAnswer((_) async => http.Response(tJson1, 200));
        //act
        final result = await sut.doLogin(tParams.param);
        //assert
        expect(result, tSellerModel1);
        verify(apiProvider.post(currentDataUrl, params: tParams.param));
        verifyNoMoreInteractions(apiProvider);
      },
    );

    test(
      "Should return [SellerModel] if request is successfull 200 and data is empty",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenAnswer((_) async => http.Response(tJson2, 200));
        //act
        final result = await sut.doLogin(tParams.param);
        //assert
        expect(result, tSellerModel2);
      },
    );

    test(
      "Should throw a [ServerException] when request is not successfull",
      () async {
        //arrange
        when(apiProvider.post(any, params: anyNamed('params')))
            .thenAnswer((_) async => http.Response('', 404));
        //act
        final result = sut.doLogin;
        //assert
        expect(
            result(tParams.param),
            throwsA(
              const TypeMatcher<ServerException>(),
            ));
      },
    );
  });
}
