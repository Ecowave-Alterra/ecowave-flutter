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
    items.add(informationModel);
    saveToLocalStorage();
  }

  void deleteItem(String id) {
    items.removeWhere(
      (element) => element.informationId == id,
    );
    saveToLocalStorage();
  }

  bool isBookmark(InformationModel informationModel) {
    if (items.indexWhere((element) =>
            element.informationId == informationModel.informationId) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
