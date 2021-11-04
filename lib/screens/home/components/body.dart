import 'package:e_commerce_shop_app/providers/products_provider.dart';
import 'package:e_commerce_shop_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categories_widget.dart';
import 'products_gridView_widget.dart';
import 'search_and_image_body_widget.dart';

class Body extends StatelessWidget {
  final BoxConstraints constraints;

  const Body({Key key, this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context, listen: true);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SearchAndImageBodyWidget(constraints: constraints),
            CategoriesWidget(),
            ProductsGridViewWidget(),
            FittedBox(
              // Now it just take the required spaces
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF372930),
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF372930),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      productsProvider.productsList[0].title==null? " " : productsProvider.productsList[0].title.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
