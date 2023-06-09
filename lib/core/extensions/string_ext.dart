part of 'package:ecowave/core.dart';

extension DialogExt on String {
  void succeedBar(BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      icon: Container(
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: const Icon(Icons.check, color: AppColors.primary600)),
      backgroundColor: AppColors.primary600,
      shouldIconPulse: false,
      message: this,
      duration: const Duration(seconds: 3),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          )),
      borderRadius: BorderRadius.circular(50),
    ).show(context);
  }

  void failedBar(BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      icon: Container(
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: const Icon(Icons.close, color: AppColors.error500)),
      backgroundColor: AppColors.error500,
      shouldIconPulse: false,
      message: this,
      duration: const Duration(seconds: 3),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: IconButton(
          onPressed: () {
            FlushbarDismissDirection.HORIZONTAL;
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          )),
      borderRadius: BorderRadius.circular(50),
    ).show(context);
  }
}

extension ValidationExt on String {
  bool isValidEmail() {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return !emailRegex.hasMatch(this);
  }

  bool isValidPhoneNumber() {
    final RegExp phoneRegex = RegExp(
      r'^62\d{9,12}$',
    );
    return !phoneRegex.hasMatch(this);
  }
}
