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
            header('What is Lorem Ipsum?'),
            search(),
            Expanded(
                flex: 7,
                child: Container(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Change as per your requirement
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: ClampingScrollPhysics(),
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
            footer()
          ],
        ),
      ),
    );
  }

  Widget header(title) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.blueAccent,
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
                  child: Text(title, style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ));
  }

  Widget search() {
    return Expanded(
        flex: 1,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Text('Space for Search Bar'),
        ));
  }

  Widget footer() {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text('Cancel', style: TextStyle(color: Colors.blueGrey)),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blueGrey,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {},
                  color: Colors.lightBlueAccent,
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ));
  }
}
