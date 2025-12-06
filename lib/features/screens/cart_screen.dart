import 'package:flutter/material.dart';

import '../../common_widgets/custom_navigation_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(activeIndex: 2),
      appBar: AppBar(title: const Text('Cart Screen')),
      body: const Center(child: Text('This is the Cart Screen')),
    );
  }
}
