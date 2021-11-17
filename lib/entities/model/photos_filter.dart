import 'package:parasut_rover_flutter/ui/widgets/filter/filter_viewmodel.dart';

import '../../core/enum/rover_camera.dart';
import '../../core/utils/config.dart';

class PhotosFilter {
  int? currentPage;
  DateType? dateType;
  String? roverName;
  String? earthDate;
  int? sol;
  RoverCamera? camera;

  PhotosFilter({this.currentPage = 1, this.dateType, this.roverName, this.earthDate, this.sol, this.camera});

  bool get isDefaultProperties {
    return earthDate == null && sol == null && camera == null;
  }

  toMap() {
    var map = <String, dynamic>{};
    map["page"] = currentPage;

    if (camera != null) map["camera"] = camera.toString().toLowerCase().replaceAll('rovercamera.', "");
    if (earthDate != null) map["earth_date"] = earthDate;
    if (sol != null) map["sol"] = sol;
    map["api_key"] = Config.apiKey;

    return map;
  }
}
