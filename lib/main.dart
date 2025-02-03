import 'package:cypt_block/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'screens/splashscreen.dart';
import 'screens/views/bottom_navigation/bottom_nav_view_model.dart';
import 'utils/locator.dart';
import 'utils/progressBarManager/dialog_manager.dart';
import 'utils/progressBarManager/dialog_service.dart';
import 'utils/router/navigation_service.dart';
import 'utils/router/router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppStateProvider()),
        ChangeNotifierProvider(create: (context) => MyServices()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          title: 'Crypto Bloc',
          debugShowCheckedModeBanner: false,
          builder: (context, child) => Navigator(
            key: locator<ProgressService>().progressNavigationKey,
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (context) {
              return ProgressManager(child: child!);
            }),
          ),
          theme: ThemeData(useMaterial3: false),
          navigatorKey: locator<NavigationService>().navigationKey,
          home: const AnimatedSplashScreen(),
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
