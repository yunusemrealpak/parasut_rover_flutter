import '../../../core/base/base_repository.dart';
import '../../../core/network/result_model.dart';
import '../../../entities/model/photos_filter.dart';

abstract class IRoverRepository extends BaseRepository {
  Future<ResultModel?> getPhotos(PhotosFilter filter);
}