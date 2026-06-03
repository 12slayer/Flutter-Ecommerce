import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Shoe.dart';
import '../../models/cart.dart';
import '../components/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItemFromCart(BuildContext context, Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(shoe);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${shoe.name} removed from cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        final userCart = value.getUserCart();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Text(
                'My Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    Shoe individualShoe = userCart[index];

                    return CartItem(
                      shoe: individualShoe,
                      onDelete: () =>
                          removeItemFromCart(context, individualShoe),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
