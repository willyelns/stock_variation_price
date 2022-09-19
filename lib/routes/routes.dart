import 'package:flutter/material.dart';
import '../features/stock/presentation/pages/stock_chart/stock_chart_page.dart';

import '../features/stock/presentation/pages/home_page.dart';
import '../features/stock/presentation/pages/stock_list/stock_list_page.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => const HomePage(),
  '/stock/chart': (context) => const StockChartPage(),
  '/stock/list': (context) => const StockListPage(),
};
