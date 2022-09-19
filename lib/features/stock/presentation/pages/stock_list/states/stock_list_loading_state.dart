import 'package:flutter/material.dart';

class StockListLoadingState extends StatelessWidget {
  const StockListLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
