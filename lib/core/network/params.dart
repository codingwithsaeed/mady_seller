import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final Map<String, dynamic> param;

  const Params(this.param);

  @override
  List<Object?> get props => [param];
}
