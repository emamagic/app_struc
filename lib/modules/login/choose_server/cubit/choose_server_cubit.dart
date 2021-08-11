import 'package:app_struc/core/base/api_wrapper.dart';
import 'package:app_struc/core/base/state_wrapper.dart';
import 'package:app_struc/core/exceptions/network_exceptions.dart';
import 'package:app_struc/data/network/dto/config/config_dto.dart';
import 'package:app_struc/data/repositories/config_repository.dart';
import 'package:bloc/bloc.dart';

class ChooseServerCubit extends Cubit<StateWrapper<ConfigDto>> {

  final ConfigRepository configRepository;

  ChooseServerCubit({required this.configRepository}): super(Idle());

  config(String serverHost) async {
    emit(StateWrapper.loading());
    ApiWrapper<ConfigDto> apiResult = await configRepository.config(serverHost);
    apiResult.when(success: (ConfigDto data) {
      emit(StateWrapper.data(data: data));
    }, failure: (NetworkExceptions error) async {
      emit(StateWrapper.error(error: error));
    });
  }


}
