class RecipeOverviewModel {
  final int id;
  final String name;
  final int countUserStar;
  final String urlImageThumbnail;
  final String description;
  final List<String> nutritions;
  final int calories;
  final double rating;

  RecipeOverviewModel({
    required this.id,
    required this.name,
    required this.countUserStar,
    required this.urlImageThumbnail,
    required this.description,
    required this.nutritions,
    required this.calories,
    required this.rating
  });

  static List<RecipeOverviewModel> recipes = [
    RecipeOverviewModel(
      id: 1, 
      name: 'Pesto Pasta', 
      countUserStar: 29, 
      urlImageThumbnail: "assets/images/pesto_pasta.png", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 150, 
      rating: 4
    ),
    RecipeOverviewModel(
      id: 2, 
      name: 'Lobster Bisque', 
      countUserStar: 36, 
      urlImageThumbnail: "assets/images/lobster_bisque.png", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 200, 
      rating: 4
    ),
    RecipeOverviewModel(
      id: 3, 
      name: 'Veggie Pizza', 
      countUserStar: 29, 
      urlImageThumbnail: "assets/images/veggie_pizza.png", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 300, 
      rating: 4
    ),
    RecipeOverviewModel(
      id: 4, 
      name: 'Chocolate Muffin', 
      countUserStar: 26, 
      urlImageThumbnail: "assets/images/chocolate_muffin.png", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 250, 
      rating: 4
    ),
    RecipeOverviewModel(
      id: 5, 
      name: 'Capresse Salad', 
      countUserStar: 29, 
      urlImageThumbnail: "assets/images/caprese_salad.png", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 50, 
      rating: 4
    ),
    RecipeOverviewModel(
      id: 6, 
      name: 'Pomodoro Pasta', 
      countUserStar: 39, 
      urlImageThumbnail: "assets/images/pesto_pasta_detail.png", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
      nutritions: ['Fat', 'Protein', 'Vitamin A', 'Fiber'], 
      calories: 100, 
      rating: 4
    ),
  ];
}