// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StockStore on _StockStoreBase, Store {
  Computed<StockState>? _$currentStateComputed;

  @override
  StockState get currentState =>
      (_$currentStateComputed ??= Computed<StockState>(() => super.currentState,
              name: '_StockStoreBase.currentState'))
          .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_StockStoreBase.errorMessage'))
          .value;

  late final _$_stateAtom =
      Atom(name: '_StockStoreBase._state', context: context);

  @override
  StockState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(StockState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$stockAtom =
      Atom(name: '_StockStoreBase.stock', context: context);

  @override
  Stock? get stock {
    _$stockAtom.reportRead();
    return super.stock;
  }

  @override
  set stock(Stock? value) {
    _$stockAtom.reportWrite(value, super.stock, () {
      super.stock = value;
    });
  }

  late final _$retrieveStockAsyncAction =
      AsyncAction('_StockStoreBase.retrieveStock', context: context);

  @override
  Future<void> retrieveStock() {
    return _$retrieveStockAsyncAction.run(() => super.retrieveStock());
  }

  late final _$_StockStoreBaseActionController =
      ActionController(name: '_StockStoreBase', context: context);

  @override
  Future<void> init() {
    final _$actionInfo = _$_StockStoreBaseActionController.startAction(
        name: '_StockStoreBase.init');
    try {
      return super.init();
    } finally {
      _$_StockStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stock: ${stock},
currentState: ${currentState},
errorMessage: ${errorMessage}
    ''';
  }
}
