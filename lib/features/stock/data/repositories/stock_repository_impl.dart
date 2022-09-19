import 'package:stock_variation/commons/errors/exceptions/server_exception.dart';
import 'package:stock_variation/commons/errors/failures/connection_failure.dart';
import 'package:stock_variation/commons/errors/failures/server_error.dart';
import 'package:stock_variation/commons/services/network/network_info.dart';
import 'package:stock_variation/commons/types/use_case_response.dart';
import 'package:stock_variation/features/stock/data/datasources/stock_datasource.dart';
import 'package:stock_variation/features/stock/domain/repositories/stock_repository..dart';

import '../../domain/entities/stock.dart';

class StockRepositoryImpl implements StockRepository {
  StockRepositoryImpl(
      {required StockRemoteDatasource remoteDatasource,
      required NetworkInfo networkInfo})
      : _remoteDatasource = remoteDatasource,
        _networkInfo = networkInfo;

  final StockRemoteDatasource _remoteDatasource;
  final NetworkInfo _networkInfo;

  @override
  UseCaseResponse<Stock> retrieveStock(String symbol) async {
    if (await _networkInfo.isConnected) {
      try {
        final stock = await _remoteDatasource.retrieveStock(symbol);

        return UseCaseResponseExtension.createSuccess(stock);
      } on ServerException {
        return UseCaseResponseExtension.createFailure(const ServerFailure());
      }
    }
    return UseCaseResponseExtension.createFailure(const ConnectionFailure());
  }
}
