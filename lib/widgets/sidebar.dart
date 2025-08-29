import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  final bool open;
  final ValueChanged<String> onNavigate;

  const Sidebar({super.key, required this.open, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final navItems = [
      _NavItem(Icons.grid_view_rounded, 'Products', '/app/products'),
      _NavItem(Icons.assistant, 'Assistant', '/app/assistant'),
      _NavItem(Icons.settings, 'Settings', '/app/settings'),
      _NavItem(Icons.person, 'Profile', '/app/profile'),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: open ? 240 : 72,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(right: BorderSide(color: Theme.of(context).colorScheme.tertiary.withValues(alpha: .5))),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: open ? MainAxisAlignment.center : MainAxisAlignment.center,
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF284B63),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text('E', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: navItems.length,
                itemBuilder: (context, index) {
                  final item = navItems[index];
                  return ListTile(
                    leading: Icon(item.icon),
                    title: open ? Text(item.label) : null,
                    onTap: () => onNavigate(item.route),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('v 1.0', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final String route;
  _NavItem(this.icon, this.label, this.route);
}
