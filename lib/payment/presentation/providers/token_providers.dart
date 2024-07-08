import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/midtrans_token_services.dart';

final tokenServiceProvider = Provider<TokenService>((ref) {
  return TokenService();
});
