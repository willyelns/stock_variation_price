import 'package:stock_variation/features/stock/domain/entities/stock_value_variation.dart';

import '../../../../commons/base/entity.dart';

class Stock extends Entity<Stock> {
  Stock({required this.priceVariations});
  final List<StockValueVariation> priceVariations;

  @override
  Stock copyWith({List<StockValueVariation>? priceVariations}) {
    return Stock(priceVariations: priceVariations ?? this.priceVariations);
  }

  @override
  List<Object?> get props => [priceVariations];
}
