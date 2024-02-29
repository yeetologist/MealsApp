import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(this.onToggleFavorite, this.availableMeals,
      {super.key});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: availableMeals
              .where(
                (meals) => meals.categories.contains(category.id),
              )
              .toList(),
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      // children: availableCategories
      //     .map(
      //       (e) => CategoryGridItem(e),
      //     )
      //     .toList(),
      children: [
        for (var category in availableCategories)
          CategoryGridItem(
            category,
            () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
