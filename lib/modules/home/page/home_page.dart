import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:nordic_ecommerce/modules/home/widgets/home_searchbar_widget.dart';
import 'package:nordic_ecommerce/res/sample_value.dart';
import 'package:nordic_ecommerce/res/sizes.dart';
import 'package:nordic_ecommerce/res/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            HomeAvertiseWidget(),
            SizedBox(height: 10),
            homeServiceHeader(),
            SizedBox(height: 10),
            HomeServiceWidget(),
            homeProductHeader(),
            HomeProductWidget(),
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

class HomeAvertiseWidget extends StatelessWidget {
  const HomeAvertiseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.0,
        // padding: EdgeInsets.all(10),
        // width: 350.0,
        child: Carousel(
          images: [
            homeAdvertiseItem(
                imageUrl:
                    'https://salt.tikicdn.com/cache/w394/ts/banner/4b/41/04/e51b9f9aa9732b4457e993bd79b9645b.png.jpg'),
            homeAdvertiseItem(
                imageUrl:
                    'https://salt.tikicdn.com/cache/w394/ts/banner/8b/98/09/ad3d7ade0ca2c1821c672115c41fa661.png.jpg'),
          ],
          dotSize: 6.0,
          dotSpacing: 15.0,
          dotColor: Colors.purple[100]!,
          dotIncreasedColor: Colors.blue,
          dotVerticalPadding: AppSize.homeItemPadding,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.purple.withOpacity(0),
        ));
  }

  Widget homeAdvertiseItem({required String imageUrl}) {
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

class HomeServiceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listHomeService.length,
          itemBuilder: (context, index) => homeServiceItem(
              listHomeService[index].imageUrl,
              listHomeService[index].serviceName)),
    );
  }

  Widget homeServiceItem(String imageUrl, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Card(
            // with Card

            child: Image.network(imageUrl),
            elevation: 18.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}

class HomeProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(AppSize.homeItemPadding),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      children: List.generate(
          listHomeProduct.length, (index) => homeProductItem(index)),
    ));
  }

  Widget homeProductItem(int index) {
    return Container(
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
                listHomeProduct[index].imageUrl,
                fit: BoxFit.fill,
              )),
          SizedBox(height: 5),
          Expanded(
              flex: 1,
              child: Text(
                listHomeProduct[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 5),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppSize.commonBorderRadius),
                  color: listHomeProduct[index].subTitle != null
                      ? Colors.green
                      : Colors.transparent),
              child: Text(
                listHomeProduct[index].subTitle ?? '',
                style: TextStyle(
                    color: listHomeProduct[index].subTitle != null
                        ? Colors.white
                        : Colors.transparent),
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
