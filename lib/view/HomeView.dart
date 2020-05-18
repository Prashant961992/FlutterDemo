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
import 'package:flutter/material.dart';

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
    'Category Product View'
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

      default:
    }
  }
}

// class GetChuckCategories extends StatefulWidget {
//   @override
//   _GetChuckyState createState() => _GetChuckyState();
// }

// class _GetChuckyState extends State<GetChuckCategories> {
//   ChuckCategoryBloc _bloc;

//   @override
//   void initState() {
//     super.initState();
//     _bloc = ChuckCategoryBloc();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         automaticallyImplyLeading: false,
//         title: Text('Chucky Categories',
//             style: TextStyle(color: Colors.white, fontSize: 20)),
//         backgroundColor: Color(0xFF333333),
//       ),
//       backgroundColor: Color(0xFF333333),
//       body: RefreshIndicator(
//         onRefresh: () => _bloc.fetchCategories(),
//         child: StreamBuilder<Response<chuckCategories>>(
//           stream: _bloc.chuckListStream,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               switch (snapshot.data.status) {
//                 case Status.LOADING:
//                   return Loading(loadingMessage: snapshot.data.message);
//                   break;
//                 case Status.COMPLETED:
//                   return CategoryList(categoryList: snapshot.data.data);
//                   break;
//                 case Status.ERROR:
//                   return Error(
//                     errorMessage: snapshot.data.message,
//                     onRetryPressed: () => _bloc.fetchCategories(),
//                   );
//                   break;
//               }
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
// }

// class CategoryList extends StatelessWidget {
//   final chuckCategories categoryList;

//   const CategoryList({Key key, this.categoryList}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       backgroundColor: Color(0xFF202020),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 0.0,
//                 vertical: 1.0,
//               ),
//               child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) =>
//                             ShowChuckyJoke(categoryList.categories[index])));
//                   },
//                   child: SizedBox(
//                     height: 65,
//                     child: Container(
//                       color: Color(0xFF333333),
//                       alignment: Alignment.center,
//                       child: Padding(
//                         padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
//                         child: Text(
//                           categoryList.categories[index],
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w100,
//                               fontFamily: 'Roboto'),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ),
//                   )));
//         },
//         itemCount: categoryList.categories.length,
//         shrinkWrap: true,
//         physics: ClampingScrollPhysics(),
//       ),
//     );
//   }
// }
