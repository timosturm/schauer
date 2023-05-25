import 'package:flutter/material.dart';
import 'package:schauer/screens/forecast_screen.dart';

import 'screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OverviewPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'forecast_long',
          builder: (BuildContext context, GoRouterState state) {
            return ForecastScreen(
              tag: "forecast_long",
              child: state.extra as Widget,
            );
          },
        ),
        GoRoute(
          path: 'forecast_short',
          builder: (BuildContext context, GoRouterState state) {
            return ForecastScreen(
              tag: "forecast_short",
              child: state.extra as Widget,
            );
          },
        ),
      ],
    ),
  ],
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Schauer',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}
