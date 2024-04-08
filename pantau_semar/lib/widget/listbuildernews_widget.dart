import 'package:flutter/material.dart';

class ListBuilderNews extends StatelessWidget {
  final List<dynamic> itemList;
  final Function onTap;
  ListBuilderNews({super.key, required this.itemList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final item = itemList[index];
        return Column(
          children: [
            InkWell(
              onTap: () {
                onTap(item);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red, // You can change color here
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      child: Image.network(
                        item.urlImage, // Assuming there's a property named urlImage in your item model
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.judul, // Assuming there's a property named judul in your item model
                            style: TextStyle(
                              color: Colors
                                  .black, // You can customize text style here
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            item.tanggal, // Assuming there's a property named tanggal in your item model
                            style: TextStyle(
                              color: Colors
                                  .black, // You can customize text style here
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}