
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/application/pages/home/home_page.dart';

import 'go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/pages/home/dashboard',
    observers: [
      GoRouterObserver()
    ],
    routes: [
      // GoRoute(path: '/pages/home/overview',builder: (context,state)=>const OverviewPage()),
      // GoRoute(path: '/pages/home/dashboard',builder: (context,state)=>const DashboardPage()),
     
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
                path: '/pages/home/:tab',
                builder: (context, state) => HomePage(
                      key: state.pageKey,
                      tab: state.pathParameters['tab'] ?? 'overview',
                    )),
          ]),
    ]);
