import 'package:equatable/equatable.dart';

class TokenModel extends Equatable {
  final String token;
  final int id;

  const TokenModel({
    required this.token,
    required this.id,
  });

  @override
  List<Object?> get props => [token, id];
}