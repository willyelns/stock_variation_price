import 'package:stock_variation/commons/types/json_data.dart';
import 'package:stock_variation/features/stock/domain/entities/stock_value_variation.dart';

import '../../../../commons/base/model.dart';

class StockValueVariationModel extends StockValueVariation implements Model {
  StockValueVariationModel({required super.value, required super.day});

  factory StockValueVariationModel.fromJson(JsonData json) {
    return StockValueVariationModel(
      day: json['day'],
      value: json['value'],
    );
  }

  @override
  JsonData toJson() => toMap();

  @override
  Map<String, dynamic> toMap() {
    return {'value': value, 'day': day};
  }
}
