import 'package:parasut_rover_flutter/core/base/base_viewmodel.dart';
import 'package:parasut_rover_flutter/core/enum/rover_camera.dart';
import 'package:parasut_rover_flutter/entities/model/rover.dart';

class AppViewModel extends BaseViewModel {
  List<Rover> rovers = [
    Rover(
      cameras: [
        RoverCamera.FHAZ,
        RoverCamera.RHAZ,
        RoverCamera.MAST,
        RoverCamera.CHEMCAM,
        RoverCamera.MAHLI,
        RoverCamera.MARDI,
        RoverCamera.NAVCAM,
      ],
      name: "Curiosity",
    ),
    Rover(
      cameras: [
        RoverCamera.FHAZ,
        RoverCamera.RHAZ,
        RoverCamera.NAVCAM,
        RoverCamera.PANCAM,
        RoverCamera.MINITES,
      ],
      name: "Opportunity",
    ),
    Rover(
      cameras: [
        RoverCamera.FHAZ,
        RoverCamera.RHAZ,
        RoverCamera.NAVCAM,
        RoverCamera.PANCAM,
        RoverCamera.MINITES,
      ],
      name: "Spirit",
    ),
  ];
}
