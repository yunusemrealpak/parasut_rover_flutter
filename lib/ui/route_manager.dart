import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parasut_rover_flutter/core/constants/navigation_constants.dart';
import 'package:parasut_rover_flutter/ui/login/view/login_view.dart';
import 'package:parasut_rover_flutter/ui/splash/view/splash_view.dart';
import 'package:parasut_rover_flutter/ui/widgets/image_viewer.dart';

import 'app/view/app_view.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.SPLASH),
          builder: (_) => SplashView(),
        );
    case Routes.LOGIN:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.LOGIN),
          builder: (_) => LoginView(),
        );
      case Routes.APP:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.APP),
          builder: (_) => AppView(),
        );
      case Routes.IMAGE_VIEWER:
        var url = settings.arguments as String;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.IMAGE_VIEWER),
          builder: (_) => ImageViewer(url: url),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
