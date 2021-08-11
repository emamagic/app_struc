import 'dart:async';
import 'package:app_struc/core/constants/general.dart';
import 'package:app_struc/data/network/dto/config/config_dto.dart';
import 'package:app_struc/data/network/dto/user/user_dto.dart';
import 'package:app_struc/data/network/dto/workspace/workspace_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_provider.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RestProvider {
  factory RestProvider(Dio dio, {String baseUrl}) = _RestProvider;

  //-------------------- Config -------------------
  @GET("")
  Future<ConfigDto> config();

  //-------------------- USER ---------------------
  @POST("")
  Future phoneVerification(@Body() phoneNumber);

  @POST("")
  Future<HttpResponse<UserDto>> otpRegistration(
      @Query("j_phoneNumber") String phoneNumber,
      @Query("j_otpToken") String otpToken,
      @Query("j_deviceKey") String deviceKey);

  @GET("")
  Future<List<WorkspaceDto>> getUserWorkspaces();
}
