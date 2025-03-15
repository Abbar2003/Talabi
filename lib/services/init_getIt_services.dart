import 'package:flutter_maps/services/navigation_services.dart';
import 'package:get_it/get_it.dart';


GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
