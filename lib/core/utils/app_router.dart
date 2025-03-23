import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSplashView = '/';

  static final GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path: kSplashView,
      //   builder: (context, state) {
      //     return SplashView();
      //   },

      // )
    ],
  );
}
