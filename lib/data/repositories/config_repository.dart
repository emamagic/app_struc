

import 'package:app_struc/core/base/api_wrapper.dart';
import 'package:app_struc/core/base/base_repository.dart';
import 'package:app_struc/core/exceptions/network_exceptions.dart';
import 'package:app_struc/data/network/dto/config/config_dto.dart';

class ConfigRepository extends BaseRepository{

  Future<ApiWrapper<ConfigDto>> config(String serverHost) async {
    try {
      var config = await restProvider.config();
      return ApiWrapper.success(data: config);
    } catch (error) {
      return ApiWrapper.failure(error: NetworkExceptions.getDioException(error));
    }
  }

}