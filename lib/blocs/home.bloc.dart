import 'package:flutter/widgets.dart';
import 'package:card/models/category.list.item.model.dart';
import 'package:card/models/estabilishment.model.dart';
import 'package:card/models/cities.model.dart';
import 'package:card/repositories/category.repository.dart';
import 'package:card/repositories/estabilishment.repository.dart';
import 'package:card/repositories/cities.repository.dart';

class HomeBloc extends ChangeNotifier {
  final estabilishmentRepository = new EstabilishmentRepository();
  final categoryRepository = new CategoryRepository();
  final citiesRepository = new CitiesRepository();

  List<EstabilishmentModel> estabilishment;
  List<CategoryListItemModel> categories;
  List<CitiesModel> cities;
  String selectedCategory = 'todos';
  String selectedCity = 'todos';

  HomeBloc() {
    getCities();
    getCategories();
    getEstabilishment();
  }

  getCities() {
    citiesRepository.getAll().then((data) {
      this.cities = data;
      notifyListeners();
    });
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getEstabilishment() {
    estabilishmentRepository.getAll().then((data) {
      this.estabilishment = data;
      notifyListeners();
    });
  }

  getEstabilishmentByCategory() {
    estabilishmentRepository
        .getByCategory(selectedCategory, selectedCity)
        .then((data) {
      this.estabilishment = data;
      notifyListeners();
    });
  }

  getCategoryByCity() {
    categoryRepository.getByCity(selectedCategory).then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  changeCategoryByCity(customAssetIdCity) {
    selectedCategory = customAssetIdCity.toString();
    categories = null;
    getCategoryByCity();
    notifyListeners();
  }

  changeCategory(city, category) {
    selectedCategory = category.toString();
    selectedCity = city.toString();
    estabilishment = null;
    getEstabilishmentByCategory();
    notifyListeners();
  }
}
