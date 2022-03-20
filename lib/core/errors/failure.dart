import 'package:equatable/equatable.dart';

abstract class Failure  {
  static const notFound = 'کاربری با این مشخصات یافت نشد';
  static const noInternetConnection = 'دستگاه به اینترنت متصل نیست';
}

class ServerFailure extends Equatable implements Failure {
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [message];

  
}
