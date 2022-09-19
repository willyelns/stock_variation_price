import 'package:get_it/get_it.dart';
import 'package:stock_variation/features/stock/presentation/stores/stock_store.dart';
import 'data/repositories/stock_repository_impl.dart';
import 'domain/repositories/stock_repository..dart';
import 'domain/usecases/retrieve_stock.dart';
import 'remote/stock_remote_datasource_impl.dart';
import 'data/datasources/stock_datasource.dart';

final _serviceLocator = GetIt.instance;

Future<void> init() async {
  _serviceLocator.registerLazySingleton<RetrieveStock>(
    () => RetrieveStockImpl(
      _serviceLocator(),
    ),
  );

  _serviceLocator.registerLazySingleton<StockRemoteDatasource>(
    () => StockRemoteDatasourceImpl(
      dio: _serviceLocator(),
      baseUrl: 'https://query2.finance.yahoo.com/v8/finance/chart',
    ),
  );
  _serviceLocator.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(
      remoteDatasource: _serviceLocator(),
      networkInfo: _serviceLocator(),
    ),
  );
  _serviceLocator.registerLazySingleton<StockStore>(
    () => StockStore(
      retrieveStock: _serviceLocator(),
    ),
  );
}
