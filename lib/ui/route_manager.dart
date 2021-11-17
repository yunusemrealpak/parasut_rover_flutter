import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parasut_rover_flutter/core/navigation/navigate_animations.dart';
import 'package:parasut_rover_flutter/entities/dto/photo.dart';
import 'package:parasut_rover_flutter/ui/widgets/filter/filter_view.dart';

import '../core/constants/navigation_constants.dart';
import 'app/view/app_view.dart';
import 'login/view/login_view.dart';
import 'splash/view/splash_view.dart';
import 'widgets/image_viewer.dart';

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
        var data = settings.arguments as Photo;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.IMAGE_VIEWER),
          builder: (_) => ImageViewer(photo: data),
        );
      case Routes.FILTER:
        return SlideBottomRoute(
          page: FilterView(),
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
