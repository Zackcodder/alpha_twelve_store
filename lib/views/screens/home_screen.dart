import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/string.dart';
import '../../viewmodels/products_provider.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductViewModel>().products;

    return Scaffold(
      backgroundColor: kcWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kcWhite,
        title: Column(
          spacing: 10,
          children: [
            ///delivery address text
            const Text(
              ksDeliveryAddress,
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'IBM Plex Sans',
                fontWeight: FontWeight.w600,
                color: kcGrey,
              ),
            ),
            ///delivery address location text
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
          ///notification icon
          SvgPicture.asset(
            'assets/svgs/notificationIcon.svg',
            height: 24,
            width: 24,
            color: Colors.black, 
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: Container(
        color: kcWhite,
        child: ListView(
          children: [
            ///search text field
            Container(
              margin: EdgeInsets.all(15),
              height: 44,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: kcGrey.withOpacity(0.1)),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: ksSearch,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: kcGrey),
                ),
              ),
            ),

            ///diver line
            Divider(
              color: kcGrey.withOpacity(0.3),
              thickness: 1.0,
              endIndent: 0,
            ),

            ///header
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.arrow_back_ios, size: 15, color: kcBlack),
                  Text(
                    ksTech,
                    style: TextStyle(
                      fontSize: 18,
                      color: kcBlack,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'IBM Plex Sans',
                    ),
                  ),
                ],
              ),
            ),
            ///subheader and body
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              color: kcProductBG,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///subheader
                  Text(
                    ksSmartPhonesandCo,
                    style: TextStyle(
                      fontSize: 18,
                      color: kcBlack,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'IBM Plex Mono',
                    ),
                  ),

                  ///product list
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.65,
                          ),
                      itemBuilder: (_, index) {
                        return ProductCard(product: products[index]);
                      },
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
