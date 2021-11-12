import 'package:parasut_rover_flutter/core/base/base_service.dart';
import 'package:parasut_rover_flutter/core/constants/storage_constants.dart';

class ThemeService extends BaseService {
  bool getThemeFromStorage() {
    var selected = storage.getData(StorageConstants.SELECTED_THEME);

    return selected ?? false;
  }
}
