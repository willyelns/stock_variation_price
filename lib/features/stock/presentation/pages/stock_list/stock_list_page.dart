import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../commons/extensions/theme/theme_context.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/stock.dart';
import '../../../domain/entities/stock_value_variation.dart';
import '../../stores/stock_store.dart';
import 'states/stock_list_states.dart';

class StockListPage extends StatefulWidget {
  const StockListPage({super.key});

  @override
  State<StockListPage> createState() => _StockListPageState();
}

class _StockListPageState extends State<StockListPage> {
  late final Stock _stock;

  StockStore get _store => serviceLocator<StockStore>();

  @override
  void initState() {
    super.initState();
    _store.init();
    _stock = Stock(priceVariations: [
      StockValueVariation(value: 30.610000610351562, day: 1),
      StockValueVariation(value: 30.6299991607666, day: 2),
      StockValueVariation(value: 30.670000076293945, day: 3),
      StockValueVariation(value: 30.670000076293945, day: 4),
      StockValueVariation(value: 30.639999389648438, day: 5),
      StockValueVariation(value: 30.6299991607666, day: 6),
      StockValueVariation(value: 30.6200008392334, day: 7),
      StockValueVariation(value: 30.6299991607666, day: 8),
      StockValueVariation(value: 30.6299991607666, day: 9),
      StockValueVariation(value: 30.610000610351562, day: 10),
      StockValueVariation(value: 30.610000610351562, day: 11),
      StockValueVariation(value: 30.6200008392334, day: 12),
      StockValueVariation(value: 30.6200008392334, day: 13),
      StockValueVariation(value: 30.6200008392334, day: 14),
      StockValueVariation(value: 30.6200008392334, day: 15),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualização em lista'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Container(
          width: context.width,
          height: context.height,
          padding: const EdgeInsets.all(16),
          child: Observer(builder: (context) {
            final currentState = _store.currentState;

            switch (currentState) {
              case StockState.init:
              case StockState.loading:
                return const StockListLoadingState();
              case StockState.error:
                return StockChartErrorState(
                  retry: _retry,
                );

              case StockState.loaded:
                final stock = _store.stock!;
                return StockListLoadedState(
                  stock: stock,
                  // stock: _stock,
                );
            }
          }),
        ),
      ),
    );
  }

  Future<void> _onRefresh() {
    return _store.retrieveStock();
  }

  void _retry() {
    _store.retrieveStock();
  }
}
