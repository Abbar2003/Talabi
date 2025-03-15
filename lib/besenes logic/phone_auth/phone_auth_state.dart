part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}
final class loadingState extends PhoneAuthState{}
final class ErrorState extends PhoneAuthState{
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
final class phoneNumberSubmited extends PhoneAuthState{}
  final class phoneOTPVerifyed extends PhoneAuthState{}
