// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/features/login/data/datasources/login_datasource.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mady_seller/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;
  final NetworkInfo _networkInfo;

  LoginRepositoryImpl(this._datasource, this._networkInfo);

  @override
  Future<Either<Failure, Seller>> doLogin(Params params) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(ServerFailure(Failure.noInternetConnection));
      }

      final result = await _datasource.doLogin(params.param);

      if (result.success == 1) return Right(result.data!);

      return const Left(ServerFailure(Failure.notFound));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
