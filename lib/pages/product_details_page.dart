import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String id;
  const ProductDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Product details for #$id'));
  }
}
