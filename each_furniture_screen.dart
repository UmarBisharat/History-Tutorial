import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/furniture_category_model.dart';
import '../Utils/utils.dart';
import '../Widgets/buttons.dart';
import 'furniture_category_screen.dart';

class EachFurniture extends StatefulWidget {
  final FurnitureCategoryModel furniture;

  const EachFurniture({
    super.key,
    required this.furniture, // in this whole file the info which fits for each category will come from furniture_category
  });

  @override
  State<EachFurniture> createState() => _EachFurnitureState();
}

class _EachFurnitureState extends State<EachFurniture> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Get.off(() => const FurnitureCategory());
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.furniture.imagePath,
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),

                  SafeArea(
                    child: Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        padding: EdgeInsets.only(left: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 2,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        widget.furniture.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.furniture.price,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Divider(endIndent: 155),
                      Text(
                        "Colors",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown,
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo,
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kBackground,
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(endIndent: 155),
                      Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.furniture.description, style: TextStyle()),
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: "Categories           :           ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: widget.furniture.categories.join(", "),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "Tags                      :           ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: widget.furniture.tags.join(", "),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(endIndent: 0),
                      Text(
                        "Reviews",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(widget.furniture.reviews, style: TextStyle()),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              text: "4.8",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "  out of 5.0",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(endIndent: 0,
                        thickness: 1,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Similar Products",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    widget.furniture.similarImage1,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  widget.furniture.similarTitle1,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  widget.furniture.similarPrice1,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    widget.furniture.similarImage2,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  widget.furniture.similarTitle2,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  widget.furniture.similarPrice2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Text("01"),
                                Spacer(),
                                Icon(Icons.unfold_more),
                              ],
                            ),
                          ),
                          SizedBox(width: 11),
                          SizedBox(
                            width: 200,
                            child: Button(text: "Add to Cart"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
