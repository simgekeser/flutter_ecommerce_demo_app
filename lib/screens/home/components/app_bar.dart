import 'package:e_commerce_shop_app/screens/home/components/appbar_categories.dart';
import 'package:e_commerce_shop_app/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'menu_item.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Constants.isDesktop
            ? Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -2),
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.16),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo.png",
                      height: 25,
                      alignment: Alignment.topCenter,
                    ),
                    Spacer(),
                    AppBarCategories(),
                    Spacer(),
                    MenuItem(
                      icon: Icons.search,
                      press: () {},
                    ),
                    MenuItem(
                      icon: Icons.favorite_border,
                      press: () {},
                    ),
                    MenuItem(
                      icon: Icons.shopping_cart_outlined,
                      press: () {},
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -2),
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.16),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo.png",
                      height: 25,
                      alignment: Alignment.topCenter,
                    ),
                    Spacer(),
                    MenuItem(
                      icon: Icons.search,
                      press: () {},
                    ),
                    MenuItem(
                      icon: Icons.favorite_border,
                      press: () {},
                    ),
                    MenuItem(
                      icon: Icons.shopping_cart_outlined,
                      press: () {},
                    ),
                  ],
                ),
              );
      },
    );
  }
}
