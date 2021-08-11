import 'package:app_struc/core/exceptions/network_exceptions.dart';
import 'package:app_struc/data/network/dto/user/phone_number_dto.dart';
import 'package:app_struc/data/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {

  final UserRepository userRepository;

  PhoneVerificationCubit(this.userRepository) : super(PhoneVerificationInitial());

  phoneVerification(PhoneNumberDto phoneNumber) async {
    emit(PhoneVerificationLoading());
    var result = await userRepository.phoneVerification(phoneNumber);
    result.when(success: (mNull) {
      emit(PhoneVerificationSuccess());
    }, failure:(NetworkExceptions error) {
      emit(PhoneVerificationFailed(NetworkExceptions.getErrorMessage(error)));
    });
  }

}
