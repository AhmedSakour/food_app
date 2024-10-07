import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/Foods.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/widgets/showSnack.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/foodCategories.dart';
import '../models/user.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModel> Burgercategories = [];
  CategoriesModel? burgercategoriesModel;
  Future<void> getBurgerGategories() async {
    List<CategoriesModel> newBurgerCategories = [];
    try {
      QuerySnapshot querSnapShot = await FirebaseFirestore.instance
          .collection('categories')
          .doc('2iS2IbwiWMqNx5X8qjo5')
          .collection('burger')
          .get();

      querSnapShot.docs.forEach((element) {
        burgercategoriesModel = CategoriesModel(
            image: element.get('image'), name: element.get('name'));

        newBurgerCategories.add(burgercategoriesModel!);
        Burgercategories = newBurgerCategories;
      });
    } on Exception {}

    notifyListeners();
  }

  get throwListBurger {
    return Burgercategories;
  }

  List<CategoriesModel> Drinkcategories = [];
  CategoriesModel? drinkcategoriesModel;
  Future<void> getDrinkGategories() async {
    List<CategoriesModel> newDrinkCategories = [];
    try {
      QuerySnapshot querSnapShot = await FirebaseFirestore.instance
          .collection('categories')
          .doc('2iS2IbwiWMqNx5X8qjo5')
          .collection('Drink')
          .get();

      querSnapShot.docs.forEach((element) {
        drinkcategoriesModel = CategoriesModel(
            image: element.get('image'), name: element.get('name'));

        newDrinkCategories.add(drinkcategoriesModel!);
        Drinkcategories = newDrinkCategories;
      });
    } on Exception {}
    notifyListeners();
  }

  get throwListDrink {
    return Drinkcategories;
  }

  List<CategoriesModel> Rcipecategories = [];
  CategoriesModel? recipecategoriesModel;
  Future<void> getRecipeGategories() async {
    List<CategoriesModel> newRecipeCategories = [];
    try {
      QuerySnapshot querSnapShot = await FirebaseFirestore.instance
          .collection('categories')
          .doc('2iS2IbwiWMqNx5X8qjo5')
          .collection('Recipe')
          .get();

      querSnapShot.docs.forEach((element) {
        recipecategoriesModel = CategoriesModel(
            image: element.get('image'), name: element.get('name'));

        newRecipeCategories.add(recipecategoriesModel!);
        Rcipecategories = newRecipeCategories;
      });
    } on Exception {}
    notifyListeners();
  }

  get throwListRecipe {
    return Rcipecategories;
  }

  List<CategoriesModel> Pizzacategories = [];
  CategoriesModel? pizzacategoriesModel;

  Future<void> getPizzaGategories() async {
    List<CategoriesModel> newPizzaCategories = [];
    try {
      QuerySnapshot querSnapShot = await FirebaseFirestore.instance
          .collection('categories')
          .doc('2iS2IbwiWMqNx5X8qjo5')
          .collection('Pizza')
          .get();

      querSnapShot.docs.forEach((element) {
        pizzacategoriesModel = CategoriesModel(
            image: element.get('image'), name: element.get('name'));

        newPizzaCategories.add(pizzacategoriesModel!);
        Pizzacategories = newPizzaCategories;
      });
    } on Exception {}
    notifyListeners();
  }

  get throwListPizza {
    return Pizzacategories;
  }

  List<FoodModel> FoodList = [];
  FoodModel? foodModel;
  Future<void> getFoods() async {
    List<FoodModel> NewFoodList = [];
    try {
      QuerySnapshot querSnapShot =
          await FirebaseFirestore.instance.collection('Foods').get();
      querSnapShot.docs.forEach((element) {
        foodModel = FoodModel(
            image: element.get('image'),
            name: element.get('name'),
            price: element.get('price'));

        NewFoodList.add(foodModel!);
        FoodList = NewFoodList;
      });
    } on Exception {}
    notifyListeners();
  }

  get throwListFood {
    return FoodList;
  }

  List<FoodCategories> BurgerfoodCategoriesList = [];
  FoodCategories? burgerfoodCategories;
  Future<void> getBurgerFoodCategories() async {
    List<FoodCategories> newBurgerfoodCategoriesList = [];
    try {
      QuerySnapshot querSnapShot = await FirebaseFirestore.instance
          .collection('FoodCategories')
          .doc('NGW97j9bahheeZr2e3wR')
          .collection('Burger')
          .get();

      querSnapShot.docs.forEach((element) {
        burgerfoodCategories = FoodCategories(
            image: element.get('image'),
            name: element.get('name'),
            price: element.get('price'));
        newBurgerfoodCategoriesList.add(burgerfoodCategories!);
        BurgerfoodCategoriesList = newBurgerfoodCategoriesList;
      });
    } on Exception {}
    notifyListeners();
  }

  get throwBurgerFoodCategoriesList {
    return BurgerfoodCategoriesList;
  }

  List<FoodCategories> RecipefoodCategoriesList = [];
  FoodCategories? recipefoodCategories;
  Future<void> getRecipeFoodCategories() async {
    List<FoodCategories> newRecipefoodCategoriesList = [];
    try {
      QuerySnapshot querSnapShot = await FirebaseFirestore.instance
          .collection('FoodCategories')
          .doc('NGW97j9bahheeZr2e3wR')
          .collection('Recipe')
          .get();

      querSnapShot.docs.forEach((element) {
        recipefoodCategories = FoodCategories(
            image: element.get('image'),
            name: element.get('name'),
            price: element.get('price'));
        newRecipefoodCategoriesList.add(recipefoodCategories!);
        RecipefoodCategoriesList = newRecipefoodCategoriesList;
      });
    } on Exception {}
    notifyListeners();
  }

  get throwRecipeFoodCategoriesList {
    return RecipefoodCategoriesList;
  }

  List<FoodCategories> PizzafoodCategoriesList = [];
  FoodCategories? pizzafoodCategories;
  Future<void> getPizzaFoodCategories() async {
    List<FoodCategories> newPizzafoodCategoriesList = [];
    try {
      QuerySnapshot querSnapShot = await FirebaseFirestore.instance
          .collection('FoodCategories')
          .doc('NGW97j9bahheeZr2e3wR')
          .collection('Pizza')
          .get();

      querSnapShot.docs.forEach((element) {
        pizzafoodCategories = FoodCategories(
            image: element.get('image'),
            name: element.get('name'),
            price: element.get('price'));
        newPizzafoodCategoriesList.add(pizzafoodCategories!);
        PizzafoodCategoriesList = newPizzafoodCategoriesList;
      });
    } on Exception {}
    notifyListeners();
  }

  get throwPizzaFoodCategoriesList {
    return PizzafoodCategoriesList;
  }

  List<FoodCategories> DrinkfoodCategoriesList = [];
  FoodCategories? drinkfoodCategories;
  Future<void> getDrinkFoodCategories() async {
    List<FoodCategories> newDrinkfoodCategoriesList = [];
    try {
      QuerySnapshot querSnapShot = await FirebaseFirestore.instance
          .collection('FoodCategories')
          .doc('NGW97j9bahheeZr2e3wR')
          .collection('Drink')
          .get();

      querSnapShot.docs.forEach((element) {
        drinkfoodCategories = FoodCategories(
            image: element.get('image'),
            name: element.get('name'),
            price: element.get('price'));
        newDrinkfoodCategoriesList.add(drinkfoodCategories!);
        DrinkfoodCategoriesList = newDrinkfoodCategoriesList;
      });
    } on Exception {}
    notifyListeners();
  }

  get throwDrinkFoodCategoriesList {
    return DrinkfoodCategoriesList;
  }

  Future<void> addToCart(
    CartModel cart,
  ) async {
    var box = Hive.box<String>('user');
    String? id = await box.get('id');
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('cart')
          .doc()
          .set({
        'image': cart.image,
        'id': cart.id,
        'name': cart.name,
        'price': cart.price,
        'totalPrice': cart.totalPrice,
        'quantity': cart.quantity
      });

      notifyListeners();
    } on Exception {}
  }

  Future<List<CartModel>> getCart() async {
    List<CartModel> carts = [];
    var box = Hive.box<String>('user');
    String? id = await box.get('id');

    try {
      var cartlist = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('cart')
          .get();
      cartlist.docs.forEach((element) {
        carts.add(CartModel(
            id: element.get('id'),
            image: element.get('image'),
            name: element.get('name'),
            price: element.get('price'),
            totalPrice: element.get('totalPrice'),
            quantity: element.get('quantity')));
      });
    } on Exception {}

    return carts;
  }

  Future<double> calculateTotalCartPrice() async {
    List<String> totalListString = [];
    var box = Hive.box<String>('user');
    String? id = await box.get('id');
    double total = 0;

    try {
      var cartlist = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('cart')
          .get();
      cartlist.docs.forEach((element) {
        totalListString.add(element.get('totalPrice'));
      });

      for (int i = 0; i < totalListString.length; i++) {
        total += double.parse(totalListString[i]);
      }
    } on Exception {}
    return total;
  }

  Future<void> deleteItemCart(
    String idItem,
  ) async {
    var box = Hive.box<String>('user');
    String? id = await box.get('id');
    try {
      var cartList = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('cart')
          .get();
      cartList.docs.forEach((element) {
        if (element.get('id') == idItem) {
          element.reference.delete();
        }
      });
    } on Exception {}
    notifyListeners();
  }

  Future<void> addUser({
    required String id,
    required UserData user,
  }) async {
    try {
      var users = await FirebaseFirestore.instance.collection('users');
      await users.doc(id).set({
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'password': user.password,
      });
    } on Exception {}
    notifyListeners();
  }

  Future<UserData> getUserData({
    required String id,
  }) async {
    var users =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    UserData userData = await UserData(
        id: users.get('id'),
        name: users.get('name'),
        email: users.get('email'),
        password: users.get('password'));
    return userData;
  }

  Future<void> updatePasswordInFireStore(
    String id,
    String passowrd,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(id).update({
        'password': passowrd,
      });
    } on Exception {}

    notifyListeners();
  }

  Future<void> updatePassword(
    String password,
  ) async {
    FirebaseAuth auht = FirebaseAuth.instance;
    User? user = auht.currentUser;
    var box = Hive.box<String>('user');
    String? id = await box.get('id');

    if (user != null) {
      try {
        await user.updatePassword(password);
        await updatePasswordInFireStore(
          id!,
          password,
        );
      } on Exception {}
    }
  }
}
