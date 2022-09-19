import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'services/network/network_info.dart';

final _serviceLocator = GetIt.instance;

Future<void> init() async {
  //* Connection
  _serviceLocator.registerLazySingleton(InternetConnectionChecker.new);
  _serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: _serviceLocator(),
    ),
  );
  _serviceLocator.registerLazySingleton<Dio>(Dio.new);
}
