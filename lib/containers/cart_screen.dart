import 'package:fahasa_app/components/button.dart';
import 'package:fahasa_app/components/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../api/product.dart';
import '../components//call_to_action.dart';
import '../constants/globals.dart';
import '../models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<ProductModel> productList = getAllProduct();

  @override
  Widget build(BuildContext context) {
    const hasItems = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            const Text('Select All'),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: 'Total: ',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: '200.000d',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              flex: 3,
              child: FaButton(
                label: 'Continue',
                height: 50,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: hasItems
          ? ListView(children: [
              ...productList
                  .map((item) => _CartItem(
                        src: item.image,
                        name: item.name,
                        price: item.price,
                        author: item.authorName,
                        onRemove: (buildContext) => {
                          setState(() {
                            productList.remove(item);
                          })
                        },
                      ))
                  .toList()
            ])
          : CallToAction(
              message: 'There are nothing in your cart!',
              button: CTAButton(
                label: 'Go shopping now',
                onPressed: () {
                  Navigator.pushNamed(context, toMainScreen);
                },
              )),
    );
  }
}

class _CartItem extends StatelessWidget {
  const _CartItem({
    Key? key,
    required this.src,
    required this.name,
    required this.price,
    required this.author,
    this.onRemove,
  }) : super(key: key);

  final String src;
  final String name;
  final String author;
  final double price;
  final Function(BuildContext)? onRemove;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onRemove,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: ProductImage(src: src, width: 60),
            ),
            SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    author,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          '${price}d',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColor,
                        ),
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(5),
                      ),
                      const Text('\$15.00',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
