import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../../../domain/entities/stock.dart';
import '../../../../domain/entities/stock_value_variation.dart';

class StockChartLoadedState extends StatelessWidget {
  const StockChartLoadedState({required this.stock, super.key});

  final Stock stock;

  List<charts.Series<StockValueVariation, String>> get series => [
        charts.Series<StockValueVariation, String>(
          domainFn: (valueVariation, _) => valueVariation.day.toString(),
          measureFn: (valueVariation, _) => valueVariation.value,
          id: 'stockValueId',
          data: stock.priceVariations,
        ),
      ];

  charts.BarChart get chart => charts.BarChart(
        series,
        animate: true,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Veja aqui os últimos 30 dias de valores da PETR4:'),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            height: 200.0,
            child: chart,
          ),
        )
      ],
    );
  }
}
