import '../../../core/enum/http_types.dart';
import '../../../core/network/network_paths.dart';
import '../../../core/network/result_model.dart';
import '../../../entities/model/photos_filter.dart';
import 'i_rover_repository.dart';

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
