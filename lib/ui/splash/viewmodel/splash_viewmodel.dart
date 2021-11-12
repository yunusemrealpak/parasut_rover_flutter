import 'dart:async';

import 'package:parasut_rover_flutter/core/base/base_viewmodel.dart';
import 'package:parasut_rover_flutter/core/constants/navigation_constants.dart';

class SplashViewModel extends BaseViewModel {
  Timer? timer;
  
  init() {
    timer = Timer.periodic(Duration(seconds: 1), (e) {
      if(e.tick >= 4) {
        timer?.cancel();
        goToLogin();
      }
    });
  }
  
  goToLogin() {
    nvgSrv!.navigateToReplacement(Routes.LOGIN);
  }
  
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}