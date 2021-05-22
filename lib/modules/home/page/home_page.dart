import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nordic_ecommerce/bindings/product_binding.dart';
import 'package:nordic_ecommerce/controllers/home/home_controller.dart';
import 'package:nordic_ecommerce/data/models/home/home_category.dart';
import 'package:nordic_ecommerce/modules/home/widgets/home_searchbar_widget.dart';
import 'package:nordic_ecommerce/modules/home/widgets/loading_widget.dart';
import 'package:nordic_ecommerce/modules/product/page/product_list_page.dart';
import 'package:nordic_ecommerce/res/sample_value.dart';
import 'package:nordic_ecommerce/res/sizes.dart';
import 'package:nordic_ecommerce/res/styles.dart';
import 'package:nordic_ecommerce/routes/app_pages.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.network(
              'https://salt.tikicdn.com/cache/280x280/ts/product/43/9a/bf/55d7e66b492fdbed1f3a55cf4602ec3a.jpg'),
        ),
        titleSpacing: 5.0,
        title: CustomSearchBar(),
        actions: [
          IconButton(
            icon: Icon(Icons.phone_in_talk),
            tooltip: 'Make a call',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeSliderWidget(),
            const SizedBox(height: AppSize.sizedBoxHeightM),
            homeServiceHeader(),
            const SizedBox(height: AppSize.sizedBoxHeightM),
            HomeServiceWidget(),
            homeProductHeader(),
            HomeCatalogWidget(),
          ],
        ),
      ),
    );
  }

  Widget homeServiceHeader() {
    return ListTile(
      leading: Icon(
        Icons.verified_user,
        size: 30,
        color: Colors.green,
      ),
      title: Text(
        'Dịch vụ cảnh báo',
        style: AppStyle.titleTextStyle,
      ),
    );
  }

  Widget homeProductHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Danh mục sản phẩm ',
          style: AppStyle.titleTextStyle,
        ),
        Row(
          children: [
            Text(
              'Xem tất cả',
              style: TextStyle(color: Colors.blue),
            ),
            // SizedBox(width: 5),
            Icon(
              Icons.arrow_right,
              size: 30,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}

class HomeSliderWidget extends GetView<HomeController> {
  const HomeSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return SizedBox(
            height: 200.0,
            child: Carousel(
              images: controller.homeModel.homeSliders != null
                  ? List.generate(
                      controller.homeModel.homeSliders!.length,
                      (index) => homeSliderItem(
                          imageUrl:
                              controller.homeModel.homeSliders![index].image))
                  : [LoadingWidget()],
              dotSize: 6.0,
              dotSpacing: 15.0,
              dotColor: Colors.purple[100]!,
              dotIncreasedColor: Colors.blue,
              dotVerticalPadding: AppSize.homeItemPadding,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.purple.withOpacity(0),
            ));
      },
    );
  }

  Widget homeSliderItem({required String imageUrl}) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.homeItemPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class HomeServiceWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * AppSize.ratioHomeService,
      child: GetX<HomeController>(
        initState: (state) {
          Get.find<HomeController>().getAll();
        },
        builder: (_) {
          return _.homeModel.homeServices == null
              ? LoadingWidget()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _.homeModel.homeServices!.length,
                  itemBuilder: (context, index) => homeServiceItem(
                      _.homeModel.homeServices![index].imageUrl,
                      _.homeModel.homeServices![index].title));
        },
      ),
    );
  }

  Widget homeServiceItem(String imageUrl, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Card(
            child: Image.network(
              imageUrl,
              height: Get.height * AppSize.ratioHomeService - 50,
              width: Get.width * 0.8,
              fit: BoxFit.fill,
            ),
            elevation: 18.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
          const SizedBox(height: AppSize.sizedBoxHeightM),
          Text(title),
        ],
      ),
    );
  }
}

class HomeCatalogWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(child: GetX<HomeController>(
      builder: (c) {
        return GridView.count(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(AppSize.homeItemPadding),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          children: c.homeModel.homeCategories != null
              ? List.generate(
                  c.homeModel.homeCategories!.length,
                  (index) => homeCatalogItem(
                      context, index, c.homeModel.homeCategories![index]))
              : [LoadingWidget()],
        );
      },
    ));
  }

  Widget homeCatalogItem(BuildContext context, int index, HomeCategory item) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                right: (index % 2 == 0)
                    ? BorderSide(width: 0.4, color: Colors.grey)
                    : BorderSide(width: 0.4, color: Colors.white),
                bottom: (listHomeProduct.length - index <= 2)
                    ? BorderSide(width: 0.4, color: Colors.white)
                    : BorderSide(width: 0.4, color: Colors.grey))),
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.fill,
                )),
            const SizedBox(height: AppSize.sizedBoxHeightS),
            Expanded(
                flex: 1,
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: AppSize.sizedBoxHeightS),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppSize.commonBorderRadius),
                    color:
                        item.desc != null ? Colors.green : Colors.transparent),
                child: Text(
                  item.desc,
                  style: TextStyle(
                      color: item.desc != null
                          ? Colors.white
                          : Colors.transparent),
                ),
              ),
            ),
            const SizedBox(height: AppSize.sizedBoxHeightS),
          ],
        ),
      ),
      onTap: () {
        Get.to(ProductListPage(selectedCategory: item));
      },
    );
  }
}
