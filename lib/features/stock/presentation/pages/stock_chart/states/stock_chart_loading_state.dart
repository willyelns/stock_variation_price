import 'package:flutter/material.dart';

class StockChartLoadingState extends StatelessWidget {
  const StockChartLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
