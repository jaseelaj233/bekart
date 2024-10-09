import 'package:bekart/1_cafeView/cartProviderModel/producCartUsingProvider.dart';
import 'package:bekart/1_cafeView/homepageinal2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/shopaddmodal.dart';
import 'cart_model.dart';

class ProductPreviewProvider extends StatelessWidget {
  final Shopaddmodal detailedProduct;

  const ProductPreviewProvider({
    Key? key,
    required this.detailedProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context); // Access CartModel

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bekart',
          style: const TextStyle(
            fontSize: 26,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreenProvider()));
            },
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 300,
            child: detailedProduct.productimage.isNotEmpty
                ? Image.network(
                    detailedProduct.productimage,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.broken_image, size: 100),
          ),
          const SizedBox(height: 16),
          Text(
            detailedProduct.productname,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            detailedProduct.details,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  cart.addToCart(detailedProduct); // Add product to cart

                  // Show a SnackBar message when product is added
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('${detailedProduct.productname} added to cart'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text("Add to Cart"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CartScreenProvider(),
                  ));
                  // Handle Buy Now action
                },
                child: const Text("Buy Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
