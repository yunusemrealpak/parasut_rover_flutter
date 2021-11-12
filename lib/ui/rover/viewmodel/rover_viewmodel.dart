import 'package:parasut_rover_flutter/core/base/base_viewmodel.dart';
import 'package:parasut_rover_flutter/core/constants/navigation_constants.dart';
import 'package:parasut_rover_flutter/core/enum/rover_camera.dart';
import 'package:parasut_rover_flutter/core/enum/types.dart';
import 'package:parasut_rover_flutter/entities/dto/photo.dart';
import 'package:parasut_rover_flutter/entities/model/photos_filter.dart';
import 'package:parasut_rover_flutter/entities/model/rover.dart';
import 'package:parasut_rover_flutter/ui/rover/service/rover_service.dart';

class RoverViewModel extends BaseViewModel {
  RoverService service = RoverService();
  
  late Rover rover;
  List<Photo> photos = [];
  
  // Pagination
  int currentPage = 1;
  
  // Filter Datas
  String? earthDate;
  int? sol;
  RoverCamera? roverCamera;
  
  init(rover) async {
    this.rover = rover;
    setState(ViewState.Busy);
    await getGalleries();
    setState(ViewState.Idle);
  }
  
  getGalleries() async {
    photos = await service.getPhotos(PhotosFilter(currentPage: currentPage, roverName: rover.name));
  }
  
  morePhotos() async {
    currentPage++;
    setMoreState(ViewState.Busy);
    photos = await service.getPhotos(PhotosFilter(currentPage: currentPage, roverName: rover.name, sol: sol, camera: roverCamera, earthDate: earthDate));
    setMoreState(ViewState.Idle);
  }

  goToImageViewer(String? imgSrc) {
    nvgSrv!.navigateTo(Routes.IMAGE_VIEWER, arguments: imgSrc!);
  }
}