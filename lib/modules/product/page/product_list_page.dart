import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nordic_ecommerce/controllers/home/home_controller.dart';
import 'package:nordic_ecommerce/controllers/product/product_controller.dart';
import 'package:nordic_ecommerce/data/models/home_category.dart';
import 'package:nordic_ecommerce/modules/product/models/product_item.dart';
import 'package:nordic_ecommerce/res/colors.dart';
import 'package:nordic_ecommerce/res/sample_value.dart';
import 'package:nordic_ecommerce/res/sizes.dart';

class ProductListPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // handle the press
            Navigator.pop(context);
          },
        ),
        title: Text('Hệ thống báo động'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [ProductListFilter(), ProductListGridView()],
        ),
      )),
    );
  }
}

class ProductListFilter extends StatelessWidget {
  const ProductListFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kSecondaryColor,
      height: 50,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.swap_vert,
              color: AppColor.kprimaryColor,
              size: 30,
            ),
            onPressed: () {
              // handle the press
            },
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all()),
            child: TextButton.icon(
              icon: Icon(
                Icons.arrow_drop_down,
              ),
              label: Text(
                'Bộ lọc',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                // handle the press
              },
            ),
          ),
          Spacer(),
          TextButton.icon(
            icon: Icon(
              Icons.filter_alt,
              size: 30,
            ),
            label: Text(
              'Bộ lọc',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
    );
  }
}

class ProductListGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: GetX<ProductController>(
      builder: (c) {
        c.subCategories = Get.find<HomeController>().selectedCatalog;
        return GridView.count(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(AppSize.homeItemPadding),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          children: List.generate(listProductCamera.length,
              (index) => productItem(context, listProductCamera[index])),
        );
      },
    ));
  }

  Widget productItem(BuildContext context, ProductItem item) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.commonBorderRadius),
        child: Container(
          color: AppColor.kSecondaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.salePercent != null
                  ? Container(
                      width: 60,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10))),
                      child: Text(
                        '${item.salePercent}%',
                      ),
                    )
                  : SizedBox(
                      height: 30,
                    ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppSize.paddingSizeM),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            flex: 8,
                            child: Image.network(
                              item.imageUrl,
                              fit: BoxFit.fill,
                            )),
                        const SizedBox(height: AppSize.sizedBoxHeightS),
                        Expanded(
                            flex: 2,
                            child: Text(
                              item.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            )),
                        const SizedBox(height: AppSize.sizedBoxHeightS),
                        Flexible(
                            flex: 1,
                            child: Wrap(
                              children: [
                                Text(
                                  '${item.currentPrice * 1000000}đ',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                                SizedBox(width: AppSize.sizeBoxWidthS),
                                Text(
                                  item.oldPrice != null
                                      ? '${item.oldPrice}đ'
                                      : '',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 12),
                                )
                              ],
                            )),
                        const SizedBox(height: AppSize.sizedBoxHeightM),
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${item.star.toStringAsFixed(1)}',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: AppSize.sizeBoxWidthS),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            )
                          ],
                        )),
                        const SizedBox(height: AppSize.sizedBoxHeightS),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        //handle onTap
      },
    );
  }
}
