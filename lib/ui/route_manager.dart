import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parasut_rover_flutter/core/constants/navigation_constants.dart';

import 'app/view/app_view.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.APP:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.APP),
          builder: (_) => AppView(),
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
