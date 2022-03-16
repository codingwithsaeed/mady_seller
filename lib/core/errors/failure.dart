import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  static const notFound = 'کاربری با این مشخصات یافت نشد';
  static const noInternetConnection = 'دستگاه به اینترنت متصل نیست';
}

class ServerFailure implements Failure {
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
