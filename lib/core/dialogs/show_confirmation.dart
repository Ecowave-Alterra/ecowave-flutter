part of 'package:ecowave/core.dart';

void showConfirmation(
    {required String title,
    required String message,
    required String? nameButtonConfirmation,
    required Color? colorButtonConfirmation,
    required void Function() pressNavConfirmation,
    required BuildContext context}) async {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: AppFontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: Text(
                        message,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: AppFontWeight.regular),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      color: AppColors.grey300)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Batal",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorButtonConfirmation ??
                                      AppColors.error500),
                              onPressed: pressNavConfirmation,
                              child: Text(
                                nameButtonConfirmation ?? "keluar",
                                style: const TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
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
