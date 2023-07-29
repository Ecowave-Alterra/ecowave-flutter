import 'package:ecowave/features/change_password/model/services/otp_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpService _otpService;
  OtpBloc(this._otpService) : super(OtpInitial()) {
    on<SendOtpEvent>((event, emit) async {
      try {
        emit(OtpLoading());
        final response = await _otpService.sendEmailOtp(event.email);
        if (response['Status'] == 400 &&
            response['Message'] == "Email tidak ditemukan") {
          emit(const OtpError("Email Tidak Ditemukan"));
        } else if (response['Status'] == 200) {
          emit(OtpSuccess());
        } else {
          emit(const OtpError("Gagal Mengirim Kode Otp"));
        }
      } catch (e) {
        emit(OtpError(e.toString()));
      }
    });

    on<SendOtp2Event>((event, emit) async {
      try {
        emit(OtpLoading());
        final response = await _otpService.sendEmailOtp(event.email);
        if (response['Status'] == 400 &&
            response['Message'] == "Email tidak ditemukan") {
          emit(const OtpError("Email Tidak Ditemukan"));
        } else if (response['Status'] == 200) {
          emit(OtpVerifikasiSuccess());
        } else {
          emit(const OtpError("Gagal Mengirim Kode Otp"));
        }
      } catch (e) {
        emit(OtpError(e.toString()));
      }
    });

    on<VerifikasiOtpEvent>((event, emit) async {
      try {
        emit(OtpLoading());
        final response =
            await _otpService.verifikasiOtp(event.email, event.otp);
        if (response["Status"] == 400 &&
            response['Message'] == "Kode otp kadaluarsa") {
          emit(const OtpError("Kode otp kadaluarsa"));
        } else if (response["Status"] == 200) {
          emit(OtpSuccess());
        } else {
          emit(const OtpError("Gagal Verifikasi Kode Otp"));
        }
      } catch (e) {
        emit(OtpError(e.toString()));
      }
    });
  }
}
