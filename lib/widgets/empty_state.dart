import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 48, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .5)),
          const SizedBox(height: 12),
          Text('No products yet', style: Theme.of(context).textTheme.titleMedium),
          Text('Use the assistant or search to get started', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .6))),
        ],
      ),
    );
  }
}
