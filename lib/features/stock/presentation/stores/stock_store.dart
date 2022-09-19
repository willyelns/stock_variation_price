import 'package:mobx/mobx.dart';
import 'package:stock_variation/features/stock/domain/usecases/retrieve_stock.dart';

import '../../../../../commons/types/use_case_response.dart';
import '../../domain/entities/stock.dart';

part 'stock_store.g.dart';

enum StockState { init, loading, loaded, error }

// ignore: library_private_types_in_public_api
class StockStore = _StockStoreBase with _$StockStore;

abstract class _StockStoreBase with Store {
  _StockStoreBase({
    required RetrieveStock retrieveStock,
  }) : _retrieveStock = retrieveStock;

  final RetrieveStock _retrieveStock;

  @observable
  StockState _state = StockState.init;

  @observable
  Stock? stock;

  @computed
  StockState get currentState => _state;

  @computed
  String get errorMessage => _state == StockState.error
      ? 'This could not be completed, please try again later'
      : '';

  @action
  Future<void> init() {
    return retrieveStock();
  }

  @action
  Future<void> retrieveStock() async {
    _state = StockState.loading;
    final useCase = _retrieveStock('PETR4');
    useCase.open(failureCallback: (failure) {
      _state = StockState.error;
    }, successCallback: (value) {
      stock = value;
      _state = StockState.loaded;
    });
  }
}
