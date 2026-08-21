import 'package:flutter/material.dart';
import 'package:furniture_shop/Models/trending_item_model.dart';
import 'package:furniture_shop/UI/home_screen.dart';
import 'package:furniture_shop/Utils/utils.dart';
import 'package:get/get.dart';

class TrendingItems extends StatefulWidget {
  const TrendingItems({super.key});

  @override
  State<TrendingItems> createState() => _TrendingItemsState();
}

class _TrendingItemsState extends State<TrendingItems> {
  List<TrendingItemModel> categories = [];

  @override
  void initState() {
    fetchCategories();
    super.initState();
  }

  void fetchCategories() {
    categories.addAll([
      TrendingItemModel(
        id: '1',
        title: 'Aram Chair',
        price: "\$200",
        imagePath: kAramChairImage,
      ),
      TrendingItemModel(
        id: '2',
        title: 'Master bed',
        price: "\$500",
        imagePath: kBedroomImage,
      ),
      TrendingItemModel(
        id: '3',
        title: 'Side table',
        price: "\$900",
        imagePath: kBedSideTableImage,
      ),
      TrendingItemModel(
        id: '4',
        title: 'Dressing',
        price: "\$2000",
        imagePath: kDressingImage,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
           Get.off(HomeScreen());
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: kBackground,
        centerTitle: true,
        title: Text(
          "Trending Items",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (TrendingItemModel cat in categories)
              _categories(
                image: cat.imagePath,
                text: cat.title,
                price: cat.price,
              ),
          ],
        ),
      ),
    );
  }
}

Widget _categories({
  required String image,
  required String text,
  required String price,
}) {
  return Column(
    children: [
      SizedBox(height: 10),
      Center(
        child: Container(
          width: 360,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 10, right: 2),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                height: 100,
                width: 70,
                fit: BoxFit.fill,
                image,
              ),
            ),
            title: Text(text),
            subtitle: Text(price.toString()),
            trailing: Icon(Icons.navigate_next_outlined),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
