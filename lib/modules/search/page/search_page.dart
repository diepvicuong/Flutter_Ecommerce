import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nordic_ecommerce/controllers/product/product_controller.dart';
import 'package:nordic_ecommerce/controllers/search/search_controller.dart';
import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/data/provider/api.dart';
import 'package:nordic_ecommerce/data/provider/share_preference.dart';
import 'package:nordic_ecommerce/data/repository/product_repository.dart';
import 'package:nordic_ecommerce/modules/home/widgets/home_searchbar_widget.dart';
import 'package:nordic_ecommerce/modules/home/widgets/loading_widget.dart';
import 'package:nordic_ecommerce/modules/product/page/product_list_page.dart';
import 'package:nordic_ecommerce/res/sizes.dart';
import 'package:nordic_ecommerce/res/utils/string_util.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Get.find<SearchController>().initController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Tim kiem'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSize.homeItemPadding),
                  child: CustomSearchBar(
                    hintText: 'Tim kiem san pham',
                    elevation: 5.0,
                    onChanged: (value) {
                      print(value);
                    },
                    onFieldSubmitted: (value) async {
                      Get.find<SearchController>().searchProductByStr(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RecentSearchWidget(),
                Padding(
                  padding: const EdgeInsets.all(AppSize.homeItemPadding),
                  child: resultSearchWidget(),
                ),
              ],
            ),
          ),
          Obx(() => Get.find<ProductController>().isLoading.value
              ? LoadingWidget()
              : SizedBox()),
        ],
      ),
    );
  }

  List<String> sampleRecentSearch = [
    'Camera',
    'ban phim',
    'bo tu',
    'bo kiem soat',
    'ban ghe',
    'may lanh',
    'tu lanh'
  ];

  List<String> sampleResultSearch = ['ronaldo', 'messi', 'rooney'];

  Widget recentSearchWidget() {
    final recentStr = Get.find<SearchController>().recentStr;
    if (recentStr.length > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSize.homeItemPadding),
            child: Text('Tim kiem gan day'),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentStr.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.sizeBoxWidthM),
                      child: Chip(
                        label: Text(
                          recentStr[index],
                        ),
                        elevation: 5,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget resultSearchWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: sampleResultSearch.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: AppSize.sizeBoxWidthS,
          leading: Icon(Icons.search),
          title: Text(sampleResultSearch[index]),
        );
      },
    );
  }
}

class RecentSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<SearchController>(
      builder: (controller) {
        final recentStr = controller.recentStr;
        if (recentStr.length > 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.homeItemPadding),
                child: Text('Tim kiem gan day'),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recentStr.length,
                  itemBuilder: (context, index) {
                    final searchStr = recentStr[index];
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.find<SearchController>()
                                .searchProductByStr(searchStr);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.sizeBoxWidthM),
                            child: Chip(
                              label: Text(
                                searchStr,
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
