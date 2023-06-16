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
    final List<String>? itemStrings = _preferences.getStringList('items');
    if (itemStrings != null) {
      return itemStrings
          .map((itemString) => informationModelFromJson(itemString))
          .toList();
    }
    return null;
  }

  Future<void> saveToLocalStorage() async {
    await _preferences.setStringList(
      'items',
      items.map((item) => informationModelToJson(item)).toList(),
    );
    items = _getItemsFromLocalStorage() ?? [];
  }

  void addItem(InformationModel informationModel) {
    items.add(informationModel);
    saveToLocalStorage();
  }

  void deleteItem(int id) {
    items.removeWhere(
      (element) => element.id == id,
    );
    saveToLocalStorage();
  }
}
