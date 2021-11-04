import 'package:e_commerce_shop_app/models/product.dart';
import 'package:e_commerce_shop_app/providers/products_provider.dart';
import 'package:e_commerce_shop_app/screens/home/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  DetailScreen({Key key, this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context, listen: false);
    return Center(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              CustomAppBar(),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                      child: Container(
                        height: 500,
                    padding: EdgeInsets.all(20),
                        child: Center(
                          child: Image.network(widget.product.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                  )),
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex:2,
                                        child: Text(widget.product.title,
                                          style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Text(widget.product.price.toString()+" \$",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(widget.product.rating.rate.toString()+" "),
                                    SmoothStarRating(
                                      rating: widget.product.rating.rate,
                                      isReadOnly: true,
                                      size: 20,
                                      borderColor: Colors.black,
                                      color: Colors.black,
                                    ),
                                    Text("("+widget.product.rating.count.toString()+")")
                                  ],
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text(widget.product.description,style: TextStyle(color: Colors.grey),),
                                ),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: TextButton(
                                        onPressed: (){
                                          productsProvider.setBasketProductsList(widget.product);
                                        },
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                                        child: Text("Add to basket",
                                          style: TextStyle(color: Colors.white),),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton.icon(
                                          style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                                          onPressed: (){

                                          },
                                          icon: Icon(Icons.favorite_border,color: Colors.white,), label: Text(""),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
