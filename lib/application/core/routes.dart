import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/application/pages/home/home_page.dart';
import 'package:to_do_list/application/pages/setting/setting_page.dart';

import '../pages/overview/overview_page.dart';
import 'go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const String _basePath = '/pages/home';
final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '$_basePath/Dashboard',
    observers: [
      GoRouterObserver()
    ],
    routes: [
      GoRoute(
        name: SettingPage.pageConfig.name,
          path: '$_basePath/${SettingPage.pageConfig.name}',
          builder: (context, state) => const SettingPage()),
     

      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
              name: HomePage.pageConfig.name,
                path: '$_basePath/:tab',
                builder: (context, state) => HomePage(
                      key: state.pageKey,
                      tab: state.pathParameters['tab'] ?? '$_basePath/${OverviewPage.pageConfig.name}',
                    )),
          ]),
    ]);
