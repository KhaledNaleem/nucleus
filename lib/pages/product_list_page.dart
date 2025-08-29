import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/empty_state.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'id': '1', 'name': 'SentinelOne', 'sku': 'A1-WGT-001', 'desc': 'Cyber Security and Networking Solutions', 'tag': 'Cyber Security'},
      {'id': '2', 'name': 'Okta', 'sku': 'B2-CMP-002', 'desc': 'Advanced Identity and Access Management', 'tag': 'Identity'},
      {'id': '3', 'name': 'Apple', 'sku': 'A7-MOB-012', 'desc': 'Mobility devices and enterprise services', 'tag': 'Mobility'},
    ];

    if (products.isEmpty) {
      return const EmptyState();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.6,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return ProductCard(
            id: p['id']!, name: p['name']!, sku: p['sku']!, description: p['desc']!, tag: p['tag']!,
          );
        },
      ),
    );
  }
}
