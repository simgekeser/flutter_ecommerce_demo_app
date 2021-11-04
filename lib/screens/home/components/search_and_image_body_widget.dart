import 'package:e_commerce_shop_app/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'search_bar.dart';

class SearchAndImageBodyWidget extends StatelessWidget {
  const SearchAndImageBodyWidget({
    Key key,
    this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: constraints.maxHeight / 1.5,
          width: constraints.maxWidth,
          color: Colors.grey[100],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Discover the latest fashion, shoes and accessory trends",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: kTextcolor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Flexible(flex: 1, child: SearchBar())
                  ],
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Image.asset(
                "assets/images/fashion.png",
                fit: BoxFit.cover,
              ),
            ],
          ),
        ));
  }
}
