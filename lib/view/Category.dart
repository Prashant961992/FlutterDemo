import 'package:demo/Controls/AppBarData.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> listHeaderData = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarData(
          isShowBack: true,
          screenTitle: 'Category',
          onMenuTap: () {
            // _scaffoldKey.currentState.openDrawer();
          },
        ),
        body: ListView.builder(
          shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: listHeaderData.length,
            itemBuilder: (BuildContext context, int headerindex) {
              return Column(
                children: <Widget>[
                  ProductHeader(
                    textTitle: listHeaderData[headerindex],
                    onMoreTap: () {
                      print(headerindex);
                    },
                  ),
                  Container(
                    height: 282,
                    child: ListView.builder(
                      shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: 50,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(
                            onCardTap: () {
                              print(
                                  "Header Index: $headerindex Column : $index");
                            },
                          );
                        }),
                  ),
                ],
              );
            }));
  }
}

class ProductCard extends StatelessWidget {
  final VoidCallback onCardTap;
  const ProductCard({Key key, this.onCardTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        width: 200,
        child: InkWell(
          onTap: onCardTap,
          child: Card(
            elevation: 2,
            color: Colors.grey[200],
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: FadeInImage.assetNetwork(
                      fit: BoxFit.fill,
                      // alignment: Alignment.topLeft,
                      width: 200,
                      height: 200,
                      placeholder: 'Images/download.jpeg',
                      image:
                          'https://graphicriver.img.customer.envatousercontent.com/files/122132868/pv_590.jpg?auto=compress%2Cformat&fit=crop&crop=top&w=590&h=590&s=2d2b2593a505af5d574aefe6d7175189'),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // height: 30,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    alignment: Alignment.bottomLeft,
                    child: Text('Lorem Ipsum is', maxLines: 2),
                  ),
                ),
                Expanded(
                  flex: 1,
                    child: Container(
                      // height: 30,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  alignment: Alignment.bottomLeft,
                  child: Text('Sub Title', textAlign: TextAlign.left),
                )),
                Expanded(
                  flex: 1,
                  child: Container(
                    // height: 30,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  alignment: Alignment.bottomLeft,
                  child: Text('233', textAlign: TextAlign.left),
                ))
              ],
            ),
          ),
        ));
  }
}

class ProductHeader extends StatelessWidget {
  final String textTitle;
  final VoidCallback onMoreTap;
  const ProductHeader({Key key, this.textTitle, this.onMoreTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(flex: 8, child: Text(textTitle, textAlign: TextAlign.left)),
          Center(
            child: InkWell(
              onTap: onMoreTap,
              child: Icon(Icons.arrow_forward_ios),
            ),
          )
        ],
      ),
    );
  }
}
