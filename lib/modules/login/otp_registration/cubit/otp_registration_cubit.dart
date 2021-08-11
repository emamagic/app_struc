import 'package:app_struc/core/exceptions/network_exceptions.dart';
import 'package:app_struc/data/network/dto/user/phone_number_dto.dart';
import 'package:app_struc/data/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'otp_registration_state.dart';

class OtpRegistrationCubit extends Cubit<OtpRegistrationState> {

  final UserRepository userRepository;

  OtpRegistrationCubit(this.userRepository) : super(OtpRegistrationInitial());

  otpRegistration(String phoneNumber, String otpToken) async {
    emit(OtpRegistrationLoading());
    var result = await userRepository.otpRegistration(phoneNumber, otpToken);
    result.when(success: (user) {
      emit(OtpRegistrationSuccess());
    }, failure: (NetworkExceptions error) {
      emit(OtpRegistrationFailed(NetworkExceptions.getErrorMessage(error)));
    });
  }

  resendCode(PhoneNumberDto phoneNumber) async {
    emit(PhoneVerificationLoading());
    var result = await userRepository.phoneVerification(phoneNumber);
    result.when(success: (mNull) {
      emit(PhoneVerificationSuccess());
    }, failure:(NetworkExceptions error) {
      emit(PhoneVerificationFailed(NetworkExceptions.getErrorMessage(error)));
    });
  }

}
