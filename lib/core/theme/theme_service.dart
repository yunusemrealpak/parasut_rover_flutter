import '../base/base_service.dart';
import '../constants/storage_constants.dart';

class ThemeService extends BaseService {
  bool getThemeFromStorage() {
    var selected = storage.getData(StorageConstants.SELECTED_THEME);

    return selected ?? false;
  }
}
