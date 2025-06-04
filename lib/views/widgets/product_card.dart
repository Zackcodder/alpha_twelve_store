import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/models/products_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product.id);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///product image
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(product.imageUrl, fit: BoxFit.cover),
            ),

            ///product name
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'IBM Plex Sans',
                color: kcBlack,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            ///product amount
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'IBM Plex Sans',
                color: kcBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
