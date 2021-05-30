import 'package:flutter/material.dart';
import 'package:nordic_ecommerce/res/sizes.dart';
import 'package:nordic_ecommerce/res/styles.dart';

class TestPage extends StatelessWidget {
  List<String> listTemp = [
    'Gia giam dan',
    'Gia tang dan',
    'San pham moi',
    'Ban chay nhat',
    'Pho bien',
    'Sale off 50%',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: TextButton(
          child: Text('Show bottom sheet'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSize.commonBorderRadius),
                      topRight: Radius.circular(AppSize.commonBorderRadius))),
              builder: (context) {
                return Container(
                  // height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.commonBorderRadius),
                          topRight:
                              Radius.circular(AppSize.commonBorderRadius))),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                          title: Text(
                            'Sap xep theo',
                            style: AppStyle.titleTextStyle,
                          ),
                          trailing: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })),
                      Divider(),
                      Expanded(
                        child: ListView.separated(
                          itemCount: listTemp.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                //Handle event here
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: ListTile(
                                  title: Text(listTemp[index]),
                                  trailing: Icon(Icons.arrow_right),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
