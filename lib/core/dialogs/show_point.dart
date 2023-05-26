part of 'package:ecowave/core.dart';

void showPoint(
    {String? message, int? nilaiPoint, required BuildContext context}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message ?? "Yey, kamu mendapatkan point",
                      style: const TextStyle(
                          fontSize: 28, fontWeight: AppFontWeight.semibold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "+${nilaiPoint ?? 5.toString()}",
                        style: const TextStyle(
                            fontSize: 28,
                            color: AppColors.primary600,
                            fontWeight: AppFontWeight.semibold),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary600),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Oke",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
