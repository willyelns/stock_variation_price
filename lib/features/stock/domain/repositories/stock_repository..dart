import 'package:stock_variation/commons/types/use_case_response.dart';

import '../entities/stock.dart';

abstract class StockRepository {
  UseCaseResponse<Stock> retrieveStock(String symbol);
}
