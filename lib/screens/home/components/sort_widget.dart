import 'package:e_commerce_shop_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortWidget extends StatefulWidget {
  @override
  State<SortWidget> createState() => _SortWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SortWidgetState extends State<SortWidget> {
  String dropdownValue = 'Sort By';

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context, listen: true);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[100]),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
          ),
        ],
      ),
      child: new DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              productsProvider.sortList(dropdownValue);
            });
          },
          items: <String>['Sort By', 'Ascending', 'Decreasing', 'Top Rated']
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
