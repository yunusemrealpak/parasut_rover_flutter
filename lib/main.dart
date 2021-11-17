import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/constants/navigation_constants.dart';
import 'core/navigation/navigation_service.dart';
import 'core/storage/storage_service.dart';
import 'core/theme/theme_builder.dart';
import 'ui/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env.example");
  await StorageService().initStorage();
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
        child: CupertinoApp(
          title: 'Rovers',
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black.withOpacity(0.85),
            textTheme: CupertinoTextThemeData(textStyle: TextStyle(color: Colors.white)),
            primaryColor: Color(0xFF784319),
            barBackgroundColor: Colors.black87,
          ),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          navigatorKey: NavigationService().navigatorMainKey,
          initialRoute: Routes.SPLASH,
          onGenerateRoute: RouteManager.generateRoute,
        ),
      ),
    );
  }
}
