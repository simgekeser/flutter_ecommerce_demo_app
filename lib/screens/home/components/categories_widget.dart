import 'package:e_commerce_shop_app/screens/home/components/sort_widget.dart';
import 'package:flutter/material.dart';
import 'filter_widget.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({
    Key key,
  }) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white70,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [FilterWidget(), SortWidget()],
        ));
  }
}

// Container(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Column(
// children: [
// CategoryItem(
// press: () {
// productsProvider.getCategoryProducts("clothing");
// setState(() {});
// },
// title: "Clothes"),
// ],
// ),
// SizedBox(width: 10),
// Column(
// children: [
// CategoryItem(
// press: () {
// setState(() {});
// productsProvider.getCategoryProducts("electronic");
// },
// title: "Electronics"),
// ],
// ),
// SizedBox(width: 10),
// Column(
// children: [
// CategoryItem(
// press: () {
// setState(() {});
// productsProvider.getCategoryProducts("jewelery");
// },
// title: "Jewelery"),
// ],
// ),
// SizedBox(width: 10),
// Column(
// children: [
// CategoryItem(
// press: () {
// setState(() {});
// productsProvider.getAllProducts();
// },
// title: "See All"),
// ],
// ),
// ],
// ),
// ),
// )
