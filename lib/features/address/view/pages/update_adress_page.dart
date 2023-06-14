import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/address/model/models/address_request.dart';
import 'package:ecowave/features/address/view/widget/place_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAddressPage extends StatefulWidget {
  final AddressModel addressModel;

  const UpdateAddressPage({
    super.key,
    required this.addressModel,
  });

  @override
  State<UpdateAddressPage> createState() => _UpdateAddressPageState();
}

class _UpdateAddressPageState extends State<UpdateAddressPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final ValueNotifier<bool> isExist = ValueNotifier<bool>(false);

  @override
  void dispose() {
    provinceController.dispose();
    cityController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.addressModel.recipient;
    phoneController.text = widget.addressModel.phoneNumber;
    addressController.text = widget.addressModel.address;
    noteController.text = widget.addressModel.note ?? "";
    bool isSwitched = widget.addressModel.isPrimary;
    String? mark = widget.addressModel.mark;
    int currentIndexMark = -1;

    if (mark == "Rumah") {
      currentIndexMark = 0;
    } else if (mark == "Kantor") {
      currentIndexMark = 1;
    }

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
          title: const Text('Ubah Alamat'),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              EcoFormDropdown(
                hint: "Cari Provinsi",
                options: const ["options 1", "options 2"],
                onChanged: (value) {
                  provinceController.text = value!;
                  if (nameController.text.isNotEmpty &&
                      addressController.text.isNotEmpty &&
                      provinceController.text.isNotEmpty &&
                      cityController.text.isNotEmpty) {
                    isExist.value = true;
                  } else {
                    isExist.value = false;
                  }
                },
              ),
              16.0.height,
              EcoFormDropdown(
                hint: "Cari Kota",
                options: const ["options 1", "options 2"],
                onChanged: (value) {
                  cityController.text = value!;
                  if (nameController.text.isNotEmpty &&
                      addressController.text.isNotEmpty &&
                      provinceController.text.isNotEmpty &&
                      cityController.text.isNotEmpty) {
                    isExist.value = true;
                  } else {
                    isExist.value = false;
                  }
                },
              ),
              16.0.height,
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
                      addressController.text.isNotEmpty &&
                      provinceController.text.isNotEmpty &&
                      cityController.text.isNotEmpty) {
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
                      addressController.text.isNotEmpty &&
                      provinceController.text.isNotEmpty &&
                      cityController.text.isNotEmpty) {
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
                      nameController.text.isNotEmpty &&
                      provinceController.text.isNotEmpty &&
                      cityController.text.isNotEmpty) {
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
                onChanged: (value) {
                  if (nameController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      addressController.text.isNotEmpty &&
                      provinceController.text.isNotEmpty &&
                      cityController.text.isNotEmpty) {
                    isExist.value = true;
                  } else {
                    isExist.value = false;
                  }
                },
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
                                value: 0,
                                groupValue: currentIndexMark,
                                onChanged: (index) {
                                  if (nameController.text.isNotEmpty &&
                                      phoneController.text.isNotEmpty &&
                                      addressController.text.isNotEmpty &&
                                      provinceController.text.isNotEmpty &&
                                      cityController.text.isNotEmpty) {
                                    isExist.value = true;
                                  } else {
                                    isExist.value = false;
                                  }
                                  currentIndexMark = index!;
                                  changeState(() {});
                                },
                                leading: 'Rumah',
                              ),
                              12.0.width,
                              MyRadioListTile<int>(
                                value: 1,
                                groupValue: currentIndexMark,
                                onChanged: (index) {
                                  if (nameController.text.isNotEmpty &&
                                      phoneController.text.isNotEmpty &&
                                      addressController.text.isNotEmpty &&
                                      provinceController.text.isNotEmpty &&
                                      cityController.text.isNotEmpty) {
                                    isExist.value = true;
                                  } else {
                                    isExist.value = false;
                                  }
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
                              if (nameController.text.isNotEmpty &&
                                  phoneController.text.isNotEmpty &&
                                  addressController.text.isNotEmpty &&
                                  provinceController.text.isNotEmpty &&
                                  cityController.text.isNotEmpty) {
                                isExist.value = true;
                              } else {
                                isExist.value = false;
                              }
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
                      if (currentIndexMark == 0) {
                        mark = "Rumah";
                      } else if (currentIndexMark == 1) {
                        mark = "Kantor";
                      }

                      if (formKey.currentState!.validate()) {
                        context.read<AddressBloc>().add(UpdateAddressesEvent(
                              id: widget.addressModel.id,
                              request: AddressRequest(
                                recipient: nameController.text,
                                phoneNumber: phoneController.text,
                                provinceId: 1,
                                provinceName: "",
                                cityId: 1,
                                cityName: "",
                                address: addressController.text,
                                note: noteController.text,
                                mark: mark,
                                isPrimary: isSwitched,
                              ),
                            ));
                        context.pop();
                        "Yey! Kamu berhasil memperbarui alamat"
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
