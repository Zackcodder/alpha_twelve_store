import 'package:alpha_twelve_store/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../viewmodels/cart_provider.dart';
import '../../viewmodels/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product = context.read<ProductViewModel>().getProductById(productId);
    final cart = context.read<CartViewModel>();

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

      body: SingleChildScrollView(
        child: Column(
          children: [
            ///diver line
            Divider(
              color: kcGrey.withOpacity(0.3),
              thickness: 1.0,
              endIndent: 0,
            ),

            ///go back
            Row(
              spacing: 10,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 15, color: kcBlack),
                ),
                Text(
                  ksGoback,
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
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: kcProductBG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///product image
                  Container(
                    height: 331.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(product.imageUrl),
                        fit: BoxFit.contain,
                      ),
                      color: kcGrey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kcWhite,
                            ),
                            child: Image.asset('assets/images/favIcon.png'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///product name
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'IBM Plex Sans',
                        color: kcBlack,
                      ),
                    ),
                  ),

                  ///product price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 32.5,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'IBM Plex Sans',
                        color: kcBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  ///about product text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'About this item',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'IBM Plex Sans',
                        color: kcTextGrey,
                      ),
                    ),
                  ),

                  ///product desc
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'IBM Plex Sans',
                        color: kcTextGrey,
                      ),
                    ),
                  ),

                  ///add to cart button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          cart.addToCart(product.id);
                          Fluttertoast.showToast(
                            msg: "${product.name} $ksAddedToCart",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          ksAddToCart,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'IBM Plex Sans',
                            color: kcWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
