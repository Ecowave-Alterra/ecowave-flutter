part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class SendOtpEvent extends OtpEvent {
  final String email;

  const SendOtpEvent(this.email);

  @override
  List<Object> get props => [email];
}

class SendOtp2Event extends OtpEvent {
  final String email;

  const SendOtp2Event(this.email);

  @override
  List<Object> get props => [email];
}

class VerifikasiOtpEvent extends OtpEvent {
  final String email;
  final String otp;

  const VerifikasiOtpEvent(this.email, this.otp);

  @override
  List<Object> get props => [otp];
}
