import 'package:stock_variation/commons/mixins/mappable.dart';

import '../mixins/decoder.dart';
import '../types/json_data.dart';

abstract class Model implements Decoder, Mappable {
  @override
  JsonData toJson() => toMap();
}
