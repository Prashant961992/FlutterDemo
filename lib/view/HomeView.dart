import 'package:demo/BaseClass/BaseView.dart';
import 'package:demo/Controls/SlideRightRoute.dart';
import 'package:demo/Localization/AppTranslations.dart';
import 'package:demo/view/Category.dart';
import 'package:demo/view/PPGridView.dart';
import 'package:demo/view/PPGridViewBuilder.dart';
import 'package:demo/view/PPGridViewCount.dart';
import 'package:demo/view/PPGridViewCustom.dart';
import 'package:demo/view/PPGridViewExtent.dart';
import 'package:demo/view/PPListView.dart';
import 'package:demo/view/PPListViewBuilder.dart';
import 'package:demo/view/PPListViewCustom.dart';
import 'package:demo/view/PPListViewSeparator.dart';
import 'package:demo/view/PPPageView.dart';
import 'package:demo/view/SliversPage.dart';
import 'package:demo/view/jsontoform/json_forms.dart';
import 'package:demo/view/custompullrefresh/list_users.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomeView extends BaseView {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView> with BasePage {
  List<String> listData = [
    'GridView',
    'GridView Count',
    'GridView Builder',
    'GridView Custom',
    'GridView Extent',
    'ListView',
    'ListView Builder',
    'ListView Custom',
    'ListView Separated',
    'Silver List(Custom Scroll View)',
    'Pagination View',
    'Category Product View',
    'Json to form',
    'custom pull to refresh',
  ];

  @override
  AppBarLeadingButton isShowBackButton() {
    return AppBarLeadingButton.Menu;
  }

  @override
  String screenName() {
    return AppTranslations.of(context).text("key_home");
  }

  @override
  void callBack() {
    print("Create Call Back");
  }

  @override
  Widget body() {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              onTap: () {
                didTapAtIndex(index);
              },
              title: Text(listData[index]),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        });
  }

  void didTapAtIndex(int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PPGridView()));
        break;
      case 1:
        Navigator.of(context).push(SlideRightRoute(
          widget: PPGridViewCount(),
        )
            // MaterialPageRoute(
            //   builder: (context) => PPGridViewCount()
            // )
            );
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PPGridViewBuilder()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PPGridViewCustom()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PPGridViewExtent()));
        break;
      case 5:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PPListView()));
        break;
      case 6:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PPListViewBuilder()));
        break;
      case 7:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PPListViewCustom()));
        break;
      case 8:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PPListViewSeparator()));
        break;
      case 9:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SliversPage()));
        break;
      case 10:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PPPageView()));
        break;
      case 11:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Category()));
        break;
      case 12:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => JsonForm()));
        break;
        case 13:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UserList()));
        break;
      default:
    }
  }
}
