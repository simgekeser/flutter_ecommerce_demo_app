import 'dart:math';

import 'package:e_commerce_shop_app/models/product.dart';
import 'package:e_commerce_shop_app/providers/products_provider.dart';
import 'package:e_commerce_shop_app/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGridViewWidget extends StatelessWidget {
  const ProductsGridViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context, listen: true);
    List<Product> productsList = productsProvider.productsList;

    return productsList.isNotEmpty
        ? Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: GridView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: productsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                Product product = productsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen(product: product,)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          product.image != null ? Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: Image.network(
                              product.image,
                              fit: BoxFit.fill,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ) :
                          Container(),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                product.title != null ? product.title : ' ',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                product.title != null ?  product.price.toString() + "\$" : " ",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
