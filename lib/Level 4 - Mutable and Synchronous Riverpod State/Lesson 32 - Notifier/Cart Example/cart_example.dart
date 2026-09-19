import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/product.dart';
import 'providers/cart_provider.dart';

class CartExample extends ConsumerWidget {
  const CartExample({super.key});
  @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final products = ref.watch(cartNotifierProvider);
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       title: const Text(
  //         'Cart Items',
  //       ),
  //       actions: [
  //         IconButton(
  //           icon: Icon(Icons.delete),
  //           onPressed: () {
  //             ref.read(cartNotifierProvider.notifier).clearCart();
  //           },
  //         ),
  //       ],
  //       actionsPadding: EdgeInsets.symmetric(
  //         horizontal: 16,
  //       ),
  //     ),
  //     body: products.isEmpty
  //         ? Center(
  //             child: Text('No product found!'),
  //           )
  //         : ListView.builder(
  //             itemCount: products.length,
  //             itemBuilder: (ctx, index) {
  //               final product = products[index];
  //               return Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 16,
  //                   vertical: 8,
  //                 ),
  //                 child: Card(
  //                   child: ListTile(
  //                     title: Text(product.name),
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         showModalBottomSheet(
  //           context: context,
  //           builder: (context) {
  //             return Container(
  //               width: double.infinity,
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(
  //                   horizontal: 24,
  //                   vertical: 16,
  //                 ),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   mainAxisAlignment: .start,
  //                   children: [
  //                     Expanded(
  //                       child: Row(
  //                         children: [
  //                           Expanded(
  //                             child: TextField(
  //                               decoration: InputDecoration(
  //                                 hint: Text(
  //                                   'Id',
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 16,
  //                           ),
  //                           Expanded(
  //                             child: TextField(
  //                               decoration: InputDecoration(
  //                                 hint: Text(
  //                                   'Price',
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: TextField(
  //                         decoration: InputDecoration(
  //                           hint: Text(
  //                             'Name',
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 16,
  //                     ),
  //                     SizedBox(
  //                       width: double.infinity,
  //                       height: 60,
  //                       child: AddProductButton(
  //                         product: Product(
  //                           id: 1,
  //                           name: 'p1',
  //                           price: 120,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartNotifierProvider);
    return Column(
      children: [
        Text('Items: ${cart.length}'),
        ElevatedButton(
          onPressed: () {
            const product = Product(
              id: 1,
              name: 'Keyboard',
              price: 50,
            );
            ref.read(cartNotifierProvider.notifier).addProduct(product);
          },
          child: const Text('Add product'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(cartNotifierProvider.notifier).removeProduct(1);
          },
          child: const Text('Remove product'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(cartNotifierProvider.notifier).clearCart();
          },
          child: const Text('Clear cart'),
        ),
      ],
    );
  }
}
