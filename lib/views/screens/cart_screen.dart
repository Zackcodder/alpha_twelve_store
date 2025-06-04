import 'package:alpha_twelve_store/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/textStyle.dart';
import '../../core/models/products_model.dart';
import '../../viewmodels/cart_provider.dart';
import '../../viewmodels/products_provider.dart';
import '../widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();
    final productVM = context.read<ProductViewModel>();

    final cartItems =
        cart.cart.entries.map((entry) {
          final product = productVM.getProductById(entry.key);
          final quantity = entry.value;
          return {'product': product, 'quantity': quantity};
        }).toList();

    final subtotal = cartItems.fold<double>(0, (total, item) {
      final product = item['product'] as Product?;
      final quantity = item['quantity'] as int?;
      if (product == null || quantity == null) return total;
      return total + product.price * quantity;
    });
    const shipping = 10.0;
    final total = subtotal + shipping;

    return Scaffold(
      backgroundColor: kcWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kcWhite,
        leading: SizedBox(),
        title: Column(
          spacing: 10,
          children: [
            const Text(
              ksDeliveryAddress,
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'IBM Plex Sans',
                fontWeight: FontWeight.w600,
                color: kcGrey,
              ),
            ),
            const Text(
              ksAddress,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'IBM Plex Sans',
                fontWeight: FontWeight.w600,
                color: kcGrey,
              ),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(
            'assets/svgs/notificationIcon.svg',
            height: 24,
            width: 24,
            color: kcBlack, // optional
          ),
          SizedBox(width: 30),
        ],
      ),
      body: Column(
        children: [
          ///diver line
          Divider(color: kcGrey.withOpacity(0.3), thickness: 1.0, endIndent: 0),

          ///go back
          Row(
            spacing: 10,
            children: [
              IconButton(
                onPressed: () {
                  () => Navigator.pushNamed(context, '/home');
                },
                icon: Icon(Icons.arrow_back_ios, size: 15, color: kcBlack),
              ),
              Text(
                ksYourCart,
                style: TextStyle(
                  fontSize: 18,
                  color: kcBlack,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'IBM Plex Sans',
                ),
              ),
            ],
          ),

          ///body
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (_, index) {
                final product = cartItems[index]['product'] as Product;
                final quantity = cartItems[index]['quantity'] as int;
                return CartItemCard(product: product, quantity: quantity);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ///order info text
                const Text(ksOrderInfo, style: kstOrderTotal),

                ///sub total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(ksSubtotal, style: kstOrderInfo),
                    Text(
                      '\$${subtotal.toStringAsFixed(0)}',
                      style: kstOrderInfo,
                    ),
                  ],
                ),

                ///shipping fee
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(ksShopping, style: kstOrderInfo),
                    Text('\$10', style: kstOrderInfo),
                  ],
                ),

                ///total fee
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(ksTotal, style: kstOrderInfo),
                    Text('\$${total.toStringAsFixed(0)}', style: kstOrderTotal),
                  ],
                ),

                ///cash out button and total
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Checkout successful!')),
                    );
                  },
                  child: Text(
                    '$ksCheckOut (\$${total.toStringAsFixed(0)})',
                    style: kstCashOutAmount,
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
