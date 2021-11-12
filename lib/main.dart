import 'package:flutter/material.dart';

import 'core/constants/navigation_constants.dart';
import 'core/navigation/navigation_service.dart';
import 'core/theme/theme_builder.dart';
import 'ui/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (context, theme, _) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: MaterialApp(
          title: 'Rovers',
          navigatorKey: NavigationService().navigatorMainKey,
          debugShowCheckedModeBanner: false,
          theme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          themeMode: theme.currentTheme,
          initialRoute: Routes.SPLASH,
          onGenerateRoute: RouteManager.generateRoute,
        ),
      ),
    );
  }
}
