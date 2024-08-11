import 'package:arre_signment/app/features/home/presentation/home_page.dart';
import 'package:arre_signment/app/features/player/presentation/player_page.dart';
import 'package:arre_signment/app/utils/constants/route_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: RouteConstants.home,
      routes: [
        GoRoute(
          path: RouteConstants.home,
          name: RouteConstants.home,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: '${RouteConstants.audioTrack}/:trackId',
              name: RouteConstants.audioTrack,
              builder: (context, state) => const PlayerPage(),
            ),
          ],
        ),
      ],
    );
  },
);
