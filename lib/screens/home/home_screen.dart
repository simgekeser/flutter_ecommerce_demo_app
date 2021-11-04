import 'package:e_commerce_shop_app/providers/products_provider.dart';
import 'package:e_commerce_shop_app/utilities/constants.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'components/app_bar.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            Constants.isDesktop = constraints.maxWidth > 700 ? true : false;
            return EnhancedFutureBuilder(
              rememberFutureResult: true,
              whenNotDone: Container(),
              future: productsProvider.fetchProducts(),
              whenDone: (snapshotData) {
                return Container(
                  height: constraints.biggest.height,
                  width: constraints.biggest.width, // it will take full width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomAppBar(),
                      Expanded(
                          child: Body(
                              constraints:
                                  constraints)), // It will cover 1/3 of free spaces
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
