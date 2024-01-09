import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriterMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriterMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
    //state = [];
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriterMealsNotifier, List<Meal>>((ref) {
  return FavoriterMealsNotifier();
});
