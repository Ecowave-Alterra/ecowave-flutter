import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/view/widget/place_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressAddPage extends StatefulWidget {
  const AddressAddPage({super.key});

  @override
  State<AddressAddPage> createState() => _AddressAddPageState();
}

class _AddressAddPageState extends State<AddressAddPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final ValueNotifier<bool> isExist = ValueNotifier<bool>(false);

  bool isSwitched = false;
  int currentIndexMark = 0;

  @override
  void dispose() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    noteController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showConfirmation(
          title: "Keluar Halaman?",
          message: "Perubahan tidak tersimpan. Yakin ingin buang perubahan?",
          nameButtonConfirmation: "Keluar",
          nameButtonUnConfirmation: "Batal",
          colorButtonConfirmation: AppColors.error500,
          pressNavConfirmation: () {
            context.pop();
            context.pop();
          },
          context: context,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Alamat'),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              EcoFormInput(
                controller: nameController,
                icon: const ImageIcon(AppIcons.name),
                label: 'Nama Penerima',
                hint: 'Nama Penerima',
                keyboardType: TextInputType.name,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                onChanged: (value) {
                  if (value.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      addressController.text.isNotEmpty) {
                    isExist.value = true;
                  } else {
                    isExist.value = false;
                  }
                },
              ),
              16.0.height,
              EcoFormInput(
                controller: phoneController,
                icon: const ImageIcon(AppIcons.numberPhone),
                label: 'No Telepon',
                hint: 'No Telepon',
                keyboardType: TextInputType.phone,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                onChanged: (value) {
                  if (value.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      addressController.text.isNotEmpty) {
                    isExist.value = true;
                  } else {
                    isExist.value = false;
                  }
                },
                validator: (value) {
                  if (value!.length > 13) {
                    return "Nomor telepon tidak boleh lebih dari 13 digit";
                  } else if (value.isNotValidPhoneNumber()) {
                    return "Nomor telepon tidak valid";
                  } else {
                    return null;
                  }
                },
              ),
              16.0.height,
              EcoFormInput(
                controller: addressController,
                icon: const ImageIcon(AppIcons.alamat),
                label: 'Alamat Lengkap',
                hint: 'Alamat Lengkap',
                keyboardType: TextInputType.streetAddress,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                onChanged: (value) {
                  if (value.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      nameController.text.isNotEmpty) {
                    isExist.value = true;
                  } else {
                    isExist.value = false;
                  }
                },
              ),
              16.0.height,
              EcoFormInput(
                controller: noteController,
                icon: const ImageIcon(AppIcons.catatan),
                label: 'Catatan untuk Kurir (Optional)',
                hint: 'Catatan untuk Kurir (Optional)',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              26.0.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tandai Sebagai : ',
                          style: TextStyle(
                            color: AppColors.grey700,
                          ),
                        ),
                        StatefulBuilder(
                          builder: (context, changeState) => Row(
                            children: [
                              MyRadioListTile<int>(
                                value: 1,
                                groupValue: currentIndexMark,
                                onChanged: (index) {
                                  currentIndexMark = index!;
                                  changeState(() {});
                                },
                                leading: 'Rumah',
                              ),
                              12.0.width,
                              MyRadioListTile<int>(
                                value: 2,
                                groupValue: currentIndexMark,
                                onChanged: (index) {
                                  currentIndexMark = index!;
                                  changeState(() {});
                                },
                                leading: 'Kantor',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    38.5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Atur menjadi alamat utama',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: AppFontWeight.regular,
                            color: AppColors.grey700,
                          ),
                        ),
                        StatefulBuilder(
                          builder: (context, changeState) => CupertinoSwitch(
                            activeColor: AppColors.primary500,
                            value: isSwitched,
                            onChanged: (value) {
                              isSwitched = value;
                              changeState(() {});
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(AppSizes.primary),
          child: ValueListenableBuilder<bool>(
            valueListenable: isExist,
            builder: (context, value, _) => EcoFormButton(
              height: 45.0,
              label: "Simpan",
              onPressed: value
                  ? () {
                      if (formKey.currentState!.validate()) {
                        context.pop();
                        "Yey! Kamu berhasil menambahkan alamat"
                            .succeedBar(context);
                      }
                    }
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
