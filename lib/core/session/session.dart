import 'package:parasut_rover_flutter/entities/dto/user_model.dart';
import 'package:parasut_rover_flutter/entities/model/photos_filter.dart';
import 'package:parasut_rover_flutter/entities/model/rover.dart';

class Session {
  static Session? instance;

  factory Session() {
    if (instance == null) instance = Session._init();
    return instance!;
  }
  
  Session._init();
  
  UserModel? user;
  Rover? selectedRover;
  PhotosFilter filter= PhotosFilter();
}