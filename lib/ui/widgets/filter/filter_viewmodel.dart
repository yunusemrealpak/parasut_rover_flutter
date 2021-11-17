import 'package:parasut_rover_flutter/core/base/base_viewmodel.dart';
import 'package:parasut_rover_flutter/core/enum/rover_camera.dart';
import 'package:parasut_rover_flutter/core/extensions/date_extensions.dart';
import 'package:parasut_rover_flutter/entities/model/photos_filter.dart';

enum DateType {
  Earth,
  Mars,
}

class FilterViewModel extends BaseViewModel {
  PhotosFilter filter = PhotosFilter(dateType: DateType.Earth);
  
  init() {
    var sessionFilter = session.filter;
    if(!sessionFilter.isDefaultProperties) filter = sessionFilter;
    saveChanges();
  }
  
  changeDateType(DateType val) {
    clearDates();
    filter.dateType = val;
    saveChanges();
  }
  
  void goBack() {
    nvgSrv!.goBack();
  }

  changeEarthDate(DateTime time) {
    filter.earthDate = time.earthDate;
    saveChanges();
  }
  
  void changeSol(String value) {
    filter.sol = int.parse(value);
    saveChanges();
  }
  
  changeSelectedCamera(RoverCamera val) {
    filter.camera = val;
    saveChanges();
  }
  
  clearDates() {
    filter.sol = null;
    filter.earthDate = null;
  }

  void applyFilters() {
    session.filter = filter;
    nvgSrv!.goBack(arguments: true);
  }


  void clearAll() {
    filter.dateType = DateType.Earth;
    filter.camera = null;
    filter.sol = null;
    filter.earthDate = null;
    saveChanges();
  }
}