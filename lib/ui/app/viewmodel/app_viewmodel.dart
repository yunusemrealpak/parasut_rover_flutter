import '../../../core/base/base_viewmodel.dart';
import '../../../core/enum/rover_camera.dart';
import '../../../entities/model/rover.dart';

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
