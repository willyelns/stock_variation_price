import 'package:dio/dio.dart';
import 'package:stock_variation/features/stock/data/datasources/stock_datasource.dart';

import '../../../commons/errors/exceptions/server_exception.dart';
import '../../../commons/types/json_data.dart';
import '../data/models/stock_model.dart';

class StockRemoteDatasourceImpl implements StockRemoteDatasource {
  StockRemoteDatasourceImpl({required Dio dio, required String baseUrl})
      : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String _baseUrl;

  @override
  Future<StockModel> retrieveStock(String symbol) async {
    try {
      final response = await _dio.get('$_baseUrl/$symbol.SA');
      final json = response.data as JsonData;
      return StockModel.fromJson(json);
    } on Object catch (e) {
      print('DEU MERDA: $e');
      throw const ServerException();
    }
  }
}
