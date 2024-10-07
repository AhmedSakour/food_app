import 'package:flutter/material.dart';
import 'package:food_app/provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/categories.dart';
import '../models/foodCategories.dart';
import 'package:provider/provider.dart';
import '../widgets/food_item_hor.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/grid_view_items.dart';
import 'Categories.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<FoodCategories> burgerCatList = [];

  List<CategoriesModel> burgerList = [];

  Widget Burger(context) {
    return Row(
      children: burgerList
          .map((e) => FoodItemHor(
                name: e.name,
                m: e.image,
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => Categories(
                                list: burgerCatList,
                              ))));
                },
              ))
          .toList(),
    );
  }

  List<FoodCategories> DrinkCatList = [];

  List<CategoriesModel> DrinkList = [];

  Widget Drink(context) {
    return Row(
      children: DrinkList.map((e) => FoodItemHor(
            name: e.name,
            m: e.image,
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Categories(
                            list: DrinkCatList,
                          ))));
            },
          )).toList(),
    );
  }

  List<FoodCategories> RecipeCatList = [];

  List<CategoriesModel> RecipeList = [];

  Widget Recipe(context) {
    return Row(
      children: RecipeList.map((e) => FoodItemHor(
            name: e.name,
            m: e.image,
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Categories(
                            list: RecipeCatList,
                          ))));
            },
          )).toList(),
    );
  }

  List<FoodCategories> PizzaCatList = [];

  List<CategoriesModel> PizzaList = [];

  Widget Pizza(context) {
    return Row(
      children: PizzaList.map((e) => FoodItemHor(
            name: e.name,
            m: e.image,
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Categories(
                            list: PizzaCatList,
                          ))));
            },
          )).toList(),
    );
  }

  String? name;
  getUserName() async {
    name = await Hive.box<String>('user').get('name');

    setState(() {});
    return name;
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    provider.getBurgerGategories();
    burgerList = provider.throwListBurger;

    provider.getDrinkGategories();
    DrinkList = provider.throwListDrink;

    provider.getRecipeGategories();
    RecipeList = provider.throwListRecipe;

    provider.getPizzaGategories();
    PizzaList = provider.throwListPizza;

    provider.getBurgerFoodCategories();
    burgerCatList = provider.throwBurgerFoodCategoriesList;

    provider.getRecipeFoodCategories();
    RecipeCatList = provider.throwRecipeFoodCategoriesList;

    provider.getPizzaFoodCategories();
    PizzaCatList = provider.throwPizzaFoodCategoriesList;

    provider.getDrinkFoodCategories();
    DrinkCatList = provider.throwDrinkFoodCategoriesList;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 241, 238, 238),
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 238, 238),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: Text('Hi, $name',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 23,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[350]),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Search')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 29),
                child: Row(
                  children: [
                    Burger(context),
                    SizedBox(
                      width: 10,
                    ),
                    Drink(context),
                    SizedBox(
                      width: 10,
                    ),
                    Recipe(context),
                    SizedBox(
                      width: 10,
                    ),
                    Pizza(context),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GridViewFoodItems()
            ],
          ),
        ),
      ),
    );
  }
}
