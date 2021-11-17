import 'package:parasut_rover_flutter/core/session/session.dart';

import '../storage/storage_service.dart';

abstract class BaseService {
  StorageService storage = StorageService();
  Session session = Session();
}
