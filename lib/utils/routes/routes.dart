import 'package:app_lifecycle/pages/objects_page.dart';
import 'package:app_lifecycle/pages/splash.dart';
import 'package:app_lifecycle/utils/routes/routes_name.dart';
import 'package:get/get.dart';

class Routes {
  static generateRoutes() {
    return [
      MyRoute(
        routeName: RoutesName.splashPage,
        routePage: () => SplashScreen(),
      ),
      MyRoute(routeName: RoutesName.objectPage, routePage: () => ObjectsPage()),
    ];
  }
}

class MyRoute<T> extends GetPage<T> {
  final String routeName;
  final GetPageBuilder routePage;
  final Transition? routeTransition;
  final Duration? routeTransitionDuration;
  final bool fullScreenDialog;

  MyRoute({
    required this.routeName,
    required this.routePage,
    this.routeTransition = Transition.rightToLeft,
    this.routeTransitionDuration,
    this.fullScreenDialog = false,
  }) : super(
         name: routeName,
         page: routePage,
         transition: routeTransition,
         transitionDuration:
             routeTransitionDuration ?? Duration(milliseconds: 200),
         fullscreenDialog: fullScreenDialog,
       );
}
