import 'package:fahasa_app/components/button.dart';
import 'package:fahasa_app/components/call_to_action.dart';
import 'package:flutter/material.dart';

import '../api/product.dart';
import '../components/product_image.dart';
import '../models/product.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> productList = getAllProduct();
    const hasOrder = true;

    return hasOrder
        ? DefaultTabController(
            length: 5,
            child: Scaffold(
                appBar: AppBar(
                  bottom: PreferredSize(
                    child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        indicatorColor: Colors.white,
                        tabs: const [
                          Tab(child: Text('Pending')),
                          Tab(child: Text('On going')),
                          Tab(child: Text('Success')),
                          Tab(child: Text('Canceled')),
                          Tab(child: Text('Received')),
                        ]),
                    preferredSize: const Size.fromHeight(0),
                  ),
                ),
                body: Container(
                  color: const Color(0xFFEFEFEF),
                  child: TabBarView(
                    children: [
                      ListView(
                        children: [
                          ...productList
                              .map(
                                (item) => _OrderItem(
                                  imageSrc: item.image,
                                  name: item.name,
                                  price: item.price,
                                  quantity: 2,
                                  status: 'pending',
                                  button: FaButton(
                                    label: 'Cancel',
                                    width: 72,
                                    height: 35,
                                    onPressed: () {},
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                      ListView(
                        children: [
                          ...productList
                              .map((item) => _OrderItem(
                                    imageSrc: item.image,
                                    name: item.name,
                                    price: item.price,
                                    quantity: 2,
                                    status: 'on going',
                                  ))
                              .toList(),
                        ],
                      ),
                      ListView(
                        children: [
                          ...productList
                              .map((item) => _OrderItem(
                                    imageSrc: item.image,
                                    name: item.name,
                                    price: item.price,
                                    quantity: 2,
                                    status: 'success',
                                    button: FaButton(
                                      label: 'Review',
                                      width: 72,
                                      height: 35,
                                      onPressed: () {},
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                      ListView(
                        children: [
                          ...productList
                              .map((item) => _OrderItem(
                                    imageSrc: item.image,
                                    name: item.name,
                                    price: item.price,
                                    quantity: 2,
                                    status: 'canceled',
                                    button: FaButton(
                                      label: 'Re-order',
                                      width: 72,
                                      height: 35,
                                      onPressed: () {},
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                      ListView(
                        children: [
                          ...productList
                              .map((item) => _OrderItem(
                                    imageSrc: item.image,
                                    name: item.name,
                                    price: item.price,
                                    quantity: 2,
                                    status: 'received',
                                  ))
                              .toList(),
                        ],
                      ),
                    ],
                  ),
                )),
          )
        : CallToAction(
            message: 'There are no order!',
            button: CTAButton(
              label: 'Go shopping now',
              onPressed: () {},
            ),
          );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    Key? key,
    required this.imageSrc,
    required this.name,
    required this.price,
    required this.status,
    required this.quantity,
    this.button,
  }) : super(key: key);

  final String imageSrc;
  final String name;
  final double price;
  final String status;
  final int quantity;
  final FaButton? button;

  @override
  Widget build(BuildContext context) {
    final image = Padding(
      padding: const EdgeInsets.only(right: 13),
      child: ProductImage(src: imageSrc, width: 60),
    );

    final bookName = Text(
      name,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    final bookPrice = Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
        const Text(
          '\$20.000',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
          ),
        )
      ],
    );

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Session(
            child: Row(
              children: [
                image,
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        bookName,
                        bookPrice,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _Session(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total quantity: $quantity'),
                Text('Total: ${price * quantity}d'),
              ],
            ),
          ),
          if (button != null) ...[
            _Session(
              child: _OrderStatus(status: status),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: button,
              ),
            ),
          ] else
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: _OrderStatus(status: status),
            ),
        ],
      ),
    );
  }
}

class _Session extends StatelessWidget {
  const _Session({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFEFEFEF),
          ),
        ),
      ),
      child: child,
    );
  }
}

class _OrderStatus extends StatelessWidget {
  const _OrderStatus({Key? key, required this.status}) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFF00965F);

    switch (status) {
      case 'pending':
        color = const Color(0xFFFF9F84);
        break;
      case 'on going':
        color = const Color(0xFF009CA4);
        break;
      case 'canceled':
        color = Theme.of(context).primaryColor;
    }

    return Text(
      'Status: $status',
      style: TextStyle(color: color),
    );
  }
}
