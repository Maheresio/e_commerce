import 'package:go_router/go_router.dart';

import '../../features/auth/register/presentation/views/register_view.dart';

abstract class AppRouter {
  static const kRegister = '/';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kRegister,
        builder: (context, state) {
          return RegisterView();
        },
      ),
    ],
  );
}
