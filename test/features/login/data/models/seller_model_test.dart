import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/features/login/data/models/seller_model.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('testing [SellerModel] fromJson', () {
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

    test(
      "Should return a solid SellerModel obj",
      () async {
        final json = fixture('seller_login.json');
        final result = SellerModel.fromJson(jsonDecode(json));
        //assert
        expect(result, tSellerModel1);
      },
    );

    test(
      "Should return a solid SellerModel obj with no Seller ",
      () async {
        final json = fixture('seller_failed_login.json');
        final result = SellerModel.fromJson(jsonDecode(json));
        //assert
        expect(result, tSellerModel2);
      },
    );
  });
}
