import 'package:ecowave/features/address/model/address_user_model.dart';
import 'package:ecowave/features/address/view/pages/address_page.dart';
import 'package:ecowave/features/address/view/widget/form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../core.dart';
import '../widget/place_button_widget.dart';

class AddressAddPage extends StatefulWidget {
  const AddressAddPage({super.key});

  @override
  State<AddressAddPage> createState() => _AddressAddPageState();
}

class _AddressAddPageState extends State<AddressAddPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool status = false;
  int value = 0;
  int _index = 0;
  List users = <AddressUser>[];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Alamat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: AppFontWeight.regular,
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grey300,
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FormFieldAddress(
                  nameController: nameController,
                  icon: AppIcons.name,
                  label: 'Nama Penerima',
                  keyboardType: TextInputType.name,
                ),
                16.0.height,
                FormFieldAddress(
                  nameController: telpController,
                  icon: AppIcons.numberPhone,
                  label: 'No Telepon',
                  keyboardType: TextInputType.phone,
                ),
                16.0.height,
                FormFieldAddress(
                  nameController: addressController,
                  icon: AppIcons.alamat,
                  label: 'Alamat Lengkap',
                  keyboardType: TextInputType.streetAddress,
                ),
                16.0.height,
                FormFieldAddress(
                  nameController: notesController,
                  icon: AppIcons.catatan,
                  label: 'Catatan untuk Kurir (Optional)',
                  keyboardType: TextInputType.none,
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
                          Row(
                            children: [
                              MyRadioListTile<int>(
                                value: 1,
                                groupValue: _index,
                                onChanged: (index) =>
                                    setState(() => _index = index!),
                                leading: 'Rumah',
                              ),
                              12.0.width,
                              MyRadioListTile<int>(
                                value: 2,
                                groupValue: _index,
                                onChanged: (index) =>
                                    setState(() => _index = index!),
                                leading: 'Kantor',
                              ),
                            ],
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
                          FlutterSwitch(
                            width: 51,
                            height: 31,
                            activeColor: AppColors.primary500,
                            inactiveColor: const Color(0xffD9D9D9),
                            value: status,
                            onToggle: (value) {
                              setState(() {
                                status = value;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                100.0.height,
                EcoFormButton(
                  label: 'Simpan',
                  backgroundColor: AppColors.primary300,
                  onPressed: () {
                    setState(() {
                      users.add(
                        AddressUser(
                          name: nameController.text,
                          telp: telpController.text,
                          address: addressController.text,
                          place: (_index == 1) ? 'Rumah' : 'Kantor',
                          notes: notesController.text,
                        ),
                      );
                      context.push(
                        AddressPage(
                          listUser: users,
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
