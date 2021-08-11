part of 'phone_verification_cubit.dart';

@immutable
abstract class PhoneVerificationState {}

class PhoneVerificationInitial extends PhoneVerificationState {}
class PhoneVerificationLoading extends PhoneVerificationState {}
class PhoneVerificationSuccess extends PhoneVerificationState {}
class PhoneVerificationFailed extends PhoneVerificationState {
  final String error;
  PhoneVerificationFailed(this.error);
}
