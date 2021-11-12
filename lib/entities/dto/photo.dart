import 'camera.dart';

class Photo {
  int? id;
  int? sol;
  Camera? camera;
  String? imgSrc;
  String? earthDate;

  Photo({
    this.id,
    this.sol,
    this.camera,
    this.imgSrc,
    this.earthDate,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera = json['camera'] != null ? new Camera.fromJson(json['camera']) : null;
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
  }
}
