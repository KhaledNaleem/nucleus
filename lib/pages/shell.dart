import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  final VoidCallback onToggleTheme;

  const AppShell({super.key, required this.child, required this.onToggleTheme});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool _sidebarOpen = true;
  // ignore: unused_field
  String _search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            open: _sidebarOpen,
            onNavigate: (route) => context.go(route),
          ),
          Expanded(
            child: Column(
              children: [
                TopBar(
                  sidebarOpen: _sidebarOpen,
                  onMenuToggle: () => setState(() => _sidebarOpen = !_sidebarOpen),
                  onSearch: (q) => setState(() => _search = q),
                  onToggleTheme: widget.onToggleTheme,
                ),
                Expanded(child: widget.child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
