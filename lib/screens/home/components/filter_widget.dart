import 'package:e_commerce_shop_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatefulWidget {
  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FilterWidgetState extends State<FilterWidget> {
  String filterDropdownValue = 'See All';

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
          ),
        ],
      ),
      child: new DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: filterDropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (String newValue) {
            setState(() {
              filterDropdownValue = newValue;
              filterDropdownValue == 'See All'
                  ? productsProvider.getAllProducts()
                  : productsProvider.getCategoryProducts(
                      filterDropdownValue.substring(0, 4).toLowerCase());
            });
          },
          items: <String>['See All', 'Clothes', 'Electronics', 'Jewelery']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
