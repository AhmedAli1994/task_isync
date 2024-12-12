import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/opens_menu.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const MyAppBar({super.key}) : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('I Sync Drag'),
      actions: [
        IconButton(
            icon: const Icon(Icons.menu),
            onPressed:
                Provider.of<MenuOpens>(context, listen: false).changeStatus),
      ],
    );
  }
}
