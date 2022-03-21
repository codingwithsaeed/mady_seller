import 'package:equatable/equatable.dart';

abstract class Failure  {
  static const notFound = 'کاربری با این مشخصات یافت نشد';
  static const noInternetConnection = 'دستگاه به اینترنت متصل نیست';
}

class GeneralFailure extends Equatable implements Failure {
  final String message;

  const GeneralFailure(this.message);

  @override
  List<Object?> get props => [message];

  
}
