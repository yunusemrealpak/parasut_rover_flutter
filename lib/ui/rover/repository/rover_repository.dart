import 'package:parasut_rover_flutter/core/enum/http_types.dart';
import 'package:parasut_rover_flutter/core/network/network_paths.dart';
import 'package:parasut_rover_flutter/core/network/result_model.dart';
import 'package:parasut_rover_flutter/entities/model/photos_filter.dart';
import 'package:parasut_rover_flutter/ui/rover/repository/i_rover_repository.dart';

class RoverRepository extends IRoverRepository {
  @override
  Future<ResultModel?> getPhotos(PhotosFilter filter) async {
    return await coreDio!.fetchNetwork(
      NetworkPaths.getPhotos(filter.roverName!),
      type: HttpTypes.GET,
      queryParameters: filter.toMap(),
    );
  }
}
