import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nordic_ecommerce/controllers/product/product_controller.dart';
import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/res/sizes.dart';
import 'package:nordic_ecommerce/res/styles.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> arrayTemp = [
    'Thong tin san pham',
    'Tai lieu ky thuat',
    'Chinh sach bao mat',
    'Bao hanh sua chua'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductController>().getDetailById(widget.product.productId);
    //Call api
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  expandedHeight: MediaQuery.of(context).size.height * 0.45,
                  elevation: 0.1,
                  pinned: true,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Carousel(
                    images: List.generate(
                      widget.product.imagesUrl!.length ?? 0,
                      (index) => CachedNetworkImage(
                        imageUrl: widget.product.imagesUrl![index],
                        fit: BoxFit.fill,
                      ),
                    ),
                    dotSize: 6.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.purple[100]!,
                    dotIncreasedColor: Colors.blue,
                    dotVerticalPadding: AppSize.homeItemPadding,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0),
                    autoplay: false,
                  )),
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: AppSize.paddingSizeS),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(AppSize.paddingSizeM),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.product.name,
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${widget.product.price}',
                                  style: TextStyle(
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {})
                            ]),
                        RichText(
                          text: TextSpan(
                            text: 'Model: ',
                            style: AppStyle.textStyle,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${widget.product.sku}',
                                  style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Kho hàng: ',
                            style: AppStyle.textStyle,
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      'Con ${widget.product.quantity} san pham',
                                  style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text('Van chuyen: '),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          'Mien phi van chuyen cho don hang tu ',
                                      style: AppStyle.textStyle,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '200.000d',
                                            style:
                                                TextStyle(color: Colors.blue)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                      'San pham duoc giao trong vong 24h o Ho Chi Minh, 2-3 ngay vung lan can'),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(AppSize.paddingSizeM),
                    child: Row(
                      children: [
                        Text('So luong: '),
                        Container(
                          margin: EdgeInsets.all(AppSize.homeItemPadding),
                          decoration: BoxDecoration(border: Border.all()),
                          child: Row(children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {},
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            Text('1'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    arrayTemp
                        .map((item) => Column(
                              children: [
                                ListTile(
                                    leading: Text(item),
                                    trailing: Icon(Icons.arrow_forward_ios)),
                                Divider(
                                  color: Colors.grey,
                                )
                              ],
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: TextButton(
                      onPressed: null,
                      child: Column(
                        children: [Icon(Icons.message), Text('Chat ngay')],
                      ),
                    )),
                    Flexible(
                        child: TextButton(
                      onPressed: null,
                      child: Column(
                        children: [Icon(Icons.message), Text('Them gio hang')],
                      ),
                    )),
                    Expanded(
                        child: TextButton(
                            onPressed: null, child: Text('Mua ngay')))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
