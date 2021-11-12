import 'package:parasut_rover_flutter/core/base/base_repository.dart';
import 'package:parasut_rover_flutter/core/network/result_model.dart';
import 'package:parasut_rover_flutter/entities/model/photos_filter.dart';

abstract class IRoverRepository extends BaseRepository {
  Future<ResultModel?> getPhotos(PhotosFilter filter);
}