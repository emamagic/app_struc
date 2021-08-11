

import 'package:app_struc/data/network/rest/dio/dio_provider.dart';
import 'package:app_struc/data/network/rest/services/rest_provider.dart';

abstract class BaseRepository {

  late RestProvider restProvider;

  BaseRepository() {
    var provider = DioProvider();
    restProvider = provider.restProvider;
  }

}