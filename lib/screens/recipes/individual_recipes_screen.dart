import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/modoels/recipe_detail_model.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/styles/path/image_path.dart';
import 'package:freshy_food/styles/text_styles.dart';
import 'package:freshy_food/widgets/app_bar_green.dart';

class IndividualRecipesScreen extends StatefulWidget {
  const IndividualRecipesScreen({super.key, required this.id});
  final int id;

  @override
  State<IndividualRecipesScreen> createState() => _IndividualRecipesScreenState();
}

class _IndividualRecipesScreenState extends State<IndividualRecipesScreen> {
  final FocusNode focusNode = FocusNode();
  int _counter = 1;
  bool _isChecked = false;

  late RecipeDetailModel recipe;
  String nutritionsText = '';
  String recipeName = '';
  String countriesText = '';
  String mealTypesText = '';
  
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      if(_counter > 1){
        _counter--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    recipe = RecipeDetailModel.recipes.firstWhere((r) => r.id == widget.id);

    nutritionsText = recipe.nutritions.join(', ');
    countriesText = recipe.countries.join(', ');
    mealTypesText = recipe.mealType.join(', ');

    if(nutritionsText.length > 20){
      nutritionsText = '${nutritionsText.substring(0, 20)}...';
    }

    if(recipe.name.length > 20){
      recipeName = '${recipe.name.substring(0, 20)}...';
    }
  }

  @override
  void dispose(){
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthForBottomButton = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarGreen(linkBack: (context) => Navigator.pop(context), 
        linkRight: (){}, 
        focusNode: focusNode,
        isCart: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32,),
                Center(child: Image(image: AssetImage(recipe.urlImageDetail), height: 334,)),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(recipe.name, style: TextStyles.titleStyle1,),
                        const SizedBox(width: 9,),
                        SizedBox(
                          height: 26,
                          child: Image.asset(ImagePath.shrimp, width: 16,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: Image.asset("assets/images/other_icons/upload.png", height: 24,)
                        ),
                        const SizedBox(width: 25.8,),
                        GestureDetector(
                          onTap: (){},
                          child: Image.asset("assets/images/other_icons/love.png", height: 24,)
                        ),
                      ],
                    ),
                  ],
                ), 
                const SizedBox(height: 22,),
                Row(
                  children: [
                    Wrap(
                      spacing: 3,
                      children: [
                        Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange,),
                        Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange,),
                        Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange,),
                        Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange,),
                        Icon(FluentSystemIcons.ic_fluent_star_filled, color: CustomColors.lightOrange,),
                      ],
                    ),
                    const SizedBox(width: 8,),
                    Text("(${recipe.countUserStar})", style: TextStyle(fontSize: 16, color: CustomColors.primaryGrey),)
                  ],
                ),
                const SizedBox(height: 32,),
                Text(recipe.description, style: TextStyles.descriptionStyle1),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Wrap(
                      spacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset(ImagePath.knifeFork, height: 23,),
                        Text(mealTypesText, style: TextStyles.descriptionStyle1,),
                      ],
                    ),
                    const SizedBox(width: 8,),
                    Wrap(
                      spacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset(ImagePath.globe, height: 23,),
                        Text(countriesText, style: TextStyles.descriptionStyle1,),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Servings", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, color: CustomColors.primaryGrey,)),
                    const SizedBox(width: 16,),
                    Wrap(
                      spacing: 16,
                      children: [
                        GestureDetector(
                          onTap: _decrementCounter,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: CustomColors.lightGrey, width: 1),
                            ),
                            child: Icon(Icons.remove, size: 24, color: CustomColors.lightGrey,),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                          child: Center(child: Text("$_counter", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, color: CustomColors.primaryGrey,),)),
                        ),
                        GestureDetector(
                          onTap: _incrementCounter,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: CustomColors.lightGrey, width: 1),
                            ),
                            child: Icon(Icons.add, size: 24, color: CustomColors.lightGrey,),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: CustomColors.primaryGreen,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: CustomColors.primaryGreen, width: 1),
                      ),
                      child: Text("Ingredients", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, color: Colors.white),),
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: CustomColors.primaryGrey, width: 1),
                      ),
                      child: Text("Nutritions", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, color: CustomColors.primaryGrey),),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start  ,
                  children: [
                    for(var ingredient in recipe.ingredients)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 30,
                            child: Checkbox(
                              value: _isChecked, 
                              onChanged: (bool? newValue){
                                setState(() {
                                  _isChecked = newValue!;
                                });
                              },
                              activeColor: CustomColors.primaryGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: _isChecked ? CustomColors.primaryGreen : CustomColors.cardGrey
                                )
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8), 
                            child: Text(ingredient, style: TextStyles.descriptionStyle1,)),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 64,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.primaryGreen)
                ),
                width: widthForBottomButton,
                child: Center(
                  child: Text("Add to trolley", 
                  style: TextStyle(fontSize: 20, color: CustomColors.primaryGreen),)
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: CustomColors.primaryGreen,
                  border: Border.all(color: CustomColors.primaryGreen)
                ),
                width: widthForBottomButton,
                child: Center(
                  child: Text("Order now", 
                  style: TextStyle(fontSize: 20, color: Colors.white),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}