import 'package:ecowave/features/address/model/address_user_model.dart';

class UserList {
  List<AddressUser> users = [];

  // Method untuk menambahkan kontak baru
  void addData(AddressUser user) {
    users.add(user);
  }

  // // Method untuk mengupdate kontak
  // void updateContact(Contact updatedContact) {
  //   int index = contacts.indexWhere((contact) => contact.id == updatedContact.id);
  //   if (index != -1) {
  //     contacts[index] = updatedContact;
  //   }
  // }

  // // Method untuk menghapus kontak
  // void deleteContact(int id) {
  //   contacts.removeWhere((contact) => contact.id == id);
  // }
}
