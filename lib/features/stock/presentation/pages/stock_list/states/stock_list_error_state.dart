import 'package:flutter/material.dart';
import '../../../../../../commons/extensions/theme/theme_context.dart';

class StockChartErrorState extends StatelessWidget {
  const StockChartErrorState({required this.retry, super.key});

  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Erro ao carregar informações...',
          style: context.textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: retry, child: const Text('tentar novamente')),
      ],
    );
  }
}
