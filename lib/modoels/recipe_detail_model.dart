class RecipeDetailModel {
  final int id;
  final String name;
  final int countUserStar;
  final String urlImageThumbnail;
  final String urlImageDetail;
  final String description;
  final List<String> countries;
  final List<String> mealType;
  final List<String> ingredients;
  final List<String> nutritions;
  final int calories;
  final double rating;

  RecipeDetailModel({
    required this.id,
    required this.name,
    required this.countUserStar,
    required this.urlImageThumbnail,
    required this.urlImageDetail,
    required this.description,
    required this.countries,
    required this.mealType,
    required this.ingredients,
    required this.nutritions,
    required this.calories,
    required this.rating
  });

  static List<RecipeDetailModel> recipes = [
    RecipeDetailModel(
      id: 1, 
      name: 'Pesto Pasta', 
      countUserStar: 29, 
      urlImageThumbnail: "assets/images/pesto_pasta.png", 
      urlImageDetail: "assets/images/pesto_pasta_detail.png", 
      description: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.", 
      countries: ['Italian', 'Indonesian'], 
      mealType: ['Lunch', 'Breakfast'], 
      ingredients: ['100g spaghetti', '1 pinch of salt'], 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 150, 
      rating: 4
    ),
    RecipeDetailModel(
      id: 2, 
      name: 'Lobster Bisque', 
      countUserStar: 36, 
      urlImageThumbnail: "assets/images/lobster_bisque.png", 
      urlImageDetail: "assets/images/lobster_bisque.png", 
      description: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.", 
      countries: ['Malaysian', 'Indonesian'], 
      mealType: ['Dinner'], 
      ingredients: ['100g spaghetti', '1 pinch of salt'], 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 200, 
      rating: 4
    ),
    RecipeDetailModel(
      id: 3, 
      name: 'Veggie Pizza', 
      countUserStar: 29, 
      urlImageThumbnail: "assets/images/veggie_pizza.png", 
      urlImageDetail: "assets/images/veggie_pizza.png", 
      description: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.", 
      countries: ['UK', 'Indonesian'], 
      mealType: ['Lunch', 'Dinner', 'Brunch', 'Breakfast'], 
      ingredients: ['100g spaghetti', '1 pinch of salt'], 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 300, 
      rating: 4
    ),
    RecipeDetailModel(
      id: 4, 
      name: 'Chocolate Muffin', 
      countUserStar: 26, 
      urlImageThumbnail: "assets/images/chocolate_muffin.png", 
      urlImageDetail: "assets/images/chocolate_muffin.png", 
      description: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.", 
      countries: ['American', 'Indonesian'], 
      mealType: ['Breakfast'], 
      ingredients: ['100g spaghetti', '1 pinch of salt'], 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 250, 
      rating: 4
    ),
    RecipeDetailModel(
      id: 5, 
      name: 'Capresse Salad', 
      countUserStar: 29, 
      urlImageThumbnail: "assets/images/caprese_salad.png", 
      urlImageDetail: "assets/images/caprese_salad.png", 
      description: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.", 
      countries: ['Sweden', 'Indonesian'], 
      mealType: ['Lunch', 'Dinner'], 
      ingredients: ['100g spaghetti', '1 pinch of salt'], 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 50, 
      rating: 4
    ),
    RecipeDetailModel(
      id: 6, 
      name: 'Pomodoro Pasta', 
      countUserStar: 39, 
      urlImageThumbnail: "assets/images/pesto_pasta_detail.png", 
      urlImageDetail: "assets/images/pesto_pasta_detail.png", 
      description: "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.", 
      countries: ['French', 'Indonesian'], 
      mealType: ['Lunch'], 
      ingredients: ['100g spaghetti', '1 pinch of salt'], 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 100, 
      rating: 4
    ),
  ];
}