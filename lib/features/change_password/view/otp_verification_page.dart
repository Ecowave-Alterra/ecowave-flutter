import 'dart:async';

import 'package:ecowave/core.dart';
import 'package:ecowave/features/change_password/bloc/otp/otp_bloc.dart';
import 'package:ecowave/features/change_password/model/services/change_password_service.dart';
import 'package:ecowave/features/change_password/view/change_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String email;
  const PinCodeVerificationScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  final TextEditingController _otpController = TextEditingController(text: "");

  String currentText = "";
  final _formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   _otpController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lupa Password"),
      ),
      body: BlocProvider(
        create: (context) => OtpBloc(ChangePasswordService()),
        child: BlocListener<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state is OtpLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                },
              );
            } else if (state is OtpError) {
              context.pushAndRemoveUntil(
                  PinCodeVerificationScreen(
                    email: widget.email,
                  ),
                  (route) => false);

              "Gagal Verifikasi OTP, kode otp mungkin sudah kadaluarsa"
                  .failedBar(context);
            } else if (state is OtpSuccess) {
              context.pushAndRemoveUntil(
                  ChangePasswordPage(
                    email: widget.email,
                  ),
                  (route) => false);
              "Berhasil verifikasi kode OTP".succeedBar(context);
            }
          },
          child: BlocBuilder<OtpBloc, OtpState>(
            builder: (context, state) {
              if (state is OtpSuccess) {
                return const SizedBox.shrink();
              } else {
                return GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Lottie.asset(
                                "assets/json/otp_verification.json"),
                          ),
                        ),
                        8.0.height,
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Verifikasi Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "Masukkan kode otp yang sudah dikirim ke : ",
                              children: [
                                TextSpan(
                                  text: widget.email,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        20.0.height,
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 30,
                            ),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              animationType: AnimationType.fade,
                              backgroundColor: Colors.white,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.underline,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  activeFillColor: Colors.white,
                                  inactiveFillColor: AppColors.primary500,
                                  inactiveColor: AppColors.primary500,
                                  selectedFillColor: Colors.white),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: false,
                              controller: _otpController,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                debugPrint("Completed : $v");
                                // if (formKey.currentState!.validate()) {
                                //   BlocProvider.of<OtpBloc>(context)
                                //       .add(VerifikasiOtpEvent(widget.email, v));
                                //   _otpController.text = "";
                                // }
                              },
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");

                                return true;
                              },
                            ),
                          ),
                        ),
                        20.0.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Tidak menerima kode otp? ",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<OtpBloc>(context)
                                    .add(SendOtpEvent(widget.email));
                                "OTP telah dikirim kembali!!"
                                    .succeedBar(context);
                              },
                              child: const Text(
                                "Kirim Ulang",
                                style: TextStyle(
                                  color: Color(0xFF91D3B3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        14.0.height,
                        Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30),
                            decoration: BoxDecoration(
                              color: AppColors.primary500,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ButtonTheme(
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  _formKey.currentState!.validate();
                                  BlocProvider.of<OtpBloc>(context)
                                      .add(VerifikasiOtpEvent(
                                    widget.email,
                                    currentText,
                                  ));
                                  setState(() {
                                    _otpController.text = "";
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    "VERIFIKASI".toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
