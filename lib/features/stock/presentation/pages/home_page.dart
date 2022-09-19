import 'package:flutter/material.dart';
import 'package:stock_variation/commons/extensions/theme/theme_context.dart';
import 'package:stock_variation/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variação de valor PETR4'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: context.width,
        height: context.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Escolha o tipo de visualização para os valores dos últimos 30 dias da PETR4.',
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () => _goToList(context),
                child: const Text('Vizualização em lista')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () => _goToChart(context),
                child: const Text('Vizualização em gráfico')),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _goToList(BuildContext context) {
    context.push(AppPages.stockList);
  }

  void _goToChart(BuildContext context) {
    context.push(AppPages.stockChart);
  }
}
