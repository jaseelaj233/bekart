import 'package:bekart/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';

class CartScreenProvider extends StatefulWidget {
  @override
  State<CartScreenProvider> createState() => _CartScreenProviderState();
}

class _CartScreenProviderState extends State<CartScreenProvider> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context); // Access CartModel

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        automaticallyImplyLeading: true,
      ),
      body: cart.cartitems.isEmpty
          ? Center(child: const Text('Your cart is empty'))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Order',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...cart.cartitems.map((item) => CartItem(
                          name: item.productname,
                          description: item.details,
                          price: double.parse(item.price),
                          onRemove: () {
                            cart.removeFromCart(
                                item); // Remove product from cart
                          },
                        )),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10),
                    SummaryRow(
                      label: 'Subtotal',
                      value: cart.totalPrice,
                    ),
                    const SummaryRow(label: 'Delivery Fee', value: 10.0),
                    const SummaryRow(label: 'Taxes', value: 1.25),
                    const Divider(thickness: 1),
                    SummaryRow(
                      label: 'Total',
                      value: cart.totalPrice + 10.0 + 1.25,
                      isTotal: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Payment(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Begin Checkout',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final VoidCallback onRemove; // Add callback for removing items

  const CartItem({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.onRemove, // Required remove function Add callback for removing items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '\$${price.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isTotal;

  const SummaryRow({
    Key? key,
    required this.label,
    required this.value,
    this.isTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey,
            ),
          ),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
