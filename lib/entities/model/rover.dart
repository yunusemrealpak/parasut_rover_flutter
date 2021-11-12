import 'package:parasut_rover_flutter/core/enum/rover_camera.dart';

class Rover {
  String name;
  List<RoverCamera> cameras;
  
  Rover({required this.cameras, required this.name});
}