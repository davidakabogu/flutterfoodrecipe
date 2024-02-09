import 'package:flutter/material.dart';
import 'package:foodrecipe/widgets/appbarbuttons.dart';
import 'package:foodrecipe/widgets/chefinfo.dart';
import 'package:foodrecipe/widgets/imagesection.dart';
import 'package:foodrecipe/widgets/ingredients.dart';
import 'package:foodrecipe/widgets/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        actions: const [
          ButtonSection(),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              HowToSection(meal: 'french toast'),
              ImageSection(
                image: 'assets/images/image-13.png',
                overlayImage: 'assets/images/Play-button.png',
              ),
              ChefInfoSection(
                name: 'Roberta Anny',
                location: 'Bali, Indonesia',
                image: 'assets/images/unsplash_Ij24Uq1sMwM.png',
              ),
              IngredientsSection(
                ingredients: [
                  'Bread',
                  'Eggs',
                  'Milk',
                  'Strawberries',
                  'Whipped Cream'
                ],
                ingredientWeights: ['200g', '200g', '200g', '300g', '50g'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
