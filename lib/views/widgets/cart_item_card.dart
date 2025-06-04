import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../core/models/products_model.dart';
import '../../viewmodels/cart_provider.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItemCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartViewModel>();

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          spacing: 12,
          children: [
            ///product image
            Image.asset(product.imageUrl, height: 80, width: 80),

            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///product name
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: kcGrey,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),

                  ///product price
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 17,
                      color: kcGrey,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),

                  ///in stock status
                  const Text(
                    'In stock',
                    style: TextStyle(
                      fontSize: 12,
                      color: kcGreen,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                  const SizedBox(height: 8),

                  ///increase and reudce number of item
                  Row(
                    children: [
                      ///reduce item button
                      _quantityButton(
                        icon: Icons.remove,
                        color: kcGrey.withOpacity(0.3),
                        onPressed: () => cart.decrementQuantity(product.id),
                      ),

                      ///total number of items
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: kcGreen,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SF Pro Text',
                          ),
                        ),
                      ),

                      ///increase button
                      _quantityButton(
                        icon: Icons.add,
                        color: kcWhite,
                        onPressed: () => cart.incrementQuantity(product.id),
                      ),
                      const Spacer(),

                      ///delete button
                      GestureDetector(
                        onTap: () => cart.removeFromCart(product.id),

                        child: Container(
                          height: 35,
                          width: 36,
                          decoration: BoxDecoration(
                            color: kcWhite,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svgs/deleteIocn.svg',
                              color: kcTextGrey, // optional
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
