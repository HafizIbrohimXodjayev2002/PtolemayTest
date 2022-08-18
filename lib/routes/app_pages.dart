
import 'package:ptolemay/presentation/main/main_page.dart';
import 'package:ptolemay/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

abstract class AppPages {
  static final GoRouter router = GoRouter(
    routes: [
      /// Main Page
      GoRoute(
        path: Routes.main,
        builder: (context, state) => const MainPage(),
      ),
     
    ],
  );
}
