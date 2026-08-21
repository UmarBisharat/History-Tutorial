import 'package:flutter/material.dart';
import 'package:furniture_shop/UI/trending_items_screen.dart';
import 'package:furniture_shop/UI/furniture_category_screen.dart';
import 'package:furniture_shop/UI/log_in_screen.dart';
import 'package:furniture_shop/UI/search_screen.dart';
import 'package:furniture_shop/Utils/utils.dart';
import 'package:get/get.dart';

import '../Models/trending_item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TrendingItemModel> trendingModel = [];
  int isIndex = 0;

  @override
  void initState() {
    trendingModels();
    super.initState();
  }

  void trendingModels() { // creating objects of the TrendingModel class by calling its constructor.
    trendingModel.addAll([
      TrendingItemModel(
        imagePath: "assets/images/kAramChairImage.jpg",
        price: "\$2200",
        id: "1",
        title: "Aram Chair",
      ),
      TrendingItemModel(
        imagePath: "assets/images/kTvLaunchImage.jpg",
        price: "\$3200",
        id: "2",
        title: "TV Launch",
      ),
      TrendingItemModel(
        imagePath: "assets/images/kSofaImage.jpg",
        price: "\$1000",
        id: "3",
        title: "Sofa",
      ),

      TrendingItemModel(
        imagePath: "assets/images/kOfficeFurnitureImage.jpg",
        price: "\$4000",
        id: "4",
        title: "Office Furniture",
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.off(LogInScreen());
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: kBackground,
          title: Text(
            "Discover",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.off(SearchScreen());
              },
              icon: Icon(Icons.shopping_cart, size: 30, color: Colors.black),
            ),
          ],
        ),
        backgroundColor: kBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/kSofaImage.jpg',
                    height: 200,
                    width: 350,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 8),

              _twoText(
                first: "Categories",
                second: "VIEW ALL",
                onPress: () {
                 Get.off(FurnitureCategory());
                },
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _trendingBox(
                      title: "Bed",
                      icon: Icons.bed,
                      isSelected: isIndex == 0,
                      onTap: () {
                        setState(() {
                          isIndex = 0;
                        });
                      },
                    ),
                    _trendingBox(
                      title: "Table",
                      icon: Icons.table_bar,
                      isSelected: isIndex == 1,
                      onTap: () {
                        setState(() {
                          isIndex = 1;
                        });
                      },
                    ),
                    _trendingBox(
                      title: "Chair",
                      icon: Icons.chair,
                      isSelected: isIndex == 2,
                      onTap: () {
                        setState(() {
                          isIndex = 2;
                        });
                      },
                    ),
                    _trendingBox(
                      title: "Art",
                      icon: Icons.panorama,
                      isSelected: isIndex == 3,
                      onTap: () {
                        setState(() {
                          isIndex = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),

              _twoText(
                first: "Trending",
                second: "VIEW ALL",
                onPress: () {
                  Get.off(TrendingItems());
                },
              ),

// Create a TrendingModel variable (tm), get each object from the trendingModel list one by one, and pass its data to _trendingCard().
              for (TrendingItemModel tm in trendingModel)
                _trendingCard(
                  imagePath: tm.imagePath,
                  title: tm.title,
                  subtitle: tm.price.toString(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  //////////////////////////////////////////////// 1st Cards ///////////////////////////////////////
  Widget _trendingCard({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        SizedBox(height: 22),
        ListTile(
          leading: Image.asset(
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            imagePath,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          trailing: Container(
            height: 25,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.black,
            ),
            child: Center(
              child: Text(
                "SHOP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Divider(color: Colors.black26, height: 18, indent: 135, endIndent: 30),
      ],
    );
  }
}

////////////////////////////////////////////// 2nd Card /////////////////////////////////////

Widget _trendingBox({
  required String title,
  required IconData icon,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 100,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isSelected ? Colors.black : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 45,
                    decoration: BoxDecoration(
                      color: kBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon),
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? kBackground : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

////////////////////////////// 2 text ///////////////////////////
Widget _twoText({
  required String first,
  required String second,
  required VoidCallback onPress,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      children: [
        Text(
          first,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Spacer(),
        TextButton(
          onPressed: onPress,
          child: Text(
            second,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  );
}
