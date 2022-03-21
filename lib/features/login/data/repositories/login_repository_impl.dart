// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/features/login/data/datasources/login_local_datasource.dart';
import 'package:mady_seller/features/login/data/datasources/login_remote_datasource.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mady_seller/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource _remote;
  final LoginLocalDatasource _local;
  final NetworkInfo _networkInfo;

  LoginRepositoryImpl(this._remote, this._local, this._networkInfo);

  @override
  Future<Either<Failure, Seller>> doLogin(Params params) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(GeneralFailure(Failure.noInternetConnection));
      }

      final result = await _remote.doLogin(params.param);

      if (result.success == 1) return Right(result.data!);

      return const Left(GeneralFailure(Failure.notFound));
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }

  @override
  Future<void> saveSellerId(String sellerId) async {
    await _local.saveSellerId(sellerId);
  }
}
