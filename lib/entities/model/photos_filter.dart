import 'package:parasut_rover_flutter/core/enum/rover_camera.dart';
import 'package:parasut_rover_flutter/core/utils/config.dart';

class PhotosFilter {
  int? currentPage;
  String? roverName;
  String? earthDate;
  int? sol;
  RoverCamera? camera;
  
  PhotosFilter({this.currentPage, this.roverName, this.earthDate, this.sol, this.camera});
  
  toMap() {
    var map = <String, dynamic>{};
    map["page"] = currentPage;
    map["camera"] = camera?.toString().toLowerCase();
    map["earth_date"] = earthDate;
    map["api_key"] = Config.apiKey;
    map["sol"] = sol;
    
    return map;
  }
}