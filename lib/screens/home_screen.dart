import 'package:devnote/components/app_shell.dart';
import 'package:devnote/components/empty_state.dart';
import 'package:devnote/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: const Text('DevNote'),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            );
          },
        ),
      ],
      fab: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: const Center(
        child: EmptyState(),
      ),
    );
  }
}
