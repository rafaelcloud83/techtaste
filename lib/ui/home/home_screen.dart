import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/data/categories_data.dart';
import 'package:techtaste/data/restaurant_data.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/_core/widgets/appbar.dart';
import 'package:techtaste/ui/home/widgets/category_widget.dart';
import 'package:techtaste/ui/home/widgets/restaurant_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 192.0)),
              Text(
                'Boas vindas!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              TextFormField(),
              Text(
                'Escolha por categorias',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text('Bem avaliados'),
              Column(
                spacing: 16.0,
                children: List.generate(restaurantData.listRestaurants.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.listRestaurants[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
