import '../models/stock_model.dart';

abstract class StockRemoteDatasource {
  Future<StockModel> retrieveStock(String symbol);
}
