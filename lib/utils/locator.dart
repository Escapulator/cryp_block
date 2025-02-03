import 'package:get_it/get_it.dart';

import '../core/services/myservices.dart';
import 'progressBarManager/dialog_service.dart';
import 'router/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => MyServices());
  locator.registerLazySingleton(() => ProgressService());
}
