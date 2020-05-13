import 'package:demo/view/layout_type.dart';
import 'package:flutter/material.dart';
//implements HasLayoutGroup
class SliversPage extends StatelessWidget  {
  // SliversPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
  // final LayoutGroup layoutGroup;
  // final VoidCallback onLayoutToggle;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Row(
                  children: <Widget>[
                    Spacer(),
                    CircleAvatar(
                      radius: 54.0,
                      backgroundImage: NetworkImage(
                        "https://placeimg.com/640/480/animals",
                      ),
                    ),
                    Spacer(),
                  ],
                ),
            title: Text('Slivers'),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
               Navigator.pop(context);
            },
            // onPressed: onLayoutToggle,
          )
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}