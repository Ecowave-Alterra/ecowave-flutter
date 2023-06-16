import 'package:ecowave/features/information/model/models/information_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkService {
  late SharedPreferences _preferences;
  List<InformationModel> items = [];

  BookmarkService() {
    init();
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    items = _getItemsFromLocalStorage() ?? [];
  }

  List<InformationModel>? _getItemsFromLocalStorage() {
    final List<String>? itemStrings = _preferences.getStringList('bookmarks');
    if (itemStrings != null) {
      return itemStrings
          .map((itemString) => informationModelFromJson(itemString))
          .toList();
    }
    return null;
  }

  Future<void> saveToLocalStorage() async {
    await _preferences.setStringList(
      'bookmarks',
      items.map((item) => informationModelToJson(item)).toList(),
    );
    items = _getItemsFromLocalStorage() ?? [];
  }

  void addItem(InformationModel informationModel) {
    print(informationModel.id);
    items.add(informationModel);
    saveToLocalStorage();
  }

  void deleteItem(int id) {
    items.removeWhere(
      (element) => element.id == id,
    );
    saveToLocalStorage();
  }

  bool isBookmark(InformationModel informationModel) {
    if (items.indexWhere((element) => element.id == informationModel.id) ==
        -1) {
      print('false = ${items.map((e) => e.id).toList()}');
      return false;
    } else {
      return true;
    }
  }
}
