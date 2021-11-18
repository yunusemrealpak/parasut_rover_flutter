import 'package:parasut_rover_flutter/core/base/base_viewmodel.dart';
import 'package:parasut_rover_flutter/core/constants/navigation_constants.dart';
import 'package:parasut_rover_flutter/core/enum/notification_type.dart';
import 'package:parasut_rover_flutter/core/enum/types.dart';
import 'package:parasut_rover_flutter/ui/login/service/login_service.dart';

class LoginViewModel extends BaseViewModel {
  LoginService service = LoginService();

  loginWithFacebook() async {
    setState(ViewState.Busy);
    var failure = await service.loginWithFacebook();
    if (failure == null)
      nvgSrv!.navigateToReplacement(Routes.APP);
    else
      showNotification(NotificationType.ERROR, failure.errorMessage ?? "");

    setState(ViewState.Idle);
  }

  void loginWithGuest() {
    nvgSrv!.navigateToReplacement(Routes.APP);
  }
}
