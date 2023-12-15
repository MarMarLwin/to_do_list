import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/application/pages/dashboard/dashboard_page.dart';
import 'package:to_do_list/application/pages/overview/overview_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required String tab})
      : index = tabs.indexWhere((element) => element.name == tab);

  final int index;
// list of all tabs that should be displayed inside our navigation bar
  static const tabs = [DashboardPage.pageConfig, OverviewPage.pageConfig];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs
      .map((page) =>
          NavigationDestination(icon: Icon(page.icon), label: page.name))
      .toList();
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
      child: AdaptiveLayout(
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary_nav_medium'),
                builder: (context) => AdaptiveScaffold.standardNavigationRail(
                  selectedLabelTextStyle: TextStyle(color: theme.colorScheme.onBackground),
                  selectedIconTheme: IconThemeData(color: theme.colorScheme.onBackground),
                  unselectedIconTheme: IconThemeData(color: theme.colorScheme.onBackground.withOpacity(0.5)),
                  selectedIndex: widget.index,
                  onDestinationSelected: (value)=>_tabNavigationDestination(context, value),
                    destinations: destinations
                        .map((_) => AdaptiveScaffold.toRailDestination(_))
                        .toList())),
          },
        ),
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
                key: const Key('bottom_nav_small'),
                builder: (_) =>
                    AdaptiveScaffold.standardBottomNavigationBar(
                        destinations: destinations,
                        currentIndex: widget.index,
                        onDestinationSelected:(value)=>
                            _tabNavigationDestination(context, value)))
          },
        ),
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('body_small'),
                builder: (context) => HomePage.tabs[widget.index].child),
          },
        ),
        secondaryBody: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('secondary_body'),
                builder : AdaptiveScaffold.emptyBuilder)
          },
        ),
      ),
    ));
  }

  void _tabNavigationDestination(BuildContext context, int index) =>
      context.go('/pages/home/${HomePage.tabs[index].name}');
}
