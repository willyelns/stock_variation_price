import 'package:stock_variation/commons/types/json_data.dart';
import 'package:stock_variation/features/stock/data/models/stock_value_variation_model.dart';
import 'package:stock_variation/features/stock/domain/entities/stock.dart';

import '../../../../commons/base/model.dart';

class StockModel extends Stock implements Model {
  StockModel({required super.priceVariations});

  factory StockModel.fromJson(JsonData json) {
    // final chartJson = json['chart'];
    // final resultJson = chartJson['result'];
    // final indicatorsJson = resultJson['indicators'];
    // final quoteJson = indicatorsJson['quote'];
    // final openJson = quoteJson['open'] as List;
    final openJson =
        json['chart']['result']['indicators']['quote']['open'] as List;
    final valueList = openJson.sublist(0, 30);

    return StockModel(
      priceVariations: valueList.asMap().entries.map((e) {
        final day = e.key + 1;
        return StockValueVariationModel(value: e.value, day: day);
      }).toList(),
    );
  }

  @override
  JsonData toMap() {
    return {
      'chart': {
        'result': {
          'indicators': {
            'quote': {
              'open': priceVariations.map((e) => e.value),
            }
          }
        }
      }
    };
  }

  @override
  JsonData toJson() => toMap();
}
