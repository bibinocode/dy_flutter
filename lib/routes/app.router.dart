import 'package:go_router/go_router.dart';

import '../ui/init/index.dart';
import './route_paths.dart';

final GoRouter appRouter = GoRouter(initialLocation: RouterPaths.init, routes: [
  GoRoute(
    path: RouterPaths.init,
    builder: (context, state) => const SplashPage(),
  )
]);
