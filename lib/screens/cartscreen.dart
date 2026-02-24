import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cartprovider.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),

      body: Column(
        children: [
          /// ---------------- CART LIST ----------------
          Expanded(
            child: cart.items.isEmpty
                ? const Center(
                    child: Text(
                      "Cart is empty 🛒",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      final product = item.product;

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: Image.network(
                            product.image,
                            width: 50,
                            fit: BoxFit.contain,
                          ),

                          title: Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          subtitle: Text(
                            "₹${product.price} x ${item.quantity}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          trailing: SizedBox(
                            width: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₹${item.totalprice.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                GestureDetector(
                                  onTap: () {
                                    cart.removeItem(product);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          /// ---------------- BILL PANEL ----------------
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "₹${cart.totalprice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Checkout coming soon")),
                      );
                    },
                    child: const Text("Proceed to Checkout"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
