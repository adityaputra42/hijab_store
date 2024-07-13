import 'package:barakallah_hijab/features/auth/presentation/pages/sign_in_page.dart';
import 'package:barakallah_hijab/features/auth/presentation/pages/sign_up_page.dart';
import 'package:barakallah_hijab/features/dasboard/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static AppRoutes instance = AppRoutes();
  route() {
    return GoRouter(
      routes: [
        GoRoute(
            path: '/',
            name: 'login',
            builder: (context, state) => const SignInPage(),
            routes: [
              GoRoute(
                path: 'sign_up',
                name: 'sign_up',
                builder: (context, state) => const SignUpPage(),
              ),
            ]),
        GoRoute(
          path: '/main',
          name: 'main',
          builder: (context, state) => const DashboardPage(),
        ),
      ],
      initialLocation: '/',
      debugLogDiagnostics: true,
    );
  }
}
