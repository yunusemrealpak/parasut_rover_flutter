import '../../../core/base/base_viewmodel.dart';
import '../../../core/constants/navigation_constants.dart';
import '../../../core/enum/types.dart';
import '../../../entities/dto/photo.dart';
import '../../../entities/model/photos_filter.dart';
import '../../../entities/model/rover.dart';
import '../service/rover_service.dart';

class RoverViewModel extends BaseViewModel {
  static const int ItemRequestThreshold = 25;
  
  RoverService service = RoverService();
  
  late Rover rover;
  List<Photo> photos = [];
  
  // Pagination
  int _currentPage = 1;
  
  init(rover) async {
    this.rover = rover;
    session.selectedRover = this.rover;
    setState(ViewState.Busy);
    await getGalleries();
    setState(ViewState.Idle);
  }
  
  getGalleries() async {
    photos = await service.getPhotos(PhotosFilter(currentPage: _currentPage, roverName: rover.name));
  }
  
  getGalleriesWithFilters() async {
    session.filter.roverName = this.rover.name;
    session.filter.currentPage = 1;
    photos = await service.getPhotos(session.filter);
  }
  
  morePhotos() async {
    session.filter.roverName = this.rover.name;
    session.filter.currentPage = _currentPage;
    setMoreState(ViewState.Busy);
    var newPhotos = await service.getPhotos(session.filter);
    photos.addAll(newPhotos);
    setMoreState(ViewState.Idle);
  }
  
  goToFilter() {
    nvgSrv!.navigateTo(Routes.FILTER).then((value) async {
      if(value != null && value) {
        refresh();
      }
    });
  }
  
  refresh() async {
    _currentPage = 1;
    setState(ViewState.Busy);
    await getGalleriesWithFilters();
    setState(ViewState.Idle);
  }

  goToImageViewer(Photo photo) {
    nvgSrv!.navigateTo(Routes.IMAGE_VIEWER, arguments: photo);
  }

  handleItemCreated(int index) async {
    var itemPosition = index + 1;
    var requestMoreData =
        itemPosition % ItemRequestThreshold == 0 && itemPosition != 0;
    var pageToRequest = (itemPosition ~/ ItemRequestThreshold)+1;
    
    print("itemPosition : $itemPosition");
    print("requestMoreData : $requestMoreData");
    print("pageToRequest : $pageToRequest");

    if (requestMoreData && pageToRequest > _currentPage) {
      _currentPage = pageToRequest;
      await morePhotos();
    }
  }
}