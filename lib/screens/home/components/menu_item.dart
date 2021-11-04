import 'package:badges/badges.dart';
import 'package:e_commerce_shop_app/providers/products_provider.dart';
import 'package:e_commerce_shop_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Function press;
  final IconData icon;

  const MenuItem({Key key, this.title, this.press, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context, listen: true);
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: title != null
            ? Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: kTextcolor.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                ),
              )
            : icon == Icons.shopping_cart_outlined &&
                    productsProvider.basketProductsList.length != 0
                ? GestureDetector(
                  onTap: (){
                  
                  },
                  child: Badge(
                      badgeContent: Text(
                          productsProvider.basketProductsList.length.toString(),style: TextStyle(color: Colors.white)),
                      child: Icon(
                        icon,
                        color: kTextcolor.withOpacity(0.8),
                      )),
                )
                : Icon(
                    icon,
                    color: kTextcolor.withOpacity(0.8),
                  ),
      ),
    );
  }
}
