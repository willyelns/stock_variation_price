import 'package:stock_variation/commons/base/entity.dart';

class StockValueVariation extends Entity<StockValueVariation> {
  StockValueVariation({
    required this.value,
    required this.day,
  });
  final double value;
  final int day;

  @override
  StockValueVariation copyWith({
    double? value,
    int? day,
  }) {
    return StockValueVariation(
      value: value ?? this.value,
      day: day ?? this.day,
    );
  }

  @override
  List<Object?> get props => [value, day];
}
