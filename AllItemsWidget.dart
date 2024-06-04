import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllItemsWidget extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'name': 'Rolex Datejust black', 'subTitle': ' Watch For Men', 'price': '50', 'image': '1.png'},
    {'name': 'Rolex Datejust Wimbledon', 'subTitle': 'Watch For Women', 'price': '75', 'image': '2.png'},
    {'name': 'Rolex Datejust green', 'subTitle': ' Watch For Men', 'price': '60', 'image': '3.png'},
    {'name': 'Rolex Oyster Perpetual bleu', 'subTitle': 'Watch For Women', 'price': '80', 'image': '4.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items.map((item) {
        return Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFF5F9FD),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF475269).withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "itemPage",
                      arguments: {
                        'name': item['name']!,
                        'subTitle': item['subTitle']!,
                        'price': item['price']!,
                        'image': item['image']!,
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      "images/${item['image']}",
                      height: 130,
                      width: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF475269),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item['subTitle']!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF475269).withOpacity(0.7),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${item['price']}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFF475269),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          CupertinoIcons.cart_fill_badge_plus,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
