import 'package:flutter/material.dart';

import '../../../../domain/entities/stock.dart';
import '../../../../domain/entities/stock_value_variation.dart';

class StockListLoadedState extends StatelessWidget {
  const StockListLoadedState({required this.stock, super.key});

  final Stock stock;

  List<StockValueVariation> get priceVariations => stock.priceVariations;

  String _formatValue(double value) {
    final fixedDouble = value.toStringAsFixed(2);
    final replacedDot = fixedDouble.replaceAll('.', ',');
    return 'R\$ $replacedDot';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Veja aqui os últimos 30 dias de valores da PETR4:'),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: priceVariations.length,
            itemBuilder: (context, index) {
              final priceVariation = priceVariations[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dia: ${priceVariation.day}'),
                      Text('Valor: ${_formatValue(priceVariation.value)}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
