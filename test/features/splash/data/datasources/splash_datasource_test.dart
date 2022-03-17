import 'package:flutter_test/flutter_test.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/features/splash/data/datasources/splash_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late SplashDatasourceImpl sut;
  late MockSharedPreferences sharedPreferences;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    sut = SplashDatasourceImpl(sharedPreferences);
  });

  group('testng is logged in', () {
    test(
      "Should throw CacheExpcetion if key is null",
      () {
        //arrange
        when(sharedPreferences.getBool(any)).thenReturn(null);
        //act
        final result = sut.isLoggedIn;
        //assert
        expect(result, throwsA(const TypeMatcher<CacheException>()));
      },
    );
    test(
      "Should return the corresponding result",
      () {
        //arrange
        when(sharedPreferences.getBool(any)).thenReturn(true);
        //act
        final result = sut.isLoggedIn();
        //assert
        expect(result, true);
        verify(sharedPreferences.getBool('LOGIN'));
        verifyNoMoreInteractions(sharedPreferences);
      },
    );
  });
}
