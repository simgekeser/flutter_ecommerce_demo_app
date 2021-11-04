import 'package:flutter/material.dart';

import 'menu_item.dart';

class AppBarCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuItem(
          title: "Home",
          press: () {},
        ),
        MenuItem(
          title: "Products",
          press: () {},
        ),
        MenuItem(
          title: "Service",
          press: () {},
        ),
        MenuItem(
          title: "Contact",
          press: () {},
        ),
      ],
    );
  }
}
