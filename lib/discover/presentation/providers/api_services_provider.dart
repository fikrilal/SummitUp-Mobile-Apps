import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/mountain_details_api_service.dart';

final mountainsApiServiceProvider = Provider<MountainsApiService>((ref) {
  return MountainsApiService(); // Assuming your MountainsApiService takes no parameters, adjust as needed
});