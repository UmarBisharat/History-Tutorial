// 📝 Notes

// FurnitureModel.dart
//        ↓
// Creates the FurnitureModel class.
//
// FurnitureCategory.dart
//         ↓
// Creates FurnitureModel objects, displays them, and sends the selected object.
//
// EachFurniture.dart
//         ↓
// Receives the selected FurnitureModel object and shows its details.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'each_furniture_screen.dart';
import 'package:furniture_shop/Models/furniture_category_model.dart';
import 'package:furniture_shop/UI/home_screen.dart';
import 'package:furniture_shop/Utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureCategory extends StatefulWidget {
  const FurnitureCategory({super.key});

  @override
  State<FurnitureCategory> createState() => _FurnitureCategoryState();
}

class _FurnitureCategoryState extends State<FurnitureCategory> {
  List<FurnitureCategoryModel> furnitureList = [];

  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    addFurniture();
  }

  void addFurniture() {
    furnitureList.addAll([
      FurnitureCategoryModel(
        id: "1",
        imagePath: "assets/images/kBedroomImage.jpg",
        title: "Luxury Bedroom",
        description:
            "Experience premium comfort with this luxury bedroom set.\n"
            "Crafted from high-quality wood with an elegant finish.\n"
            "Designed to provide durability, style, and functionality.\n"
            "Perfect for modern interiors and everyday use.\n"
            "A great choice for a warm and sophisticated bedroom.",
        price: "\$2000",
        reviews: "154 Reviews",
        colors: [Colors.brown.value],
        categories: ["Bedroom"],
        tags: ["Luxury"],

        similarImage1: "assets/images/kLuxuryBedroomImage.jpg",
        similarTitle1: "Luxury Bedroom",
        similarPrice1: "\$2500",

        similarImage2: "assets/images/kMasterBedroomImage.jpg",
        similarTitle2: "Master Bedroom",
        similarPrice2: "\$3000",
      ),

      FurnitureCategoryModel(
        id: "2",
        imagePath: "assets/images/kMasterBedroomImage.jpg",
        title: "Master Bedroom",
        description:
            "Elegant master bedroom furniture with a modern and luxurious design.",
        price: "\$2000",
        reviews: "248 Reviews",
        colors: [Colors.brown.value],
        categories: ["Bedroom"],
        tags: ["Luxury"],

        similarImage1: "assets/images/kLuxuryBedroomImage.jpg",
        similarTitle1: "Luxury Bedroom",
        similarPrice1: "\$2500",

        similarImage2: "assets/images/kBedroomImage.jpg",
        similarTitle2: "Classic Bedroom",
        similarPrice2: "\$1800",
      ),

      FurnitureCategoryModel(
        id: "3",
        imagePath: "assets/images/kAramChairImage.jpg",
        title: "Modern Arm Chair",
        description:
            "A comfortable and stylish arm chair with a soft cushion and sturdy wooden frame, perfect for your living room.",
        price: "\$650",
        reviews: "185 Reviews",
        colors: [Colors.brown.value, Colors.grey.value],
        categories: ["Chair"],
        tags: ["Modern"],

        similarImage1: "assets/images/kLuxurySofa.jpg",
        similarTitle1: "Luxury Sofa",
        similarPrice1: "\$1500",

        similarImage2: "assets/images/kSofaImage.jpg",
        similarTitle2: "Modern Sofa",
        similarPrice2: "\$1200",
      ),
      FurnitureCategoryModel(
        id: "4",
        imagePath: "assets/images/kLuxurySofa.jpg",
        title: "Luxury Sofa",
        description:
            "A premium luxury sofa with soft cushions, elegant fabric, and a modern design that adds comfort and style to your living room.",
        price: "\$1500",
        reviews: "312 Reviews",
        colors: [Colors.grey.value, Colors.blueGrey.value],
        categories: ["Sofa"],
        tags: ["Premium"],

        similarImage1: "assets/images/kSofaImage.jpg",
        similarTitle1: "Modern Sofa",
        similarPrice1: "\$1200",

        similarImage2: "assets/images/kAramChairImage.jpg",
        similarTitle2: "Modern Arm Chair",
        similarPrice2: "\$650",
      )]);
  }
  // _furnitureCard() needs 2 parameters:
  // 1. BuildContext context → Used for navigation (Navigator.push).
  // 2. FurnitureModel furniture → Contains the data (image, title, price) of the current furniture card.
  InkWell _furnitureCard(BuildContext context, FurnitureCategoryModel furniture) {
    return InkWell(
      onTap: () {
        Get.off(EachFurniture(furniture: furniture));
            // EachFurniture(...) → Create and open the EachFurniture screen.
            // furniture: furniture → Pass the selected furniture object to the new screen.
             // the left side furniture is from each_furniture because we made it required and left furniture is what we are passing from our this furniture_category_screen.dart
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              furniture.imagePath,
              height: 160,
              width: 170,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 8),

          Text(
            furniture.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 5),

          Text(
            furniture.price,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.off(HomeScreen());
      },
      child: Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          backgroundColor: kBackground,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.off(HomeScreen());
            },
          ),
          title: Text(
            "Furniture Categories",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          actions: const [Icon(Icons.more_vert), SizedBox(width: 5)],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _categories(
                      text: "All",
                      isSelected: selectedCategory == 0,
                      onPress: () {
                        setState(() {
                          selectedCategory = 0;
                        });
                      },
                    ),
                    _categories(
                      text: "Sofa",
                      isSelected: selectedCategory == 1,
                      onPress: () {
                        setState(() {
                          selectedCategory = 1;
                        });
                      },
                    ),
                    _categories(
                      text: "Ceiling",
                      isSelected: selectedCategory == 2,
                      onPress: () {
                        setState(() {
                          selectedCategory = 2;
                        });
                      },
                    ),
                    _categories(
                      text: "Table Lamp",
                      isSelected: selectedCategory == 3,
                      onPress: () {
                        setState(() {
                          selectedCategory = 3;
                        });
                      },
                    ),

                    _categories(
                      text: "Floor",
                      isSelected: selectedCategory == 3,
                      onPress: () {
                        setState(() {
                          selectedCategory = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: GridView.builder(
                  itemCount: furnitureList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: .75,
                  ),
                  itemBuilder: (context, index) {
                    return _furnitureCard(context, furnitureList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//*************************** Categories ********************************************
Widget _categories({
  required String text,
  required VoidCallback onPress,
  required bool isSelected,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
