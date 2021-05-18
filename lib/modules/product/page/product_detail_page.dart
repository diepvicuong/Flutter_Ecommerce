import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:nordic_ecommerce/res/sizes.dart';

class ProductDetailPage extends StatefulWidget {
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
                    images: [
                      Image.network(
                        'https://salt.tikicdn.com/cache/280x280/ts/product/96/08/ed/23722e613ec38abc946a4ff897e06ff2.jpg',
                        fit: BoxFit.fill,
                      ),
                      Image.network(
                        'https://salt.tikicdn.com/cache/280x280/ts/product/7f/16/7d/a28d8427482d40ba39e1e0b9966e7c88.jpg',
                        fit: BoxFit.fill,
                      )
                    ],
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
                      Navigator.of(context).pop();
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
                          'Bộ camera giám sát',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('2.718.000đ',
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
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'NX-6-KIT',
                                  style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Kho hàng: ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Con 100 san pham',
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
                                      style: DefaultTextStyle.of(context).style,
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
                            Text('2'),
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
