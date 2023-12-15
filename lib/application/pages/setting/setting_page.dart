import 'package:flutter/material.dart';
import 'package:to_do_list/application/core/page_config.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

static const pageConfig= PageConfig(icon: Icons.settings_rounded, name: 'setting', child: SettingPage());
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}