import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: cart.cartItems.isEmpty
          ? Center(
              child: Text(
                'No items in cart',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            )
          : ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cart.cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      cartItem.product.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$${cartItem.product.price.toStringAsFixed(2)} x ${cartItem.quantity}',
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.red),
                          onPressed: () {
                            cart.removeFromCart(cartItem.product);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(cartItem.quantity.toString(), style: TextStyle(fontSize: 20),),
                        ), // Show current quantity
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.green),
                          onPressed: () {
                            cart.addToCart(cartItem.product); // Re-add to increase quantity
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.teal,
        child: Text(
          'Total: \$${cart.totalAmount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
