import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber(String phoneNumber)async{
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+963$phoneNumber',
  verificationCompleted: verificationCompleted,
  verificationFailed: verificationFailed,
  codeSent: codeSent,
  codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
);
  }
  verificationCompleted(PhoneAuthCredential credential)async{
    log("verificationCompleted");
    await signin(credential);
  }
  verificationFailed(FirebaseAuthException error){
    log("verificationFailed");
    log("================$error");
    emit(ErrorState(errorMessage: error.toString()));
  }
  codeSent(String verificationId, int? resendToken){
    log("codeSent");
    this.verificationId=verificationId;
    emit(phoneNumberSubmited());
  }
  codeAutoRetrievalTimeout(String verificationId){
    log("codeAutoRetrievalTimeout");
  }
  Future<void> submitOTP(String OTPCode)async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: OTPCode);
    await signin(credential);
  }
  Future<void> signin(PhoneAuthCredential credential)async{
    try{
    await FirebaseAuth.instance.signInWithCredential(credential);
    emit(phoneOTPVerifyed());
    }
    catch(error){
      emit(ErrorState(errorMessage: error.toString()));
    }
  }
  Future<void> logOut()async{
   await FirebaseAuth.instance.signOut();
  }
  User getLoggedInUer(){
    User firebaseUser=FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
