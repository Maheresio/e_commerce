import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/auth/register/presentation/views/register_view.dart';

abstract class AppRouter {
  static const kRegister = '/register';
  static const kLogin = '/kLogin';

  static final GoRouter router = GoRouter(
    initialLocation: kLogin,
    routes: [
      GoRoute(
        path: kLogin,
        builder: (context, state) {
          return LoginView();
        },
      ),
      GoRoute(
        path: kRegister,
        builder: (context, state) {
          return RegisterView();
        },
      ),
    ],
  );
}
