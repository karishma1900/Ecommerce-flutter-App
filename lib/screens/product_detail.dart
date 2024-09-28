import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({required this.product, Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  Text(product.title,
                  style: const TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20,
                    color: Colors.green),

                  ),
                  const SizedBox(height: 16),
                  Text(product.description,
                  style: const TextStyle(fontSize: 16),),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){
                      // logic to add item in cart
                      Provider.of<CartProvider>(context, listen: false).addToCart(product);
                        // Optionally navigate to the cart after adding
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen())
                        );
                    },
                    
                    child: const Text('Add to Cart'),
                    )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}