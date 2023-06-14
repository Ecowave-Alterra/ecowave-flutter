import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/address/model/models/address_request.dart';
import 'package:ecowave/features/address/model/models/city_model.dart';
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
  void initState() {
    context
        .read<AddressBloc>()
        .add(GetCityEvent(provinceId: widget.addressModel.provinceId));
    provinceController.text = widget.addressModel.provinceName;
    cityController.text = widget.addressModel.cityName;
    nameController.text = widget.addressModel.recipient;
    phoneController.text = widget.addressModel.phoneNumber;
    addressController.text = widget.addressModel.address;
    noteController.text = widget.addressModel.note ?? "";
    super.initState();
  }

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

  bool get checkDataExists {
    return nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        provinceController.text.isNotEmpty &&
        cityController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = widget.addressModel.isPrimary;
    String? mark = widget.addressModel.mark;
    int currentIndexMark = -1;
    CityModel? cityModel;

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
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.primary / 2,
                    horizontal: AppSizes.primary),
                color: AppColors.grey50,
                child: const Text("Alamat"),
              ),
              16.0.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.primary),
                child: EcoFormDropdown(
                  label: "Cari Provinsi",
                  options: [provinceController.text],
                  initialValue: provinceController.text,
                  onChanged: null,
                ),
              ),
              16.0.height,
              BlocBuilder<AddressBloc, AddressState>(
                builder: (context, state) {
                  if (state is AddressSuccess) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.primary),
                      child: EcoFormDropdown(
                        label: "Cari Kota",
                        options: state.cities
                                ?.map((e) => e.cityName)
                                .toSet()
                                .toList() ??
                            [],
                        initialValue: cityController.text,
                        onChanged: (value) {
                          cityController.text = value!;
                          cityModel = state.cities!
                              .where((element) => element.cityName == value)
                              .first;

                          isExist.value = checkDataExists;
                        },
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              16.0.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.primary),
                child: EcoFormInput(
                  controller: addressController,
                  icon: const ImageIcon(AppIcons.alamat),
                  label: 'Alamat Lengkap',
                  hint: 'Alamat Lengkap',
                  keyboardType: TextInputType.streetAddress,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  onChanged: (value) => isExist.value = checkDataExists,
                ),
              ),
              16.0.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.primary),
                child: EcoFormInput(
                  controller: noteController,
                  icon: const ImageIcon(AppIcons.catatan),
                  label: 'Catatan untuk Kurir (Optional)',
                  hint: 'Catatan untuk Kurir (Optional)',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  onChanged: (value) => isExist.value = checkDataExists,
                ),
              ),
              16.0.height,
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.primary / 2,
                    horizontal: AppSizes.primary),
                color: AppColors.grey50,
                child: const Text("Kontak"),
              ),
              16.0.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.primary),
                child: EcoFormInput(
                  controller: nameController,
                  icon: const ImageIcon(AppIcons.name),
                  label: 'Nama Penerima',
                  hint: 'Nama Penerima',
                  keyboardType: TextInputType.name,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  onChanged: (value) => isExist.value = checkDataExists,
                ),
              ),
              16.0.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.primary),
                child: EcoFormInput(
                  controller: phoneController,
                  icon: const ImageIcon(AppIcons.numberPhone),
                  label: 'No Telepon',
                  hint: 'No Telepon',
                  keyboardType: TextInputType.phone,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  onChanged: (value) => isExist.value = checkDataExists,
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
              ),
              26.0.height,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.primary * 2),
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
                                  isExist.value = checkDataExists;
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
                                  isExist.value = checkDataExists;
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
                              isExist.value = checkDataExists;
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
                                provinceId: int.parse(cityModel?.provinceId ??
                                    widget.addressModel.provinceId.toString()),
                                provinceName: cityModel?.province ??
                                    widget.addressModel.provinceName,
                                cityId: int.parse(cityModel?.cityId ??
                                    widget.addressModel.cityId.toString()),
                                cityName: cityModel?.cityName ??
                                    widget.addressModel.cityName,
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
