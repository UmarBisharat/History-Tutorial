import 'package:flutter/material.dart';
import 'package:furniture_shop/UI/home_screen.dart';
import 'package:furniture_shop/Utils/utils.dart';
import 'package:get/get.dart';

import '../Controllers/search_controller.dart';


class SearchScreen extends GetView<SearchScreenController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchScreenController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.off(HomeScreen());
        }, icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: kBackground,
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      backgroundColor: kBackground,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.searchTFController,
                    decoration: InputDecoration(
                      hintText: "Search Categories",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 11),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 33),
                ),
                SizedBox(width: 11),
              ],
            ),
            Wrap(
              children: [
                _options(text: "Bar Stools"),
                _options(text: "Kitchen & Dining Chairs"),
                _options(text: "Living Room Futures"),
                _options(text: "Folding Chairs"),
                _options(text: "Refining Sections"),
                _options(text: "Garden Chairs"),
                _options(text: "Starting Chairs"),
                _options(text: "Office Furniture"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _options({required String text}) {
  return Container(
    padding: EdgeInsets.all(6),
    margin: EdgeInsets.only(right: 8,top: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.grey),
      color: kBackground,
    ),
    child: Text(text),
  );
}
