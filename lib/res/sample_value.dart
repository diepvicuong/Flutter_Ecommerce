import 'package:nordic_ecommerce/modules/home/models/home_product_model.dart';
import 'package:nordic_ecommerce/data/models/home/home_service.dart';
import 'package:nordic_ecommerce/modules/product/models/product_item.dart';

List<HomeService> listHomeService = [
  HomeService(
      imageUrl:
          'https://salt.tikicdn.com/cache/w295/ts/banner/d3/f9/56/3d60e02f306cbb57d8a5abadd69736c5.png.jpg',
      title: 'Nguyên lí hoạt động'),
  HomeService(
      imageUrl:
          'https://salt.tikicdn.com/cache/w295/ts/banner/18/b9/b3/ddef93f23bdc48e020c14c08bcd00499.png.jpg',
      title: 'Thiết bị cảnh báo'),
  HomeService(
      imageUrl:
          'https://salt.tikicdn.com/cache/w295/ts/banner/e4/21/4e/f394a552921658d4011b8d0dba2e9f61.png.jpg',
      title: 'Camera an ninh'),
];

List<HomeProduct> listHomeProduct = [
  HomeProduct(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/a5/b9/39/e7b832ecab81e27ccec5edcd85107a31.png',
      title: 'Camera Mini'),
  HomeProduct(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/55/d7/f5/d17510a27c2ef3a7a3286a0afde56dc1.png',
      title: 'Camera IP Wifi Ngoai Troi'),
  HomeProduct(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/7f/16/7d/a28d8427482d40ba39e1e0b9966e7c88.jpg',
      title: 'Camera Yoosee',
      subTitle: 'SP Chinh'),
  HomeProduct(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/96/08/ed/23722e613ec38abc946a4ff897e06ff2.jpg',
      title: 'Camera ABC'),
  HomeProduct(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/d9/56/7a/7b0efef6d2c273def5f9a14c2f7f4f9c.jpg',
      title: 'Vstarcam'),
  HomeProduct(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/3b/31/f9/333f222650dc3d06e00c21c80466d3f9.png',
      title: 'Camera XYZ'),
];

List<ProductItem> listProductCamera = [
  ProductItem(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/a5/b9/39/e7b832ecab81e27ccec5edcd85107a31.png',
      name: 'Camera Mini',
      currentPrice: 2.75,
      oldPrice: 2.958,
      salePercent: 7),
  ProductItem(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/55/d7/f5/d17510a27c2ef3a7a3286a0afde56dc1.png',
      name: 'Camera IP Wifi Ngoai Troi',
      currentPrice: 2.718),
  ProductItem(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/7f/16/7d/a28d8427482d40ba39e1e0b9966e7c88.jpg',
      name: 'Camera Yoosee',
      currentPrice: 2.398,
      star: 4.0,
      salePercent: 17),
  ProductItem(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/96/08/ed/23722e613ec38abc946a4ff897e06ff2.jpg',
      name: 'Camera ABC',
      currentPrice: 3.0,
      star: 5.0),
  ProductItem(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/7f/16/7d/a28d8427482d40ba39e1e0b9966e7c88.jpg',
      name: 'Camera Yoosee',
      currentPrice: 2.398,
      star: 4.0),
  ProductItem(
      imageUrl:
          'https://salt.tikicdn.com/cache/280x280/ts/product/96/08/ed/23722e613ec38abc946a4ff897e06ff2.jpg',
      name: 'Camera ABC',
      currentPrice: 3.0,
      star: 5.0,
      salePercent: 20),
];
