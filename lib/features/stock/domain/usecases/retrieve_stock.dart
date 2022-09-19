import 'package:stock_variation/features/stock/domain/entities/stock.dart';

import '../../../../commons/types/use_case_response.dart';
import '../repositories/stock_repository..dart';

abstract class RetrieveStock {
  UseCaseResponse<Stock> call(String symbol);
}

class RetrieveStockImpl implements RetrieveStock {
  const RetrieveStockImpl(this._repository);

  final StockRepository _repository;

  @override
  UseCaseResponse<Stock> call(String symbol) async {
    return _repository.retrieveStock(symbol);
  }
}
