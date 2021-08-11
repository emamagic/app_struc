part of 'otp_registration_cubit.dart';

@immutable
abstract class OtpRegistrationState {}

class OtpRegistrationInitial extends OtpRegistrationState {}
class OtpRegistrationLoading extends OtpRegistrationState {}
class OtpRegistrationSuccess extends OtpRegistrationState {}
class OtpRegistrationFailed extends OtpRegistrationState {
  final String error;
  OtpRegistrationFailed(this.error);
}
class PhoneVerificationLoading extends OtpRegistrationState {}
class PhoneVerificationSuccess extends OtpRegistrationState {}
class PhoneVerificationFailed extends OtpRegistrationState {
  final String error;
  PhoneVerificationFailed(this.error);
}
