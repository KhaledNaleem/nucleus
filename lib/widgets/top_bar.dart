import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final VoidCallback onMenuToggle;
  final ValueChanged<String> onSearch;
  final VoidCallback onToggleTheme;
  final bool sidebarOpen;

  const TopBar({
    super.key,
    required this.onMenuToggle,
    required this.onSearch,
    required this.onToggleTheme,
    required this.sidebarOpen,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: widget.sidebarOpen ? 0 : 0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.tertiary.withValues(alpha: .5))),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              IconButton(
                tooltip: widget.sidebarOpen ? 'Collapse sidebar' : 'Expand sidebar',
                onPressed: widget.onMenuToggle,
                icon: Icon(widget.sidebarOpen ? Icons.keyboard_double_arrow_left : Icons.keyboard_double_arrow_right),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  onChanged: widget.onSearch,
                  decoration: const InputDecoration(
                    hintText: 'Search products, SKUs, suppliers...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                tooltip: 'Toggle light/dark',
                onPressed: widget.onToggleTheme,
                icon: const Icon(Icons.brightness_6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
