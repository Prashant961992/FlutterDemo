import 'dart:convert';

import 'package:demo/AppConstant/MarginsConstant.dart';
import 'package:demo/Controls/MultiSelectionListData.dart';
import 'package:flutter/material.dart';

class MultiSelectionAlert extends StatefulWidget {
  final List<CountryList> listCountryData;
  MultiSelectionAlert({Key key, this.listCountryData}) : super(key: key);

  @override
  _MultiSelectionAlertState createState() => _MultiSelectionAlertState();
}

class _MultiSelectionAlertState extends State<MultiSelectionAlert> {
  // Future<List<CountryList>> loadAsset(BuildContext context) async {
  //   final data = await DefaultAssetBundle.of(context)
  //       .loadString('lib/Controls/Country.json');
  //   final jsonResponse = jsonDecode(data);

  //   List arrData = jsonResponse["countryList"];
  //   List<CountryList> listData = [];
  //   for (var i = 0; i < arrData.length; i++) {
  //      var data = CountryList.fromJson(arrData[i]);
  //      listData.add(data);
  //   }

  //   return listData;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: ,
      initialData: widget.listCountryData,
      builder:
          (BuildContext context, AsyncSnapshot<List<CountryList>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('Loading....'),
          );
        }
        return loadData(snapshot.requireData);
      },
    );
  }

  Widget loadData(List<CountryList> datas) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 1.0,
      backgroundColor: Colors.transparent,
      content: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.teal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 9,
                        child: SingleChildScrollView(
                          child: Text('What is Lorem Ipsum?',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.teal[200],
                )),
            Expanded(
                flex: 7,
                child: Container(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Change as per your requirement
                  width: MediaQuery.of(context).size.width,
                  color: Colors.teal[100],
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: datas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.transparent,
                        // margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        // height: 50,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(datas[index].name),
                              trailing: Checkbox(
                                value: datas[index].isSelected,
                                onChanged: (bool value) {
                                  setState(() {
                                    var selecteddata = datas[index];
                                    selecteddata.isSelected = value;
                                    datas.removeAt(index);
                                    datas.insert(index, selecteddata);
                                  });
                                },
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              height: 1,
                              indent: 15,
                              endIndent: 0,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.teal[200],
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Color(0x00000000),
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {},
                          color: Colors.lightBlueAccent,
                          child: Text('Submit',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
