import 'package:parasut_rover_flutter/core/extensions/date_extensions.dart';

import '../../../core/base/base_service.dart';
import '../../../entities/dto/photo.dart';
import '../../../entities/model/photos_filter.dart';
import '../repository/i_rover_repository.dart';
import '../repository/rover_repository.dart';

class RoverService extends BaseService {
  late IRoverRepository repo;
  
  RoverService() {
    repo = RoverRepository();
  }
  
  Future<List<Photo>> getPhotos(PhotosFilter photosFilter) async {
    if(photosFilter.sol == null && photosFilter.earthDate == null) {
      var now = DateTime.parse("2015-12-03");
      photosFilter.earthDate = now.earthDate;
    }
    
    var response = await repo.getPhotos(photosFilter);
    
    switch (response!.resultCode) {
      case 1:
        List<Photo> photos = [];
        
        if(response.resultData["photos"] != null) {
          (response.resultData["photos"] as List).forEach((element) {
            photos.add(Photo.fromJson(element));
          });
        }
        
        return photos;
      default:
        return [];
    }
  }
}