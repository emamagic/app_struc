

import 'package:app_struc/core/base/api_wrapper.dart';
import 'package:app_struc/core/base/base_repository.dart';
import 'package:app_struc/core/constants/general.dart';
import 'package:app_struc/core/exceptions/network_exceptions.dart';
import 'package:app_struc/data/network/dto/user/phone_number_dto.dart';
import 'package:app_struc/data/network/dto/user/user_dto.dart';
import 'package:app_struc/data/network/dto/workspace/workspace_dto.dart';
import 'package:app_struc/data/preferences/pref.dart';
import 'package:app_struc/data/preferences/pref_key.dart';

class UserRepository extends BaseRepository {

  Future<ApiWrapper<void>> phoneVerification(PhoneNumberDto phoneNumber) async {
    try {
      await restProvider.phoneVerification(phoneNumber);
      return ApiWrapper.success(data: null);
    } catch(error) {
      return ApiWrapper.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiWrapper<UserDto>> otpRegistration(String phoneNumber, String otpToken) async {
    try {
      var result = await restProvider.otpRegistration(phoneNumber, otpToken, "");
      Pref.set(PrefKey.USER_ID, result.data.id!);
      Pref.set(PrefKey.ACCESS_TOKEN, result.response.headers['set-cookie']!.first.substring(12).split(';').first);
      Pref.set(PrefKey.REFRESH_TOKEN, result.response.headers['set-cookie']!.last.substring(13).split(';').first);
      return ApiWrapper.success(data: result.data);
    } catch(error){
      return ApiWrapper.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiWrapper<List<WorkspaceDto>>> getUserWorkspaces() async {
    try {
      var result = await restProvider.getUserWorkspaces();
      return ApiWrapper.success(data: result);
    } catch (error) {
      return ApiWrapper.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<bool> isUserLogin() async {
    var result = await Pref.get(PrefKey.USER_ID);
    if(result != NOT_EXIST) {return true;}
    return false;
  }

  Future<void> getUserConversations(int pageKey) async {

  }

}