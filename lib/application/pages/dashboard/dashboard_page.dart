import 'package:flutter/material.dart';
import 'package:to_do_list/application/core/page_config.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

static const pageConfig=PageConfig(icon: Icons.dashboard_rounded, name: 'Dashboard', child: DashboardPage());
  @override
  Widget build(BuildContext context) {
    return  Container(color: Colors.amber,);
  }
}