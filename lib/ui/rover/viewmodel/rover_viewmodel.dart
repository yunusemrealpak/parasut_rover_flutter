import 'package:parasut_rover_flutter/core/base/base_viewmodel.dart';
import 'package:parasut_rover_flutter/core/enum/types.dart';
import 'package:parasut_rover_flutter/entities/model/rover.dart';

class RoverViewModel extends BaseViewModel {
  late Rover rover;
  
  init(rover) async {
    this.rover = rover;
    setState(ViewState.Busy);
    await getGalleries();
    setState(ViewState.Idle);
  }
  
  getGalleries() async {}
}