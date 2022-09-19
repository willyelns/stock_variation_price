import 'package:get_it/get_it.dart';
import './features/stock/injection_container.dart' as stock_injection_container;
import './commons/injection_container.dart' as commons_injection_container;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  await commons_injection_container.init();
  await stock_injection_container.init();
}
