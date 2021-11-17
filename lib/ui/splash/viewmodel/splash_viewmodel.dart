import 'dart:async';

import 'package:parasut_rover_flutter/ui/login/service/login_service.dart';

import '../../../core/base/base_viewmodel.dart';
import '../../../core/constants/navigation_constants.dart';

class SplashViewModel extends BaseViewModel {
  LoginService loginService = LoginService();
  
  Timer? timer;
  bool userLoggedIn = false;
  
  init() async {
    //await checkAutoLogin();
    timer = Timer.periodic(Duration(seconds: 1), (e) {
      if(e.tick >= 4) {
        timer?.cancel();
        userLoggedIn ? goToMain() : goToLogin();
      }
    });
  }
  
  // Future checkAutoLogin() async {
  //   userLoggedIn = await loginService.autoLogin();
  // }
  
  goToMain() {
    nvgSrv!.navigateToReplacement(Routes.APP);
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